@echo off
echo Note: If this fails complaining about unresolved dependencies, run 
echo dub build --vverbose
echo and then ctrl-c when it gets to a loop to seems to take a very long time.
echo "(See <https://github.com/D-Programming-Language/dub/issues/652>)"
echo Then try running run_tests again.

dub build --force --nodeps --config=tests
