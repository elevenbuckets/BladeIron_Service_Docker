#!/bin/bash -l

APPDIR='/data/11be'
export rpchost=`hostname -I`

	#--netrestrict 159.89.0.0/16,13.0.0.0/8 \
( geth --rinkeby \
	--syncmode light \
	--datadir $DATADIR \
	--rpc --rpcapi "eth,net" \
	--nat none \
	--rpccorsdomain "*" & )

cd $APPDIR && sleep 7 && $APPDIR/node_modules/.bin/bladecli 
