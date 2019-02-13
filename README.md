## How to run:

Assuming user installing and setup everything related to 11BE under ***single*** folder, including:

- 11BE bootstrap dir (should comes with the package);
- 11BE configDir (user-defined location during setup);
- geth datadir (pre-determined or defined during setup if 11BE is managing geth); 
- ipfs repo (user-defined location during setup, 11BE will be managing go-ipfs);

#### 1. Installation example (on Linux) 
user places everything under __/home/username/elevenbuckets__:

- 11BE bootstrap dir: /home/username/elevenbuckets/.local
- 11BE configDir: /home/username/elevenbuckets/.configs
- geth datadir: /home/username/elevenbuckets/.ethereum
- ipfs repo: /home/username/elevenbuckets/ipfs_repo

Then the docker can be started by following command:

```
docker run --rm -it \
-e DATADIR="/home/username/elevenbuckets/.ethereum" \
-v "/home/username/elevenbuckets:/home/username/elevenbuckets:z" \
-v "/home/username/elevenbuckets/.local:/data/11be/.local:z" \
bladeiron_service
```

__Note: folder .local (bootstrap) needs to be explicitly mounted__

Folder .local is actually an internal location for 11BE bootstrapping. At the moment (11BE dev preview) things has to be done manually, but we will soon update our setup procedure so that it should be done automatically. We aim to provide easy docker integration for general users on multiple OS.

#### 2. Integrate with exsiting setup on host 

For developers / pro-users that wants to integrate 11BE with their exsiting setup, it can be achieved by binding the whole user home directory into docker image (the following example is for Linux):

```
docker run --rm -it \
-e DATADIR="/home/jasonlin/.ethereum/rinkeby" \
-v "/home/jasonlin:/home/jasonlin:z" \
-v "/home/jasonlin/11be/.local:/home/jasonlin/11be/.local:z" \
bladeiron_service
```
