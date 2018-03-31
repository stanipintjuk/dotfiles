#Cut a video file into pieces
infile="$1"
from="$2"
to="$3"
filename=$(basename "$infile")
extension="${filename##*.}"
filename="${filename%.*}"


outfile=$4

ffmpeg -i $infile -acodec copy -vcodec copy -ss $from -t $to $outfile
