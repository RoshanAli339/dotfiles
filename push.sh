git add .

DATE=$(date)
COMMIT="git commit -m \"$DATE\""

eval $COMMIT

git push -u origin main
