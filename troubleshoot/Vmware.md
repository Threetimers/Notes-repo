



## VMWARE

[[26-08-2023]]
https://wiki.archlinux.org/title/Installing_VMware


 ```vmware-installer -l``` => Pour savoir quelle version de vmware est installée


https://superuser.com/questions/1713277/unable-to-install-all-modules-see-log-tmp-vmware-vmware-host-vmware-14067-log

Lors d'une update du kernel il faut suivre ces étapes en cas d'échec de l'update automatique de vmware:


```bash
cd /usr/lib/vmware/modules/source
git clone https://github.com/mkubecek/vmware-host-modules
cd vmware-host-modules
git checkout workstation-16.2.3
make
tar -cf vmnet.tar vmnet-only
tar -cf vmmon.tar vmmon-only
mv vmnet.tar /usr/lib/vmware/modules/source/
mv vmmon.tar /usr/lib/vmware/modules/source/
vmware-modconfig --console --install-all
```

Penser à choisir la bonne version de vmware !