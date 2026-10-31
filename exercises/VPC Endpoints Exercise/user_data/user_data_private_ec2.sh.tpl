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