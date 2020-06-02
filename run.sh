#!/bin/sh

if [ $1 == "setup" ]; then
    git clone https://github.com/HatBashBR/HatCloud.git
    git clone https://github.com/vincentcox/bypass-firewalls-by-DNS-history.git
    git clone https://github.com/m0rtem/CloudFail.git
    git clone https://github.com/christophetd/CloudFlair.git
    pip3 install -r CloudFail/requirements.txt
    pip install -r cloudflair/requirements.txt
    apt install ruby -y

elif [ $1 == "scan"]; then
    python3 CloudFail/cloudfail.py --target $2
    python cloudflair/cloudflair.py $2
    bash bypass-firewalls-by-DNS-history/bypass-firewalls-by-DNS-history.sh -d $2
    ruby HatCloud/hatcloud.rb -b $2
fi