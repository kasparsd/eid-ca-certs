#!/bin/bash

cd "$(dirname "$0")"

# Remove old certs
rm -r {certs,pem,text}/* eid-lv-*.{crt,pem}

# Download all CA certs
OLDIFS=$IFS
IFS=","
while read name url
do
	echo "Downloading $name at $url"
	curl -s "$url" > "certs/$name.crt"
done < ca-urls.csv
IFS=$OLDIFS

# Convert each cert into standard PEM format
for f in certs/*.crt
do
	filename=$(basename $f)

	# Convert all certs to PEM
	if openssl x509 -inform der -in $f -out pem/$(basename $f .crt).pem &> /dev/null ; then
		echo "$filename converted to PEM"
	else
		cp $f pem/$(basename $f .crt).pem
		echo "$filename already in PEM"
	fi

	# Extract and store cert in text form
	openssl x509 -in pem/$(basename $f .crt).pem -text -noout > text/$(basename $f .crt).txt
done

# Generate a combined CA for use in web servers
cat pem/ca* pem/policy.pem pem/root.pem > eid-lv-server.pem

# Generate a combined cert for client auth
cat pem/ca* > eid-lv-client.pem

# Generate a combined root and policy cert
cat pem/policy.pem pem/root.pem > eid-lv-root.pem

# Generate copies with a CRT extension
for pem in eid-lv-*.pem
do
	cp $pem $(basename $pem .pem).crt
done

echo
echo "Completed!"