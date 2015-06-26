#!/bin/bash
#
cd "$(dirname "$0")"

for f in original/*.crt; do
	filename=$(basename $f)

	# Convert all certs to PEM
	if openssl x509 -inform der -in $f -out pem/$(basename $f .crt).pem &> /dev/null ; then
		echo "- $filename converted to PEM"
	else
		cp $f pem/$(basename $f .crt).pem
		echo "- $filename already in PEM"
	fi

	# Extract and store cert in text form
	openssl x509 -in pem/$(basename $f .crt).pem -text -noout > meta/$(basename $f .crt).txt
done

# Generate a combined CA
echo "# Generated on" `date` | cat - pem/root.pem pem/policy.pem pem/ca* > eid-ca.pem

# Generate a copy with a CRT extension
cp eid-ca.pem eid-ca.crt

echo
echo "Generated eid-ca.crt"