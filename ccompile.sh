FILE=${1::-2}

command='gcc $1 -o output/$FILE -lm'
eval $command
