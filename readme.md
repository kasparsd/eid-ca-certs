# CA Certificates for Latvian eID

`generate-ca.sh` is used to format [Latvian eID CA certificates](https://www.eparaksts.lv/lv/palidziba/lejupielades/pamata-sertifikati/) as PEM certificates and to create three combined certificates:

- [eid-lv-server.pem](https://raw.githubusercontent.com/kasparsd/eid-ca-certs/master/eid-lv-server.pem) is a chained CA client, policy and root certificate for use in web servers.
- [eid-lv-root.pem](https://raw.githubusercontent.com/kasparsd/eid-ca-certs/master/eid-lv-root.pem) is a combined CA policy and root certificate for browsers.
- [eid-lv-client.pem](https://raw.githubusercontent.com/kasparsd/eid-ca-certs/master/eid-lv-client.pem) is a combined CA client certificate for browsers.

## Usage:

	$ ./generate-ca.sh 
	Downloading root at http://www.eme.lv/aia/E-ME%20SSI%20(RCA).crt
	Downloading policy at http://www.eme.lv/aia/E-ME%20PSI%20(PCA).crt
	Downloading ca1 at http://www.eme.lv/aia/E-ME%20SI%20(CA1).crt
	Downloading ca2 at https://www.eparaksts.lv/files/e-me_si_(ca1)(1).crt
	Downloading ca3 at https://www.eparaksts.lv/files/eme_ica_ca3.crt
	Downloading ca4 at https://www.eparaksts.lv/files/ca4.crt
	Downloading ca5 at https://www.eparaksts.lv/files/ica4_2014-08-09.crt
	Downloading ca6 at https://www.eparaksts.lv/files/ca5.crt
	ca1.crt converted to PEM
	ca2.crt already in PEM
	ca3.crt already in PEM
	ca4.crt already in PEM
	ca5.crt already in PEM
	ca6.crt already in PEM
	policy.crt converted to PEM
	root.crt converted to PEM

	Completed!
