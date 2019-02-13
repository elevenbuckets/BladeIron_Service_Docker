#!/bin/bash -l

APPDIR='/data/11be'
export rpchost=`hostname -I`; # for both geth and 11be rpc services

optCIDR=''
optRPC=''

if [ "${NETRESTRICT}x" != "x" ]; then
	optCIDR="--netrestrict ${NETRESTRICT}"
fi

if [ "${EXPOSERPC}x" != "x" ]; then
	optRPC="--rpcaddr ${rpchost}"
fi

( geth --rinkeby \
	--syncmode light \
	--datadir $DATADIR \
	--rpc --rpcapi "eth,net" \
        $optRPC \
	$optCIDR \
	--nat none \
	--rpccorsdomain "*" & );

cd $APPDIR && sleep 7 && $APPDIR/node_modules/.bin/bladecli 
