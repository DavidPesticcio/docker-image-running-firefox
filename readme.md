To use this utility:

 - docker build -t firefox1604 .

 - docker run -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox1604

