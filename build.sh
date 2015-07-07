#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

cd Contents/rt2870resources.pkg

if [ -d payload_unpack ]; then
	cd payload_unpack

	# build Bom file
	mkbom . ../Bom

	# build Payload file
	sudo chown -R root:wheel .
	find . | cpio -o | gzip --to-stdout > ../Payload

	cd ..
	sudo rm -rf payload_unpack
fi

cd ..

# generate package
pkgutil --flatten . ../pkgs/out.pkg
