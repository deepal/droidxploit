#!/usr/bin/python
import sys, os, subprocess
sys.path.append("/home/deepal/android/workspace/DroidXploit")
sys.path.append("/home/deepal/git/droidXploit/DroidXploit")

import glob, sqlite3, socket, signal, thread
from collections import OrderedDict
from resources.resources import bcolors

def signalHandler(signum, frame):
    return
    
def injectorHandler():
    print "This is the Malware Injector module"

def scannerHandler():
    print "This is the Scanner module"


def remoteExploitHandler():
    print "This is the Remote Exploitation Module"
    
def helpViewer(basiccmdlist, dbcmdlist):
    print bcolors.OKBLUE+"\nBasic Commands"
    print "----------------"
    for key, value in basiccmdlist.items():
        print "\t",key,"\t\t",value

    print "\nDatabse Commands"
    print "------------------"    
    for key, value in dbcmdlist.items():
        print "\t",key,"\t\t",value
    print bcolors.ENDC

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
    print "Module '"+bcolors.UNDERLINE+moduleName+bcolors.ENDC+"' selected"
    


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

print bcolors.BOLD+logo+bcolors.ENDC

print bcolors.BOLD+"[*] Welcome to DroidXploit\n\n"+bcolors.ENDC

command = ""



basiccmdlist = OrderedDict([("?","View this help page"), ("help","View this help page"),("search","Search for a module"),("use","Go to a module"),("shell {cmd}","Execute a shell command with parameters"),("clear","Clear Screen"),("quit","Exit DroidXploit Framework"),("exit","Exit DroidXploit Framework")])
dbcmdlist = OrderedDict([])
signal.signal(signal.SIGINT, signalHandler)

while command.lower() != "exit" and command.lower()!= "quit":
    col = bcolors()
    command = raw_input(bcolors.HEADER+"droidXploit > "+bcolors.ENDC)
    
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
            print bcolors.FAIL+"[-] Invalid usage of command!\n"+bcolors.ENDC
            continue
        moduleName = command[4:]
        
        if moduleName == "":
            print bcolors.FAIL+"[-] No module specified!\n"+bcolors.ENDC
        useModuleHandler(moduleName)
    
    elif command.lower()[0:5] == "shell":
        shellEx(command.lower()[6:])
        
    elif command.lower() == "clear":
        shellEx("clear")
    
    elif command.lower() == "exit" or command.lower() == "quit" or command.lower() == "":
        prompt = raw_input("Are you sure to exit? (y/n) : ")
        if prompt == "y" or prompt == "Y":
            continue;
        else:
            command = ""
            

    else:
        print col.FAIL+"[-] Command not found !\n"+col.ENDC

    
    




##--------------exiting-------------------------------
print bcolors.OKBLUE+"Returning to shell..\n"+bcolors.ENDC
