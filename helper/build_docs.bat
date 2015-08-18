@echo off

rem Ensure ddox is built
cd /D %4
dub build

rem Build docs
echo Generating instauser-%1 docs...
cd /D %2
rdmd -I..\InstaUser-Basic\src -I..\InstaUser-Store\src -I..\InstaUser-Web\src -Ires -Jres --build-only --force -c -Dddocs_tmp -X -Xfdocs\docs.json -version=InstaUser_Docs src\instauser\%1\package.d
rmdir /S /Q docs_tmp > NUL 2> NUL
del src\instauser\%1\package.exe
%4\ddox filter docs\docs.json --min-protection=Protected
%4\ddox generate-html docs\docs.json docs\public --navigation-type=ModuleTree