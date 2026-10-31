#!/bin/bash
# Root password comes from the lab_root_password variable (never stored in this repository).
printf '%s\n' '${lab_root_password}' '${lab_root_password}' | passwd --stdin root
# Password and root login are accepted only from inside the lab (10.0.0.0/8). Everything else keeps key-only SSH.
cat <<'SSHD' >> /etc/ssh/sshd_config

Match Address 10.0.0.0/8
    PasswordAuthentication yes
    PermitRootLogin yes
SSHD
service sshd restart
hostnamectl --static set-hostname VPC2Instance1
cat <<EOT>> /etc/bashrc
export http_proxy=http://10.0.1.10:3128
export https_proxy=http://10.0.1.10:3128
no_proxy=127.0.0.1,localhost,169.254.169.254,10.0.0.0/8,.internal
EOT