@echo off

rem Ensure dub-data-mod is built
cd /D %3
dub build

rem Ensure safearg is built
cd /D %4
dub build

rem Compile
cd /D %2
%3bin\dub-data-mod describe -q --compiler=dmd --config=library --data-0 --data=options --data=versions --data=import-paths | %4bin\safearg --post=src\instauser\%1\package.d rdmd --build-only -lib -od. -of%2lib\instauser-%1.lib --force

rem Remove junk that got generated
del package.lib > NUL 2> NUL
