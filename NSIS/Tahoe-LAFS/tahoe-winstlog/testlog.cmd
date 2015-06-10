@echo off
path c:\python27;c:\python27\Scripts;%path%
cls
color 0F
echo This will Test Tahoe-LAFS 1.10.1a1.post12
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
rem new testgrid adress is not ping able 
rem cls
rem color 0E
echo  start extendet test 15-20 min.
rem ping publictestgrid.e271.net | find "TTL" || goto gridoffline
rem pause
color 07
python setup.py trial | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-test.log

goto exit
:gridoffline
rem new testgrid adress is not ping able so also new http://stats.pingdom.com will not work
cls
color 0E
echo sorry public test grid of tahoe-lafs seams not reachable
echo didn't execute extented test
echo  i open a browser then you can see its true
pause
color 07
start " " http://stats.pingdom.com/cvvac5t8l4fv/1300061
echo wait
pause
:exit
