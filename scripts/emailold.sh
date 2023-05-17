#! /bin/bash
echo -e "Build..."
JEKYLL_ENV=email bundle exec jekyll build
echo -e "\n${BLUE}inlining styles...${NC}"
juice --preserve-important true --remove-style-tags false --web-resources-images false _site/email/index.html _site/email/index.html.txt
echo -e "Done"
