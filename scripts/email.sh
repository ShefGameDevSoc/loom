#! /bin/bash
juice --preserve-important true --remove-style-tags false --web-resources-images false _site/email/index.html _site/email/index.html.txt
echo -e "Done"
