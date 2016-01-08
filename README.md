# MDWiki 

This is an image to quickly deploy websites based on [MDWiki](http://dynalon.github.io/mdwiki/#!index.md).  This project is unaffiliated, but does use the official release archives.

Image is available directly from Docker Hub at https://hub.docker.com/r/claremontmckenna/mdwiki/

## How It Works

On image build, the Dockerfile fetches the official binary release from GitHub and extracts it.  

On container run, the mdwiki.html file is copied into the docroot as index.html and served via python's SimpleHTTPServer on port 80.

## Ports and Volumes

Port 80 is exposed.  The app is served from the /md-app on port 80 on container run.

/md-app is defined in the image and is the effective docroot.  It is intended to be specified with -v on run to the location of .md files used to power mdwiki.

## Run Example

This will serve MDWiki on localhost:8000.

```
$ docker run --detach -p 8000:80 -v /path/to/mds:/md-app claremontmckenna/mdwiki
```
