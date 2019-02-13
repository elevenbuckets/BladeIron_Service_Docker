#!/bin/bash -l

APPDIR='/data/11be'
export rpchost=`hostname -I`

if [ "${NETRESTRICT}x" != "x" ]; then
( geth --rinkeby \
	--syncmode light \
	--datadir $DATADIR \
	--rpc --rpcapi "eth,net" \
	--netrestrict $NETRESTRICT \
	--nat none \
	--rpccorsdomain "*" & );
else
( geth --rinkeby \
	--syncmode light \
	--datadir $DATADIR \
	--rpc --rpcapi "eth,net" \
	--nat none \
	--rpccorsdomain "*" & );
fi

cd $APPDIR && sleep 7 && $APPDIR/node_modules/.bin/bladecli 
