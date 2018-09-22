#!/bin/bash

	
# Install keepalived
/usr/bin/apt-get -y install keepalived


cat > /etc/keepalived/keepalived.conf <<EOD
vrrp_script chk_haproxy {           # Requires keepalived-1.1.13
        script "killall -0 haproxy"     # cheaper than pidof
        interval 2                      # check every 2 seconds
        weight 2                        # add 2 points of prio if OK
}

vrrp_instance VI_1 {
        interface eth1
        state MASTER
        virtual_router_id 51
        priority 101                    # 101 on master, 100 on backup
        virtual_ipaddress {
            172.28.96.20
        }
        track_script {
            chk_haproxy
        }
}
EOD

/etc/init.d/keepalived restart