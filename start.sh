#!/bin/bash -l

TOPDIR=$1
DATADIR=$TOPDIR/.ethereum
APPDIR='/data/11be'

( geth --rinkeby \
	--syncmode light \
	--datadir $DATADIR \
	--rpc --rpcapi "eth,net" \
	--netrestrict 159.89.0.0/16,13.0.0.0/8 \
	--nat none \
	--rpccorsdomain "*" & )

cd $APPDIR && sleep 7 && $APPDIR/node_modules/.bin/bladecli 
