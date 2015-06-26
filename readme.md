# CA Certificates for Latvian eID

`generate-ca.sh` is used to format [Latvian eID CA certificates](https://www.eparaksts.lv/lv/palidziba/lejupielades/pamata-sertifikati/) as PEM certificates and to create three combined certificates:

- [eid-lv-server.pem](https://raw.githubusercontent.com/kasparsd/eid-ca-certs/master/eid-lv-server.pem) is a chained CA client, policy and root certificate for use in web servers.
- [eid-lv-root.pem](https://raw.githubusercontent.com/kasparsd/eid-ca-certs/master/eid-lv-root.pem) is a combined CA policy and root certificate for browsers.
- [eid-lv-client.pem](https://raw.githubusercontent.com/kasparsd/eid-ca-certs/master/eid-lv-client.pem) is a combined CA client certificate for browsers.

	$ ./generate-ca.sh 
	- ca1.crt converted to PEM
	- ca2.crt already in PEM
	- ca3.crt already in PEM
	- ca4.crt already in PEM
	- ca5.crt already in PEM
	- ca6.crt already in PEM
	- policy.crt converted to PEM
	- root.crt converted to PEM

	Generated eid-ca.crt