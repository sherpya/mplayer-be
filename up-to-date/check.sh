#!/bin/bash
(
echo '<up-to-date>'
while read package version; do
	uscan $* --timeout 30 --dehs --report --package $package --upstream-version $version --watchfile watchfiles/$package.watch 
done < pkgs.txt
echo '</up-to-date>'
)  > dehs.xml 

#| ./parse.py
