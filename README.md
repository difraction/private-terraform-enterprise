#################

## Aurora PTFE:

database_endpoint = roger-aurora-ptfe-cluster.cluster-cd2ntnfz8tii.us-east-1.rds.amazonaws.com
database_password = password
database_port = 5432
fqdn = roger-aurora-ptfe.hashidemos.io

### Configure PostgreSQL
```
sudo yum install postgresql96.x86_64 -y
psql -h roger-aurora-ptfe-cluster.cluster-cd2ntnfz8tii.us-east-1.rds.amazonaws.com -d ptfe -U ptfe
\l
\c ptfe
CREATE SCHEMA rails;
CREATE SCHEMA vault;
CREATE SCHEMA registry;
\dn
\q
```

## Certs
Created Cert and key with Vault PKI backend
Copied cert chain (cert, then CA) into ca_certs attribute of ptfe-settings.json using format that Vault exported which included `\n` instead of actual new lines.  PTFE needs this because Vault is a private CA.

Created cert.cert with leaf.cert followed by ca.cert on PTFE instance with `cat leaf.cert ca.cert > cert.cert`
Created pk.key with key on PTFE instance

### vi commands:
Command to replace "\n" with line breaks `\r`: `:s/\\n/\r/g`
Command to replace line breaks with "\n": `:1,$s/\n/\\n`

Add cert and key to ACM.
Attach Cert to ELB

## Configuration files
These are the configuration files needed by the installer

