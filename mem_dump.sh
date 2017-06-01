#!/bin/bash

set -euf -o pipefail

dumpDIR=/var/lib/xen/dump/
dumpFILE=dump

function memdump {
    echo "deploy unikernel"
    (sudo make run &) &> /dev/null
    sleep 5
    echo "geting dumpfile" 
    domainID=$(sudo xl list | awk '{print $2}' |tail -1)
    sudo xl dump-core $domainID $dumpDIR$dumpFILE$domainID
    sudo hexdump $dumpDIR$dumpFILE$domainID &> dump$domainID.log  
}

memdump;

