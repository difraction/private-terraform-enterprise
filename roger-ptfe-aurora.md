#################

## Aurora PTFE:

database_endpoint = roger-aurora-ptfe-cluster.cluster-cd2ntnfz8tii.us-east-1.rds.amazonaws.com
database_password = password
database_port = 5432
fqdn = roger-aurora-ptfe.hashidemos.io


## ptfe-settings.json:

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
          "value": "-----BEGIN CERTIFICATE-----\nMIIDOzCCAiOgAwIBAgIUNfuPZIw7AE15yBWVjBIjzWlwV5kwDQYJKoZIhvcNAQEL\nBQAwGDEWMBQGA1UEAxMNaGFzaGlkZW1vcy5pbzAeFw0xODExMDkwNjM5NDFaFw0x\nOTExMDkwNjQwMTFaMBgxFjAUBgNVBAMTDWhhc2hpZGVtb3MuaW8wggEiMA0GCSqG\nSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC3c4slXCW+uhweOCE76zHzFDZl9QLNXFt2\n0aa1IZanFlDc216s9+be0butdkbm6NMtEXnbRcnddxfy46o/3ZhRf3zotCze5ZMC\n455VwsLghCsNCkuK3yzX9a+UeUkl8Z/nRE8o/iPDrUcL0diWzaNW5JX8tKyYwW/7\nwn0/DJpJ01pkfC2ffFUtI9QEg0ci3CsJ0f3ufgiz356l1fUzhNHkssKB4hK5CyBy\nC65Rm9zaJsKdqk60JGOL/nLNuJGvXBOT0OOI+I/OtFZW5IZ+4pFTTcP0fw1yCaeT\nMIPaZseiuUTmilcpqs2mvz4F0Op7PaJdzYp8fq6YEC1k1GdkgzehAgMBAAGjfTB7\nMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQ7uZdH\nDadGnzPkH8xta4uMTjaavzAfBgNVHSMEGDAWgBQ7uZdHDadGnzPkH8xta4uMTjaa\nvzAYBgNVHREEETAPgg1oYXNoaWRlbW9zLmlvMA0GCSqGSIb3DQEBCwUAA4IBAQCV\nlWnppUskYKpLy1PREvbQSZ7r/vv5v735L7D+9lHv5Cx/pvJE9AKFpHn4YoBTlDNk\ndUeikAEejXfsoGQ7jaWQbCePuFzNgMWzVcP37ZjddRpJUnKh1EHOrvBQXHdKz/n9\nuM7Fjr66imoZJkEy/0dRbJUqWnvgp8m5n2d6l+heZxiDybtujucztC8hu37fsOO4\nU8hnCJh4SyYkHxp6lJrX49wrmq16SAogOFwnZgkEikDzErieYJGVxZkuQLmZ+8ga\nEHt+mUxIEToqZmus/0K6zt98RfQRZ8oQnMQ8LelhMeq8nW0RqZR6BdWsmrY0WGxT\nlayqYshoZxcfhHPbMTv9\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIID4TCCAsmgAwIBAgIUMSClR+07uFw6BVGABSSOb6bcZpowDQYJKoZIhvcNAQEL\nBQAwGDEWMBQGA1UEAxMNaGFzaGlkZW1vcy5pbzAeFw0xODExMDkwNjQ5MDZaFw0x\nODEyMDkwNjQ5MzZaMCoxKDAmBgNVBAMTH3JvZ2VyLWF1cm9yYS1wdGZlLmhhc2hp\nZGVtb3MuaW8wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDn4c5tI4aI\ndFBKZ7paczl+iqRM8F4hjVVtl1MFS5QzlwPjl/3QNuw9l6Pd+TrkSnMA5d/Go+up\nJ3xHV3nyhI9QwYB/KMHy71Rg1AOljGPqEFa8YRbHxGsYbnligDGbq2duWG/noju3\nq4cg/6e7t/N/r4vQFFGd7WuFQeYVn1NYxIzX8lJf1YrO2uHmKCEqN+ZICeZpCNes\nRSl6YHUqXdyf5pZinndTXb9t/y4Lc4NMSiiCpgJjRuyS4pZnq1fL1c11dI/9XRlQ\n6mpKUlVyflpdqESHNEfk0PM4FvlCZShg68g9omNg+im0X19SHbRBLY++vfW1RM6L\ntqZ2q2jLN0sbAgMBAAGjggEPMIIBCzAOBgNVHQ8BAf8EBAMCA6gwHQYDVR0lBBYw\nFAYIKwYBBQUHAwEGCCsGAQUFBwMCMB0GA1UdDgQWBBQPT/yuFgj/Ao0a5pinspKO\nzSZyjjAfBgNVHSMEGDAWgBQ7uZdHDadGnzPkH8xta4uMTjaavzA7BggrBgEFBQcB\nAQQvMC0wKwYIKwYBBQUHMAKGH2h0dHA6Ly8xMjcuMC4wLjE6ODIwMC92MS9wa2kv\nY2EwKgYDVR0RBCMwIYIfcm9nZXItYXVyb3JhLXB0ZmUuaGFzaGlkZW1vcy5pbzAx\nBgNVHR8EKjAoMCagJKAihiBodHRwOi8vMTI3LjAuMC4xOjgyMDAvdjEvcGtpL2Ny\nbDANBgkqhkiG9w0BAQsFAAOCAQEACSfejQG8IugQX6SIT53XkqamnrO/siepuwvs\nZ1bLSFrXyY3OVgnS4cuMbotmBodXnMkVpwgfLQvHeCoxuAAxMtKWoRqOhbwLl4d7\nfZ7P4pbayg0LuW20BctcAIn6uZ/O/LL0p/KF8QCSjBd6zV6BAvtSamSbqN9tQksH\nsBvqj3RYg+YAZhco8vU3dT0ome7Vu0ItTu1cwQ38ITjW+8Xg7+FnoHWkHD8ydYlo\nWDm9f7qdusDqNgFdXV2XbQBpwka4H5b19C2KDwjYhuMPbXK3QXPpmsahbHA4rWAn\nvslmSp7vKqIReTSLefVFPu0MFfivV7EbB+GtpPm02cyVbCbe3A==\n-----END CERTIFICATE-----\n"
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

