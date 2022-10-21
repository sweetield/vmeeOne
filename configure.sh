#!/bin/sh
# cctv new configuration
# Run cctv
# Write cctv configuration
UUID=98bb65b5-aa2b-44a1-ad0f-0173cd90665e
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
