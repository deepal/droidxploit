HEADER = '\033[95m'
OKBLUE = '\033[94m'
OKGREEN = '\033[92m'
WARNING = '\033[93m'
FAIL = '\033[91m'
ENDC = '\033[0m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'

def print_good(displayString):
        print OKGREEN+"[+] "+displayString+ENDC
        
def print_error(displayString):
    print FAIL+"[x] "+displayString+ENDC
    
def print_alert(displayString):
    print WARNING+"[!] "+displayString+ENDC
    
def print_done(displayString):
    print OKBLUE+"[+] "+displayString+ENDC
    
def print_bold(displayString):
    print BOLD+"[+] "+displayString+ENDC
        
class bcolors:
    

    def disable(self):
        self.HEADER = ''
        self.OKBLUE = ''
        self.OKGREEN = ''
        self.WARNING = ''
        self.FAIL = ''
        self.ENDC = ''
        self.BOLD = ''
    
    