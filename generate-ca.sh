#!/bin/bash

cd "$(dirname "$0")"

# Remove old certs
rm {certs,source}/* eid-lv-*.crt

# Download all CA certs
OLDIFS=$IFS
IFS=","
while read name url
do
	echo "Downloading $name at $url"
	curl -s "$url" > "source/$name.crt"
done < ca-urls.csv
IFS=$OLDIFS

# Convert each cert into standard PEM format
for f in source/*.crt
do
	filename=$(basename $f)
	basename=$(basename $f .crt)

	# Convert all certs to PEM
	if openssl x509 -inform der -in "$f" -out "certs/$basename.pem" &> /dev/null ; then
		echo "$filename converted to PEM"
	else
		cp "$f" "certs/$basename.pem"
		echo "$filename already in PEM"
	fi

	# Extract and store cert in text form
	openssl x509 -in "certs/$basename.pem" -text -noout > "certs/text/$basename.txt"
done

# Generate a combined CA cert
cat certs/ca*.pem certs/policy.pem certs/root.pem > eid-lv.crt

echo
echo "Completed!"