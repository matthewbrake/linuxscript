users:
  - name: cj
    ssh_authorized_keys:
      - "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINBlfqermlV44zAU+iTCa5im5O0QWXid6sHqh2Z4L1Cm cj@null.computer"
    sudo: ALL=(ALL:ALL) ALL
    groups: sudo
    shell: /bin/bash
chpasswd:
  expire: true
  users:
    - name: cj
      password: changeme
      type: text
runcmd:
  - sed -i '/PermitRootLogin/d' /etc/ssh/sshd_config
  - echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
  - sed -i '/PubkeyAuthentication/d' /etc/ssh/sshd_config
  - echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
  - sed -i '/PasswordAuthentication/d' /etc/ssh/sshd_config
  - echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
  - systemctl restart sshd
  - echo "\$nrconf{kernelhints} = -1;" > /etc/needrestart/conf.d/99disable-prompt.conf
  - apt update
  - apt upgrade -y --allow-downgrades --allow-remove-essential --allow-change-held-packages
  - reboot