### ptfe-settings.json:
```
{
	"aws_instance_profile": {
    	"value": "1"
	},
	"capacity_concurrency": {
    	"value": "10"
	},
	"capacity_memory": {
    	"value": "256"
	},
	"enc_password": {
    	"value": "Pas$w0rd"
	},
  "ca_certs" : {
      "value": "-----BEGIN CERTIFICATE-----\nMIIECzCCAvOgAwIBAgIUYCi1JwLdPGE5ko4v4Y51hIh34hkwDQYJKoZIhvcNAQEL\nBQAwGDEWMBQGA1UEAxMNaGFzaGlkZW1vcy5pbzAeFw0xODExMTAwMzAyMDhaFw0x\nOTAyMDgwMzAyMzdaMCoxKDAmBgNVBAMTH3JvZ2VyLWF1cm9yYS1wdGZlLmhhc2hp\nZGVtb3MuaW8wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDdJw/sr6/Z\n453w32bLQUZUaPPrvOIUJ9jkCuReqrX4TH8L+0uXMD5+ctDGJmvjb2tnPAHhE7Ua\nQ0ZryEvuiqrulXPdJYk3B0Kw8wjbEHZyq7pnLzMVI3Fu9mZzwdWAHZuQ7hdsVUsV\n/Mm255UplRiSsiuxYxCxyxOgEQcM0KQ1Iz6Nx2BMe8WjzSAcsMYpf4Bx9ELyun8Y\nCt2/G40wrD6dez1eFQU5gXrfox+2KwdPuPmmP5IAJNWa0tEV8mxAkPIByt0LhLd9\nkSrgEwKwdA3FqyLC15eaZM6EXWnrlBD58ZtGRLsL/Zpxb4VmriWo6cRhe4ELEgsL\nWqQqj5x4lu9vAgMBAAGjggE5MIIBNTAOBgNVHQ8BAf8EBAMCA6gwHQYDVR0lBBYw\nFAYIKwYBBQUHAwEGCCsGAQUFBwMCMB0GA1UdDgQWBBTthjpeVOLk80d6VcqgpTi0\nGixjCDAfBgNVHSMEGDAWgBQ7uZdHDadGnzPkH8xta4uMTjaavzBKBggrBgEFBQcB\nAQQ+MDwwOgYIKwYBBQUHMAKGLmh0dHBzOi8vY2FtLXZhdWx0Lmhhc2hpZGVtb3Mu\naW86ODIwMC92MS9wa2kvY2EwNgYDVR0RBC8wLYIfcm9nZXItYXVyb3JhLXB0ZmUu\naGFzaGlkZW1vcy5pb4cEEug8sIcECgABJDBABgNVHR8EOTA3MDWgM6Axhi9odHRw\nczovL2NhbS12YXVsdC5oYXNoaWRlbW9zLmlvOjgyMDAvdjEvcGtpL2NybDANBgkq\nhkiG9w0BAQsFAAOCAQEAee8iq0WMDdn0GkcxCwR5QXOhQa+73zwQkRkQSOSEDD/Q\nY1IW41CnhhTQ5sXHKUPWkOGkgNtflSEznCiQTexzky98tDetcRzQCjfxTAF7lXbC\nKTDj38otp3T+ULAv7lUV0CEUrnsc4KYRMPNDDnwVB7RTXqFV6njni4bHP89Av9OZ\nB3fxnJgNaGzTeMZzrDBYHGGkTLFNw/i8Qa0iebcIhOA6Ga58HeCi+PpwDhVhcnWV\nFTFoV6NgaFLc+f54Pk11GTctJCJmH+1eShvD7wfumU6c54ZLsg0LS51A+2fDqw0t\nL+GeKNR4+kkS6SwaABL+oGETLRuFuAfAobOcDjo2Aw==\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIIDOzCCAiOgAwIBAgIUNfuPZIw7AE15yBWVjBIjzWlwV5kwDQYJKoZIhvcNAQEL\nBQAwGDEWMBQGA1UEAxMNaGFzaGlkZW1vcy5pbzAeFw0xODExMDkwNjM5NDFaFw0x\nOTExMDkwNjQwMTFaMBgxFjAUBgNVBAMTDWhhc2hpZGVtb3MuaW8wggEiMA0GCSqG\nSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC3c4slXCW+uhweOCE76zHzFDZl9QLNXFt2\n0aa1IZanFlDc216s9+be0butdkbm6NMtEXnbRcnddxfy46o/3ZhRf3zotCze5ZMC\n455VwsLghCsNCkuK3yzX9a+UeUkl8Z/nRE8o/iPDrUcL0diWzaNW5JX8tKyYwW/7\nwn0/DJpJ01pkfC2ffFUtI9QEg0ci3CsJ0f3ufgiz356l1fUzhNHkssKB4hK5CyBy\nC65Rm9zaJsKdqk60JGOL/nLNuJGvXBOT0OOI+I/OtFZW5IZ+4pFTTcP0fw1yCaeT\nMIPaZseiuUTmilcpqs2mvz4F0Op7PaJdzYp8fq6YEC1k1GdkgzehAgMBAAGjfTB7\nMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQ7uZdH\nDadGnzPkH8xta4uMTjaavzAfBgNVHSMEGDAWgBQ7uZdHDadGnzPkH8xta4uMTjaa\nvzAYBgNVHREEETAPgg1oYXNoaWRlbW9zLmlvMA0GCSqGSIb3DQEBCwUAA4IBAQCV\nlWnppUskYKpLy1PREvbQSZ7r/vv5v735L7D+9lHv5Cx/pvJE9AKFpHn4YoBTlDNk\ndUeikAEejXfsoGQ7jaWQbCePuFzNgMWzVcP37ZjddRpJUnKh1EHOrvBQXHdKz/n9\nuM7Fjr66imoZJkEy/0dRbJUqWnvgp8m5n2d6l+heZxiDybtujucztC8hu37fsOO4\nU8hnCJh4SyYkHxp6lJrX49wrmq16SAogOFwnZgkEikDzErieYJGVxZkuQLmZ+8ga\nEHt+mUxIEToqZmus/0K6zt98RfQRZ8oQnMQ8LelhMeq8nW0RqZR6BdWsmrY0WGxT\nlayqYshoZxcfhHPbMTv9\n-----END CERTIFICATE-----\n"
        },
	"extern_vault_enable": {
 	   "value": "0"
	},
	"hostname": {
    	"value": "roger-aurora-ptfe.hashidemos.io"
	},
	"installation_type": {
    	"value": "production"
	},
	"pg_dbname": {
    	"value": "ptfe"
	},
	"pg_extra_params": {
    	"value": "sslmode=require"
	},
	"pg_netloc": {
    	"value": "roger-aurora-ptfe-cluster.cluster-cd2ntnfz8tii.us-east-1.rds.amazonaws.com:5432"
	},
	"pg_password": {
    	"value": "Pas$w0rd"
	},
	"pg_user": {
    	"value": "ptfe"
	},
	"placement": {
   	 "value": "placement_s3"
	},
	"production_type": {
    	"value": "external"
	},
	"s3_bucket": {
    	"value": "roger-aurora-ptfe-s3-bucket"
	},
	"s3_region": {
    	"value": "us-east-1"
	},
	"s3_sse": {
    	"value": "aws:kms"
	},
	"s3_sse_kms_key_id": {
    	"value": "00c892e8-40c4-4048-a650-0f755876503d"
	},
	"vault_path": {
    	"value": "/var/lib/tfe-vault"
	},
	"vault_store_snapshot": {
    	"value": "1"
	}
}
```

