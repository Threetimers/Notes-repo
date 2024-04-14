[[05-11-2023]


## Mount Disk Linux automatiquement


éditer le fichier ``/etc/fstab`` 

### 1er étape:

Trouver le UUID à l'aide de la commande ``lbkid`` ou 
``lsblk --output NAME, UUID``

![[vmware_CFhGegHyjI.png]]

### 2ème étape:

éditer le fichier fstab


![[vmware_areqS7kPF9.png]]

### 3ème étape:

Utiliser la commande ``mount -a`` pour vérifier que tout fonctionne correctement. 
Si il y'a un message d'erreur ne surtout pas reboot !

![[vmware_Q2yQn364e7.png]]

### 4ème étape:

Utiliser la commande ``systemctl daemon-reload`` pour charger la nouvelle config


![[2023-11-05_03-12.png]]