## replicated.conf

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

## Certs

https://support-uploads.hashicorp.com/u/ptfe-support-bundles

Created Cert and key with Vault PKI backend
Copied cert chain (cert, then CA) into ca_certs attribute of ptfe-settings.json using format that Vault exported which included `\n` instead of actual new lines.  PTFE needs this because Vault is a private CA.

Created cert.cert with cert followed by ca-cert on PTFE instance
Created pk.key with key on PTFE instance

### vi commands:
Command to replace "\n" with line breaks `\r`: `:s/\\n/\r/g`
Command to replace line breaks with "\n": `:1,$s/\n/\\n`

Add cert and key to ACM.
Attach Cert to ELB

## Download replicated.tar.gz and
Download replicated.tar.gz from https://s3.amazonaws.com/replicated-airgap-work/replicated.tar.gz

with `curl -o replicated.tar.gz https://s3.amazonaws.com/replicated-airgap-work/replicated.tar.gz`

Untar with `tar xzvf replicated.tar.gz`

Download PTFE v201810-2 with:

Use Password RG4XAG

`wget -O bundle.airgap --content-disposition "https://replicated-airgap-rw-prod.s3.amazonaws.com/61b8d33704e2bb6a7ce87f09cbe2269b/299/archive.tgz?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJF5BJMACS5KILFMQ%2F20181110%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20181110T152638Z&X-Amz-Expires=600&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DTerraform%20Enterprise%20-%20299.airgap&X-Amz-Signature=dabdc40c01eeacdf6d8266e08c5042863a21bcf77ab38642efa8481ccf5a6701"`

## Configure PostgreSQL
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

Also had to add roger-aurora-ptfe-iam-role as user of my KMS key

## Install

Install with:
```
sudo su -
cd /home/ec2-user
cp replicated.conf /etc/replicated.conf
ls -l /etc/replicated.conf (make sure all users can read)
./install.sh \
    airgap \
    no-proxy \
    private-address=10.0.1.36 \
    public-address=18.232.60.176
```

