

[[11-09-2023]]
[[28-09-2023]]: ajouts commandes
[[29-09-2023]]: ajouts commandes
[[06-10-2023]]: ajouts commandes
[[25-01-2024]]: ajouts commandes
[[03-02-2024]]: ajouts commandes
[[04-02-2024]]: ajouts commandes
## éditer texte

| Commande                    | explication                                           |
| --------------------------- | ----------------------------------------------------- |
| sed -i s/old/new/g ~/myfile | Permet de remplacer new par old dans un fichier texte |

## update auto Linux
| apt install unattended-upgrades | installe une application pour update Linux |
| --- | --- |
| dpkg-reconfigure --priority=low unattended-upgrades<br><br> |  |

## Bash

| source .bashrc | reload le fichier de config ce qui évite de relancer le terminal |
| --- | --- |
| chsh -s /bin/bash | Permet de choisir le shell utilisé |
## Troubleshooting

| Commande        | explication                                      |
| --------------- | ------------------------------------------------ |
| top             | équivalent du gestionnaire de tâches sur windows |
| tracepath [ip]  | donne le chemin réseau (tracert)                 |
| ping -c 4  [ip] | Pour savoir si un host est live                  |
| ip route        | print the routing table                          |
| free -m    |  Donne des informations sur l'utilisation de la mémoire virtuelle                                          |

## Gestion des droits

| chown | Permet de changer le owner d'un file ou directory                     |     |
| ----- | --------------------------------------------------------------------- | --- |
| chgrp | Permet de changer le groupe auquel appartient un fichier ou directory |     |
| chmod | Permet de changer les droits sur un F ou D (R = 4, W = 2 et X = 1)    |     |
| umask      |    gestion des droits lors de la création d'un F ou D                                                                   |     |



## Gestion des utilisateurs et groupes


| useradd                 | permet de créer un utilisateur                              |
| ----------------------- | ----------------------------------------------------------- |
| userdell                | permet de supprimer un utilisateur                          |
| usermod                 | Gestion du compte d'un utilisateur (voir notes)             |
| lid  -g "nom du groupe" | permet de lister les membres d'un groupe                    |
| groupadd                |                                                             |
| groupdell               |                                                             |
| groupmod                | Can be used to delete and modify group                      |
| id                      | Pour savoir à quelle(s) groupe(s) appartient un utilisateur |
| chage                   | change password settings                                    |



## Paramétrer carte réseau

| nmtui                    | Permet de Paramétrer la carte réseau en gui |     |
| ------------------------ | ------------------------------------------- | --- |
| nmtcli                   | Permet de Paramétrer la carte réseau en cli |     |
| hostnamectl set-hostname | permet de définir le nom de l'ordi          |     |



## Gestion des Process


| kill    | Permet de terminer un process                                  |
| ------- | -------------------------------------------------------------- |
| kill -9 | Permet de mettre fin à un process de manière abrupt voir cours |
| nice    |   change la priorité d'un process non lancé       (-20 à 19)                                                      |
| renice        |      change la priorité d'un process en cours d'exécution   (-20 à 19)                                                            |

## Monitoring disk space


| command | définition                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------ |
| du -h     | The du command shows the disk usage for a specific directory (by default, the current directory) |
| df -h   | allows you to easily see what's happening on all the mounted disks                               |
|         |                                                                                                  |

## Listing matériels

| lsbkl | Donne des informations sur les disques (nom - taille) |
| ----- | ----------------------------------------------------- |
|    lscpu   |  Permet de connaître le nombre de cœurs (CPU)                                                     |
|       |                                                       |

## Gestion des services avec systemd

| systemctl list-unit-files            | Permet de voir l'état des services           |
| ------------------------------------ | -------------------------------------------- |
| systemctl `status <nom du service>`  | Permet de connaître le status d'un service   |
| systemctl start `<nom du service>`   |                                              |
| systemctl stop `<nom du service>`    |                                              |
| systemctl enable `<nom du service>`  |                                              |
| systemctl disable `<nom du service>` |                                              |
| systemctl edit `<nom du service>`    | Permet de paramétrer un service              |
| systemctl cat `<nom du service>`     | Permet de voir la configuration d'un service |
| systemctl daemon-reload       |   The `systemctl daemon-reload` command is used to reload the systemd manager configuration. When you make changes to unit files or other systemd configurations, you need to notify systemd about these changes to ensure that it uses the latest                                           |