### replicated.conf
```
{
    "DaemonAuthenticationType":          "password",
    "DaemonAuthenticationPassword":      "password",
    "BypassPreflightChecks":             true,
    "LicenseFileLocation":               "/home/ec2-user/se-03302019.rli",
    "LicenseBootstrapAirgapPackagePath": "/home/ec2-user/bundle.airgap",
    "ImportSettingsFrom":                "/home/ec2-user/ptfe-settings.json",
    "TlsBootstrapType":                  "server-path",
    "TlsBootstrapHostname":              "roger-aurora-ptfe.hashidemos.io",
    "TlsBootstrapCert":                  "/home/ec2-user/certs/cert.cert",
    "TlsBootstrapKey":                   "/home/ec2-user/certs/pk.key"
}
```


## Download replicated.tar.gz and
Download replicated.tar.gz with
`curl -o replicated.tar.gz https://s3.amazonaws.com/replicated-airgap-work/replicated.tar.gz`

Untar with `tar xzvf replicated.tar.gz`

## Download PTFE v201810-2

Use your password to get PTFE download link from replicated.com
Then download on EC2 instance with:
`wget -O bundle.airgap --content-disposition "<ptfe_download_link>"`

## Install Docker
```
#yum --showduplicates list docker | expand
sudo yum install -y docker-17.12.1ce-1.135.amzn1
sudo service docker start
sudo usermod -a -G docker ec2-user
#sudo yum -y install yum-plugin-versionlock
#sudo yum -y install jq
#sudo yum versionlock docker*
```
## SELinux
Ran `getenforce` to check SELinux status.  It was Disabled.

## Test S3 Access
```
aws s3 ls s3://roger-aurora-ptfe-s3-bucket
echo test > s3test.txt
aws s3 cp s3test.txt s3://roger-aurora-ptfe-s3-bucket/s3test.txt
aws s3 ls s3://roger-aurora-ptfe-s3-bucket
aws s3 cp s3://roger-aurora-ptfe-s3-bucket/s3test.txt s3test-verify.txt
cat s3test-verify.txt
aws s3 rm s3://roger-aurora-ptfe-s3-bucket/s3test.txt
aws s3 ls s3://roger-aurora-ptfe-s3-bucket
```

## Enable IAM role to use KMS key
Make sure you add the EC2 role used by your EC2 instance (e.g, roger-aurora-ptfe-iam-role) as user of your KMS key. The role has the same name as the instance profile shown on the EC2 instance.

## Install

Install with the following, making sure the private and public addresses match the current private and public IPs of your EC2 instance.
```
sudo su -
cd /home/ec2-user
cp replicated.conf /etc/replicated.conf
ls -l /etc/replicated.conf (make sure all users can read)
./install.sh \
    airgap \
    no-proxy \
    private-address=10.0.1.43 \
    public-address=54.159.207.27
```

