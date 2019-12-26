echo What is your video file called?
read video
echo How many FPS do you want?
read fps

ffmpeg -i $video %01d.jpg -hide_banner


list=`ls | wc -l`
one=2

count=$((list-one))

#BADPNG
i=1
while [ $i -le $count ]
do
  echo "./badpng $i.jpg $i.png"
  i=$(( $i + 1 ))
done > bad.sh

chmod +x bad.sh
./bad.sh



ffmpeg -r 1 -pattern_type glob -i '*.png' -c:v libx264 in.mp4


mencoder -fps $fps/1.001 -oac copy -ovc copy -o FINAL.mp4 in.mp4

rm *.jpg
rm *.png
rm in.mp4
