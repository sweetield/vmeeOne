#!/bin/sh
# cctv new configuration
# Run cctv
# Write cctv configuration
UUID=a52cd660-ec71-4cae-97cf-3ea981212677
cat << EOF > /etc/cctv/config.json
{
    "inbounds": [{
        "port": 8080,
        "protocol": "vmess",
        "settings": {
            "clients": [{
                "id": "$UUID",
                "alterId": 0
            }]
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "/$UUID-vmess"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

#Run cctv

/usr/bin/cctv/cctv  run -config=/etc/cctv/config.json