## Post-Installation Checks

### Curl Check
Use the following command, making sure the IP is the private IP of the EC2 instance.
`curl -ksfS --connect-timeout 5 https://10.0.1.43/_health_check`

Initially, you will get "Connection refused"
At some point, that  changes to "502 Bad Gateway"
If the installation is successful, it should just return without message which means curl received HTTP 200 status.

### Admin Console Check
Visit the Admin Console and check that it prompts you for admin password and that all properties are set.

### Get Docker logs
If you have problems with curl commands or if Admin Console does not show properties, then run these commands to get and look at Docker logs:

```
docker logs --timestamps replicated > "replicated.log" 2>&1
vi replicated.log
docker logs --timestamps replicated-operator > "replicated-operator.log" 2>&1
vi replicated-operator.log
docker logs --timestamps replicated-ui > "replicated-ui.log" 2>&1
vi replicated-ui.log
```

## Retrying Installation
I have found that it is best to delete the EC2 instance and create a new one and then do a fresh installation on that new instance after also dropping the PTFE schemas from PostgreSQL.  But if you want, you can try these steps instead of creating a new instance.

### Remove replicated
```
sudo su -
replicatedctl app stop
service docker restart
docker stop replicated-premkit
docker stop replicated-statsd
docker stop $(docker ps -aq) (might need to repeat a few times)
docker ps (should not show running containers)
docker rmi -f $(docker images -q)
docker images (should not show any images)
rm -rf /var/lib/replicated* /etc/replicated* /etc/init/replicated* /etc/default/replicated* /etc/systemd/system/replicated* /etc/sysconfig/replicated* /etc/systemd/system/multi-user.target.wants/replicated* /run/replicated*
```

## Delete all data from database:
```
psql -h roger-aurora-ptfe-cluster.cluster-cd2ntnfz8tii.us-east-1.rds.amazonaws.com -d ptfe -U ptfe
\c ptfe
DROP SCHEMA registry CASCADE;
DROP SCHEMA vault CASCADE;
DROP SCHEMA rails CASCADE;
\dn (to validate schemas are gone)
\q
```

## Tests with Various Combinations of Certs

## Test 1: leaf -> root in cert.cert, no cert in ca_certs of json

Installed.

All settings populated

`curl -ksfSv --connect-timeout 5 https://10.0.1.43/_health_check` gives 502 Bad Gateway, but then 200 after another minue.

App did start.

Clicking on link in dashboard to launch app worked

Was able to add VCS connection to Github and create workspace (hello-world)

But plan hangs:

Added cert to admin console under SSL/TLS config section:
leaf -> root
Save
Restart app

Plan worked!.  So, leaf->root in ca_certs should be ok.

Tested root->leaf in SSL/TLS config section:
Save
Restart App

Plan worked.  So, root->leaf in ca_cert should also be ok.

However, I wonder if the first pair (leaf->root) was cached?

## Test 2: leaf -> root in cert.cert, leaf -> root in ca_certs of json
`curl -ksfSv --connect-timeout 5 https://10.0.1.43/_health_check` gives 443: Connection refused
Then changes to 502 Bad Gateway
Then to 200

admin console accepted password and shows settings
app started

app working
run worked

## Test 3: leaf -> root in cert.cert, root -> leaf in ca_certs of json

Admin console asked me for password, but then promted me to enter certs.  This is because I had SCP-ed wrong pk.key.  After replacing and setting paths in admin console, I found all settings.

Double-checked that I have leaf->root in cert.cert
and that I have root->leaf in json

PTFE apps running (even before I fixed key)
Run worked

`curl -ksfSv --connect-timeout 5 https://10.0.1.43/_health_check` gives 200

app works (even before I fixed key)

## Conclusion about Certs Order
It does not seem to matter which order to put the certs in the ca_certs field of the json file.

But I had previously determined that the order must be leaf -> root in the certificate that replicated.conf points to.  Also, if you don't do automated installation and try to add the cert with root -> leaf, you get an error that says the private key does not match the cert.
