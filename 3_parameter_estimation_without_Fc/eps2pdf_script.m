%% Converting all .eps files to .pdf using eps2pdf function

clear,clc,close all

[result,msg] = eps2pdf('ShortPeriodPhugoid1.eps','C:\Program Files\gs\gs9.20\bin\gswin64c.exe',0)