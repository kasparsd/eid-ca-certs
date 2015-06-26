# CA Certificates for Latvian eID

`generate-ca.sh` is used to format [Latvian eID CA certificates](https://www.eparaksts.lv/lv/palidziba/lejupielades/pamata-sertifikati/) as PEM in addition to generating a combined chain certificate [eid-ca.pem](https://raw.githubusercontent.com/kasparsd/eid-ca-certs/master/eid-ca.pem) for use in web servers.

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