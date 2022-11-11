# HOW TO USE THIS FILE:

Karabiner elements didn't seem to have any way to use your own "complex", so here's the solution.  Use this, then point the thing at localhost:8080/chrome-karabiner.json
docker run -p 8080:80 -v $PWD:/usr/share/nginx/html -it nginx