## Commands Systemd logs

| journalctl        | print the entire journal                               |
| ----------------- | ------------------------------------------------------ |
| journalctl -p err | montre seulement les messages avec un priorités hautes |
|                   |                                                        |


![[2023-09-18_11-25_1.png]]

## Gestion des sessions

| loginctl user-status          | The `loginctl user-status <UID>` command in Linux is used to check the status of a specific user                                                     |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `loginctl terminate-user <UID>` | `loginctl terminate-user <UID>` est utilisée pour mettre fin à toutes les sessions d'un utilisateur spécifié par son identifiant d'utilisateur (UID) |
| `loginctl user-status <UID>`    | est utilisée pour afficher l'état courant de l'utilisateur identifié par son UID (User Identifier)                                                   |
| loginctl list-users             |         display a list of all currently active user sessions on the system                                                                                                                                             |
| loginctl list-sessions          |  it will show you a list of all currently active sessions along with their session IDs                                                                                                                                                    |
|                                 |                                                                                                                                                      |




## Gestion du NTP

| hwclock | set hardware time          |
| ------- | -------------------------- |
| date    | affiche la date et l'heure |
|         |                            |


## SMB

| ``smbclient //192.168.1.1/shared_folder -U administrator`` | connection en smb depuis kali linux |
| ---- | ---- |

## PGP Encryption

| `gpg -c <nom du fichier>`                         | par défaut utilise AES 256                             |
| ------------------------------------------------- | ------------------------------------------------------ |
| `gpg -- chipher-alg <cipher> -c <nom du fichier>` | ex: `gpg -- chipher-alg RSA -c secret.txt`             |
| gpg --version                                     | Pour voir les ciphers disponible                       |
| `shred -vu -n 100 <nom du fichier>`               | Permet d'écrire dans un fichier et de le supprimer     |
| gpg -o test -d test.txt.gpg<br><br>               | Pour décrypter un fichier -o => output,  -d => decrypt |
|                                                   |                                                        |

## Iptables 

Leçon: [[7. Iptables]]

![[chrome_xDNQ2xQfyI.png]]
Pour regarder les tables IP
```bash
sudo iptables -vnL
```

Exemples
```bash
sudo iptables -I INPUT -s 27.103.0.0/16 -j DROP
```

 Prendre note de la négation
```bash
iptables -A FORWARD -p udp --dport 53 ! -d 8.8.8.8 -j DROP
```
#### UDP 53
In this command:

- `sudo` is used to execute the command with root privileges.
- `iptables -A FORWARD` appends a rule to the FORWARD chain.
- `-p udp --dport 53` specifies that the rule applies to UDP traffic destined for port 53.
- `! -d 8.8.8.8` excludes traffic that is destined for 8.8.8.8.
- `-j DROP` specifies that matching packets should be dropped.

This rule effectively blocks all attempts to change the DNS server by preventing any UDP traffic not intended for 8.8.8.8 from reaching port 53




-------------


# Exemples

### Ajouter un groupe à un utilisateur
![[2023-09-25_22-39.png]]


### enlever un membre d'un groupe à l'aide de `gpasswd`
![[2023-09-25_22-45.png]]

## Sudoers


https://www.udemy.com/course/linux-administration-build-hands-on-linux-projects/learn/lecture/24204110#overview

Le <mark style="background: #FF5582A6;">%</mark> représente un group devant un nom


![[chrome_65UZEkwHVt.png]]


<mark style="background: #FF5582A6;">ALL</mark> = tous les hosts
![[chrome_FmTJHMV9tj.png]]


<mark style="background: #FF5582A6;">Users and groups</mark>
![[chrome_ne5BUeOMKI.png]]



<mark style="background: #FF5582A6;">Commandes autorisées</mark>

Dan peut utiliser sudo sans mot de passe

![[chrome_kYhIPjBg64.png]]

### Visudo Syntax
![[2024-01-23_00-56.png]]
![[2024-01-23_01-01.png]]