## Test App
`curl -ksfS --connect-timeout 5 https://roger-aurora-ptfe.hashidemos.io/_health_check`

I visited the Admin Console and found that properties were set.

But `curl -ksfSv --connect-timeout 5 https://10.0.1.36/_health_check` gives "HTTP/1.1 200 OK"

## Get Docker logs:

`docker logs --timestamps replicated > "replicated.log" 2>&1`

## Remove replicated
```
sudo su -
replicatedctl app stop
service docker restart
docker stop replicated-premkit
docker stop replicated-statsd
docker stop $(docker ps -aq) # might need to repeat
docker rmi -f $(docker images -q)
rm -rf /var/lib/replicated* /etc/replicated* /etc/init/replicated* /etc/default/replicated* /etc/systemd/system/replicated* /etc/sysconfig/replicated* /etc/systemd/system/multi-user.target.wants/replicated* /run/replicated*
```

## Delete all data from database:
```
sudo su -
yum install postgresql96.x86_64 -y
psql -h roger-aurora-ptfe-cluster.cluster-cd2ntnfz8tii.us-east-1.rds.amazonaws.com -d ptfe -U ptfe
\c ptfe
DROP SCHEMA registry CASCADE;
DROP SCHEMA vault CASCADE;
DROP SCHEMA rails CASCADE;
\dn (to validate schemas are gone)
\q
```

## Try Reinstalling

```
sudo su -
cd /home/ec2-user
cp replicated.conf /etc/replicated.conf
ls -l /etc/replicated.conf (make sure all users can read)
./install.sh \
    airgap \
    no-proxy \
    private-address=10.0.1.36 \
    public-address=18.232.60.176
```
UI has all properties and let me log in

Saw lots of stuff loading on dashboard

Eventually get to point where dashboard shows "Starting" and "Waiting for app to report ready..."

`curl -ksfSv --connect-timeout 5 https://10.0.1.36/_health_check` gives:

The requested URL returned error: 502 Bad Gateway

`curl -ksfSv --connect-timeout 5 https://roger-aurora-ptfe.hashidemos.io/_health_check` gives:

"The requested URL returned error: 503 Service Unavailable: Back-end server is at capacity"

But I think that is because ELB does not consider app in service yet.

Trying to visit with browser using public DNS of instance also gives 502 Bad Gateway

Trying https://roger-aurora-ptfe.hashidemos.io in Chrome tells me my connection is not secure and then gives me This page is not working with HTTP error 503.

Tried rebooting my EC2 instance after SCP-ing files back to my laptop
Replicated and PTFE were automatically restarted
Was able to access Admin console
Dashboard showed app Starting

rabbitmq still giving "PLAIN login refused: user 'hashicorp' - invalid credentials"

Stop everything, remove all replicated, removed schemas from DB, stop and restart system:

Then recreate schemas in DB
Install replicated

## Destroy instance and start with new one
Terminate EC2 instance
`terraform apply` to get new one
Change private and public IPs in install.sh command to match new ones
Make sure ELB points to new instance
Reinstall Docker
Download all software again
`mkdir certs`
SCP replicated.conf, ptfe-settings.json, se-03302019.rli, pk.key, cert.cert to new instance.
Check permissions and owner of these files

Run install.sh at about 9:30pm

Connected to admin console,
was prompted for password
settings all there

9:33: docker ps still just shows replicated containers
9:34, see some ptfe containers
rabbitmq shows "user 'hashicorp' authenticated and granted access to vhost 'hashicorp'"

curl -ksfSv --connect-timeout 5 https://10.0.1.36/_health_check gives 200

Dashboard shows app started

clicking on link under that to go to app gives This site can't be reached:

ERR_CONNECTION_REFUSED:  but that is probably just issue with ELB

Changed health check to `HTTPS:443/_health_check`

ELB has no listeners

Added listener back and made sure right cert attached.

Was able to connect to app, but cert must be wrong.  Says insecure.

Tried switching certs in TLS section of settings around to match what is in cert.cert.
Restarted app.

Might have to issue cert to include IP of instance
Did that using public IP and private IP
