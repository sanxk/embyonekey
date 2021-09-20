#!/bin/sh
cd /etc/nginx/sites-enabled
wget https://github.com/LHZ-922/embyonekey/proxy.conf
curl https://github.com/LHZ-922/embyonekey/master/guomi.cer >> /etc/ssl/certs/ca-certificates.crt
cd /var/packages/EmbyServer/target/mono/bin
./cert-sync /etc/ssl/certs/ca-certificates.crt
cd /volume1/web/mb3admin.com
wget https://github.com/LHZ-922/embyonekey/mb3admin.com.cert.pem
wget https://github.com/LHZ-922/embyonekey/mb3admin.com.key.pem
cat mb3admin.com.cert.pem >> /etc/ssl/certs/ca-certificates.crt
cd /usr/local/etc/nginx/conf.d/*-*-*-*
wget https://github.com/LHZ-922/embyonekey/user.conf
nginx -s reload
done
