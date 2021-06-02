@echo off
rd /s /q runtime
mkdir runtime
echo "">runtime/.htaccess
cd public
rd /s /q tmp
mkdir tmp
echo "">tmp/.empty
cd ../
git add --all
git commit -am "modify by Nicky"
git push origin master
