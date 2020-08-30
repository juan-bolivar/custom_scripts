size=$(ps -aux | grep 'ffmpeg'| wc -l)

case $size in

    1) echo ''
       ;;
    2) echo 'Recording'
       ;;
esac
