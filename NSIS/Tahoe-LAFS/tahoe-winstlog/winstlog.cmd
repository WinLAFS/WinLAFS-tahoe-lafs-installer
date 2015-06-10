@echo off
path c:\python27;c:\python27\Scripts;%path%
cls
color 0F
echo This will install Tahoe-LAFS 1.10.1a1.post12
echo it may not work after installation already failed
echo press the anykey button
pause
color 07
rem test home-directory location
If Exist Tahoe.home. goto usage
If Exist ..\Tahoe.home. goto gohome
cls
color 0E
echo please copy the tahoe-winstlog directory 
echo in the home directory of Tahoe-Lafs 1.10.1a1
echo installation failed
echo press the anykey button
pause
color 07
goto exit

:gohome
rem goto the home-directory
cd..

:usage
cls
color F0
echo we are in the right directory
echo i start now the installscript of 
echo Tahoe-LAFS 1.10.1a1.post12
echo will last 3-5 Min
echo press the anykey button
pause 
color 07

python setup.py build | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-install.log
echo press the anykey button
pause 
cls
color 0E

echo Tahoe-Lafs Python-binary is build
echo Please restart Windows or 
echo logout your user account and login again
echo Start the test-script at 
echo Windows/Start/Programms/Tahoe-LAFS/Tahoe-LAFS-Test (.cmd)
echo Windows/Start/Programms/Tahoe-LAFS-Test (.cmd)


pause
:exit
