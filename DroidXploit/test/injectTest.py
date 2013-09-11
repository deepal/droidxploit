'''
Created on Aug 13, 2013

@author: deepal
'''
import unittest
import injector.injector as inj, glob


class Test(unittest.TestCase):


    def setUp(self):
        pass


    def tearDown(self):
        pass

    def testName(self):
        pass

    def testDisplayAPKs(self):
        count = 0
        for each in glob.glob("../apks/*.apk"):
            count += 1
        self.assertEqual(len(inj.displayAPKs("../apks/")), count)
    
    
    def testInjectMalware(self):
        pass
    
    def testInjectFiles(self):
        pass
    
    def testUpdateManifest(self):
        pass
    
    def testRecompile(self):
        pass
    
    def testSignApp(self):
        pass
    
    def testInstallMalware(self):
        pass
    
    def testCleanTemp(self):
        pass
    
    def testCheckDirExists(self):
        pass
    
    def testOpenTempDir(self):
        pass
    
    

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()