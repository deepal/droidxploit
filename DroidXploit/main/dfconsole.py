#!/usr/bin/python
import sys, os, subprocess
sys.path.append("/home/deepal/android/workspace/DroidXploit")
sys.path.append("/home/deepal/git/droidXploit/DroidXploit")

import glob, sqlite3, socket, signal, thread
from collections import OrderedDict
from resources.resources import *

def signalHandler(signum, frame):
    return
    
def injectorHandler():    
    os.chdir("../injector")
    os.system("./injector.py")
    os.chdir("../main")

def scannerHandler():
    print "This is the Scanner module"
    
def rootkitHandler():
    print "This is the rootkit module"


def remoteExploitHandler():
    print "This is the Remote Exploitation Module"
    
def helpViewer(basiccmdlist, dbcmdlist):
    print OKBLUE+"\nBasic Commands"
    print "----------------"
    for key, value in basiccmdlist.items():
        print "\t",key,"\t\t",value

    print "\nDatabse Commands"
    print "------------------"    
    for key, value in dbcmdlist.items():
        print "\t",key,"\t\t",value
    print ENDC

def shellEx(command):
    args = []
    argTuple = command.split(" ")
    args += argTuple
    subprocess.call(args)
    
    

def infoViewer():
    print "--------DroidXploit Android Exploitation Framework-----------------------"

def searchModule():
    pass

def useModuleHandler(moduleName):
    print "Module '"+UNDERLINE+moduleName+ENDC+"' selected"
    if "inject" in moduleName.lower():
        injectorHandler()
    elif "exploit" in moduleName.lower():
        remoteExploitHandler()
    elif "scan" in moduleName.lower():
        scannerHandler()
    elif "rootkit" in moduleName.lower():
        rootkitHandler()
    


logo = "######################################################################\n"\
       "#####              #####        ########      ####                 ###\n"\
       "############  ####   #######   ##########   ######   #################\n"\
       "############  ######   #######   #######   #######   #################\n"\
       "############  #######  ########   #####   ########          ##########\n"\
       "############  #######  ##########   #    #########   #################\n"\
       "############  #######  ###########     ###########   #################\n"\
       "############  ######  ##########        ##########   #################\n"\
       "############  #####  ##########   ####    ########   #################\n"\
       "#######             #########   ########    ######   #################\n"\
       "##########################        ####         ###   #################\n"\
       "######################################################################\n"

print BOLD+logo+ENDC

print BOLD+"[*] Welcome to DroidXploit\n\n"+ENDC

command = ""



basiccmdlist = OrderedDict([("?","View this help page"), ("help","View this help page"),("search","Search for a module"),("use","Go to a module"),("shell {cmd}","Execute a shell command with parameters"),("clear","Clear Screen"),("quit","Exit DroidXploit Framework"),("exit","Exit DroidXploit Framework")])
dbcmdlist = OrderedDict([])
signal.signal(signal.SIGINT, signalHandler)

while command.lower() != "exit" and command.lower()!= "quit":
    col = bcolors()
    command = raw_input(HEADER+"droidXploit > "+ENDC)
    
    if command.lower() == "info":
        infoViewer()
    
    elif command.lower() == "help":
        helpViewer(basiccmdlist, dbcmdlist)
        
    elif command.lower() == "?":
        helpViewer(basiccmdlist, dbcmdlist)
        
    elif command.lower() == "search":
        searchModule()
        
    elif command[0:3] == "use":
        if command[3]!=" ":
            print FAIL+"[-] Invalid usage of command!\n"+ENDC
            continue
        moduleName = command[4:]
        
        if moduleName == "":
            print FAIL+"[-] No module specified!\n"+ENDC
        useModuleHandler(moduleName)
    
    elif command.lower()[0:5] == "shell":
        shellEx(command.lower()[6:])
        
    elif command.lower() == "clear":
        shellEx("clear")
    
    elif command == "":
        continue
    
    elif command.lower() == "exit" or command.lower() == "quit":
        prompt = raw_input("Are you sure to exit? (y/n) : ")
        if prompt == "y" or prompt == "Y":
            continue;
        else:
            command = ""
 
    else:
        print col.FAIL+"[-] Command not found !\n"+col.ENDC

##--------------exiting-------------------------------
print OKBLUE+"Returning to shell..\n"+ENDC
