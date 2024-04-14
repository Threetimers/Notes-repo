
## Connecter un Unbuntu à un Active Directory
[[13-07-2023]]
https://neptunet.fr/ubuntu-ad/

Et on va lancer une petite mise à jour de la machine…


```bash 
sudo apt update && apt upgrade –y 
```

Une fois les mises à jour effectuées, on peut **installer les paquets nécessaires** à la jonction au domaine et leurs dépendances :

```bash
sudo apt install realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit –y
```


C’est bon les paquets sont bien installés ? Alors on va tout de suite **s’assurer que le domaine est bien joignable** par le client Ubuntu avec la commande suivante :

```bash
realm discover axeplane.loc
```

Visiblement, pas de problème ! On peut alors **rejoindre directement le domaine à l’aide du compte administrateur** avec la commande :


```bash
realm join --user=Administrateur axeplane.loc
```



--------

## DHCP Commands Host Discovery

équivalence à  ```ipconfig /release``` et 
```ipconfig /renew``` sur Linux


```bash
sudo dhclient -r && sudo dhclient
```


N'est pas installer par défaut sur Unbuntu
```bash
sudo ifconfig release && sudo ifconfig renew 
```

----
## Linux Configurer Carte réseau 

https://guide.ubuntu-fr.org/server/network-configuration.html

Trouver la passerelle commande: ``route -n

![[2023-07-13_17-45.png]]

----
## Changer de Hostname
[[21-07-2023]]

``hostnamectl set-hostname nouveau-nom-d'hôte``

Remplacez `nouveau-nom-d'hôte` par le nom que vous souhaitez pour votre machine.

---
## Installer OpenSSH 

Installation of the Openssh-server package on Ubuntu via the command line is straightforward. Follow these steps:

1. First, open the terminal.

2. Update the package list to reflect the latest versions in the repository:

```bash
sudo apt-get update
```

3. Once the update is finished, install the `openssh-server` package:

```bash
sudo apt-get install openssh-server
```

4. To ensure that the installation was successful and the service is running, use the following command:

```bash
sudo systemctl status ssh
```

By default, the SSH service will start running once the installation is complete. You can connect to the server using your username and IP address from another system:

```bash
ssh username@server_ip_address
```

Remember to replace "username" with your actual username and "server_ip_address" with the actual IP address of your server. If you haven't set up a static IP, you can find your server's address with the `ip addr show` command.

------
## Créer un clé SSH 


