#!/bin/sh

if [ ! -z "$1" -a -r $1 ]; then
	
	source $1 
	
	xcrun -sdk $SDK PackageApplication "$AppPath" -o "$IPAPath" \
		--sign "$CodeSignIdent" --embed "$ProvisioningProfile"

	pushd "$DSYMDir"
	zip -r -9 "$DSYMZipPath" "$DSYMFile" 
	popd
	
else
	echo "Usage: $0 [configfilepath]"
	exit 1
fi
