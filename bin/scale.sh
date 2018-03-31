file=$1
newWidth=$2
ffmpeg -i "$file" -vf scale=$newWidth:-1 "w$newWidth-$file"

