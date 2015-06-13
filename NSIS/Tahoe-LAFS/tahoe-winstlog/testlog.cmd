@echo off
path c:\python27;c:\python27\Scripts;%path%
cls
color 0F
echo This will Test Tahoe-LAFS 1.10.1b1
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
echo in the home directory of Tahoe-Lafs 1.10.1a1.post12
echo installation failed
echo press the anykey button
pause
color 07
goto exit

:gohome
rem goto the home-directory
cd..
If Exist Tahoe.home. goto usage
cd c:\software\Tahoe-LAFS
If Exist Tahoe.home. goto usage
cd d:\software\Tahoe-LAFS
If Exist Tahoe.home. goto usage
cd e:\software\Tahoe-LAFS
If Exist Tahoe.home. goto usage
cd f:\software\Tahoe-LAFS
If Exist Tahoe.home. goto usage
cd g:\software\Tahoe-LAFS
If Exist Tahoe.home. goto usage

echo can't find the tahoe-lafs directory
echo read .\Tahoe-LAFS\Quickstart.rst
echo to continue
pause
goto exit


:usage
cls
color F0
echo we are in the right directory
echo i start now the Test-script of 
echo Tahoe-LAFS 1.10.1a1.post12
echo  "                                 "
echo press the anykey button
pause 
cls
color 0E
echo i make a short test of the tahoe binary
pause
color 07
bin\tahoe --version | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-test.log
pause

color F0
echo i open a browser and see the public test grid is online
pause
start " " http://stats.pingdom.com/cvvac5t8l4fv/1300061
echo wait
pause

color 07
python setup.py trial | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-test.log
pause
goto exit

pause

:exit
rem new testgrid adress is not ping able 
rem cls
rem color 0E
echo  start extendet test 15-20 min.
rem ping publictestgrid.e271.net | find "TTL" || goto gridoffline
rem pause
rem :gridoffline
rem cls
rem color 0E
rem echo sorry public test grid of tahoe-lafs seams not reachable
rem echo didn't execute extented test
rem echo  i open a browser then you can see its true