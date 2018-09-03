sudo apt-get install x11-xserver-utils
xhost +
docker run -it -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v $PWD/project:/ds -e DISPLAY=$DISPLAY docker-ds
# --device=/dev/video0:/dev/video0
# docker run -it -p 8888:8888 -v $PWD/scripts:/ds tutorial /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY
# apt-get install xserver-xorg xorg jwm
