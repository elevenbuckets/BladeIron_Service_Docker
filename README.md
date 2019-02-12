## How to run:

Assuming user installing and setup all 11BE config files under ***single*** folder under /home/username/elevenbuckets, and has geth datadir under /home/username/elevenbuckets/.ethereum:

```
docker run --rm -it \
-v "/home/username/elevenbuckets:/home/username/elevenbuckets:z" \
bladeiron_service /home/username/elevenbuckets
```

### Integrate with exsiting setup on host 

As a temporary workaround to integrate with exsiting setup on host, one can also choose to bind the whole user home directory into docker image:

```
docker run --rm -it \
-v "/home/jasonlin:/home/jasonlin:z" \
bladeiron_service /home/jasonlin
```
