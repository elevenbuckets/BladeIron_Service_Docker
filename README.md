## How to run:

Assuming user installing and setup all 11BE config files under ***single*** folder under __/home/username/elevenbuckets__, and has geth datadir under __/home/username/elevenbuckets/.ethereum__:

```
docker run --rm -it \
-v "/home/username/elevenbuckets:/home/username/elevenbuckets:z" \
-v "/home/username/elevenbuckets/.local:/data/11be/.local:z" \
bladeiron_service /home/username/elevenbuckets
```
#### Note that .local (bootstrap) needs to be explicitly mounted
For now things has to be done manually, but CP setup should allow automatic docker command-line script to be generated accordingly.

### Integrate with exsiting setup on host 

As a temporary workaround to integrate with exsiting setup on host, one can also choose to bind the whole user home directory into docker image:

```
docker run --rm -it \
-v "/home/jasonlin:/home/jasonlin:z" \
-v "/home/jasonlin/11be/.local:/home/jasonlin/11be/.local:z" \
bladeiron_service /home/jasonlin
```
