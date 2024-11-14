#!/bin/bash

# Ensure TERM=xterm is added only once
if ! grep -q "export TERM=xterm" /home/vagrant/.bashrc; then
  echo 'export TERM=xterm' >> /home/vagrant/.bashrc
fi


REPO_FILE="/etc/yum.repos.d/CentOS-Base.repo"


cat << EOF > "$REPO_FILE"
[baseos]
name=CentOS Stream \$releasever - BaseOS
#mirrorlist=http://mirrorlist.centos.org/?release=\$stream&arch=\$basearch&repo=BaseOS&infra=\$infra
baseurl=http://vault.centos.org/\$contentdir/\$stream/BaseOS/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[appstream]
name=CentOS Stream \$releasever - AppStream
#mirrorlist=http://mirrorlist.centos.org/?release=\$stream&arch=\$basearch&repo=AppStream&infra=\$infra
baseurl=http://vault.centos.org/\$contentdir/\$stream/AppStream/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[extras]
name=CentOS Stream \$releasever - Extras
#mirrorlist=http://mirrorlist.centos.org/?release=\$stream&arch=\$basearch&repo=extras&infra=\$infra
baseurl=http://vault.centos.org/\$contentdir/\$stream/extras/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[powertools]
name=CentOS Stream \$releasever - PowerTools
#mirrorlist=http://mirrorlist.centos.org/?release=\$stream&arch=\$basearch&repo=PowerTools&infra=\$infra
baseurl=http://vault.centos.org/\$contentdir/\$stream/PowerTools/\$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[extras-common]
name=CentOS Stream \$releasever - Extras common packages
#mirrorlist=http://mirrorlist.centos.org/?release=\$stream&arch=\$basearch&repo=extras-extras-common
baseurl=http://vault.centos.org/\$contentdir/\$stream/extras/\$basearch/extras-common/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras
EOF
fi

# update and upgrade servers
sudo dnf update -y && sudo dnf upgrade -y 
