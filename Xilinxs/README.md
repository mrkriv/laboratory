XIlinx ISE W8-W8.1-W10 x64 FIX

Open the following directory: C:\Xilinx\14.7\ISE_DS\ISE\lib\nt64
Find and rename libPortability.dll to libPortability.dll.orig
Make a copy of libPortabilityNOSH.dll (copy and paste it to the same directory) and rename it libPortability.dll
Copy libPortabilityNOSH.dll again, but this time navigate to C:\Xilinx\14.7\ISE_DS\common\lib\nt64 and paste it there
In C:\Xilinx\14.7\ISE_DS\common\lib\nt64 Find and rename libPortability.dll to libPortability.dll.orig
Rename libPortabilityNOSH.dll to libPortability.dll

Fixing PlanAhead not opening from 64-bit Project Navigator

PlanAhead will not open when you are running 64-bit Project Navigator (e.g. for I/O Pin Planning), it just displays the splash screen but never opens.

To fix it, we have to force PlanAhead to always run in 32-bit mode.

Open C:\Xilinx\14.7\ISE_DS\PlanAhead\bin and rename rdiArgs.bat to rdiArgs.bat.orig
Download the attached zip file
Extract it. You should now have a file named rdiArgs.bat
Copy the new rdiArgs.bat file to C:\Xilinx\14.7\ISE_DS\PlanAhead\bin

Now you should have a working ISE Design Suite on Windows 8 64-bi