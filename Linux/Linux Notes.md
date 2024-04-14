
[[27-09-2023]]

## à quoi sert `/etc/login.defs`

Le fichier `/etc/login.defs` est un fichier de configuration dans les systèmes d'exploitation Unix et Linux qui définit les paramètres par défaut du système pour la création de nouveaux comptes d'utilisateurs. 

Il contient une série de directives qui contrôlent des choses telles que :

- Les valeurs minimales et maximales pour les identifiants d'utilisateur (UID) et de groupe (GID).
- Le répertoire personnel par défaut pour les nouveaux utilisateurs.
- <u>Les paramètres de l'ombre du mot de passe, tels que la durée de vie minimale et maximale du mot de passe</u>.
- <u>Le nombre de jours d'inactivité autorisé avant qu'un compte ne soit désactivé.</u>
- Les messages affichés lors de la connexion ou déconnexion.

Ce fichier est généralement utilisé par des outils comme `useradd`, `userdel` et `passwd`, mais il peut également être consulté directement par d'autres programmes.

## à quoi sert `/etc/skel`

Le répertoire /etc/skel sert de modèle pour la création de nouveaux comptes d'utilisateur sur un système Unix ou Linux. Lorsqu'un nouveau compte d'utilisateur est créé, les fichiers et répertoires contenus dans /etc/skel sont copiés dans le répertoire personnel du nouvel utilisateur. Cela permet aux administrateurs système de configurer un environnement par défaut pour tous les nouveaux utilisateurs.`l
## à quoi sert  `/etc/passwd`

Le fichier `/etc/passwd` est un fichier système dans les systèmes d'exploitation de type Unix qui contient les informations de base sur chaque compte d'utilisateur. Il sert notamment à :

- Identifier les utilisateurs ayant accès au système : chaque ligne du fichier correspond à un compte utilisateur.
- Stocker des informations essentielles sur chaque utilisateur, telles que leur ID utilisateur (UID), leur groupe principal d'appartenance (GID), leur répertoire personnel et leur shell par défaut.
- Permettre ou interdire l'accès de certains utilisateurs à certaines ressources ou commandes.

Il est important de noter que ce fichier ne contient pas les mots de passe des utilisateurs. Ces derniers sont stockés, sous forme cryptée, dans un autre fichier système, généralement `/etc/shadow`.
## à quoi sert `/etc/hosts`



Le fichier `/etc/hosts` est un fichier de configuration du système d'exploitation qui sert à mapper des adresses IP à des noms d'hôtes. Ce fichier est utilisé par le système pour résoudre les noms de réseau avant de faire appel à des services de résolution de noms de réseau plus complexes, tels que le système de noms de domaine (DNS). 



 `/etc/nsswitch.conf`

## à quoi sert`/etc/nsswitch.conf`

Le fichier `/etc/nsswitch.conf` est un fichier de configuration du système d'exploitation Linux qui contrôle la manière dont le système recherche et accède aux informations sur les utilisateurs, les groupes, les adresses IP, etc. Il détermine l'ordre dans lequel les services sont consultés pour ces informations.

Par exemple, il peut indiquer si le système doit d'abord chercher des informations sur un utilisateur dans les fichiers locaux du système ou dans un service de répertoire réseau comme LDAP ou NIS. Ceci peut être utile pour configurer des systèmes dans des environnements réseau complexes.

## à quoi sert `/etc/NetworkManager/System-connections` 


![[2023-09-05_13-24.png]]
## à quoi sert  `/etc/cron.d`

![[firefox_M7j3zKvuGv.png]]
## à quoi sert `/etc/rsyslog.conf` 

`/etc/rsyslog.conf` est le fichier de configuration principal pour rsyslog, qui est le daemon de journalisation par défaut pour de nombreux systèmes Linux. Ce fichier détermine où, comment et quelles informations de journalisation sont capturées. Il contient des directives pour contrôler le traitement du journal, y compris où envoyer les journaux (comme les fichiers sur disque ou les serveurs externes) et comment formater les messages de journal.

`/etc/rsyslog.d` est un répertoire qui contient généralement des fichiers de configuration supplémentaires pour rsyslog. Les fichiers dans ce répertoire sont utilisés pour étendre ou remplacer la configuration spécifiée dans `/etc/rsyslog.conf`. Cela permet une organisation plus flexible et modulaire de la configuration rsyslog. Par exemple, vous pouvez avoir des fichiers distincts dans `/etc/rsyslog.d` pour différentes applications ou services sur votre système.

Lorsque rsyslog démarre, il lit d'abord `/etc/rsyslog.conf`, puis tous les fichiers dans `/etc/rsyslog.d`, par ordre alphabétique. Les règles spécifiées dans ces fichiers supplémentaires peuvent compléter ou remplacer celles définies dans le fichier principal.
## à quoi sert `/ect/fstab`

Systemd Mounts Persistently

Permet de monter un disque dure automatiquement:
`/dev/<disque> /<folder>     ext4     default 0 0

![[2023-09-19_11-56.png]]
Il faut modifier le fichier `/etc/fstab` pour pouvoir monter automatiquement un disque 



![[2023-09-20_12-01.png]]
## à quoi sert  `/dev/<disk>`

Chemin d'accès où sont montés les disques par défauts.


![[2023-10-01_10-59.png]]






## à quoi sert ``/etc/chrony.conf``

Le fichier ``/etc/chrony.conf`` est utilisé pour configurer le service de synchronisation du temps ``chronyd`` dans les systèmes Linux. Chrony est un démon de synchronisation du temps qui permet de maintenir l'heure système précise en ajustant la fréquence d'horloge ou en synchronisant avec des serveurs de temps externes.

Le fichier ``/etc/chrony.conf`` contient les paramètres de configuration pour Chrony, tels que les serveurs NTP (Network Time Protocol) auxquels se synchroniser, les options de contrôle de l'horloge et d'autres options spécifiques au fonctionnement du service.

En modifiant ce fichier, vous pouvez spécifier les serveurs NTP auxquels Chrony doit se synchroniser, configurer des règles d'accès pour contrôler quelles machines sont autorisées à se connecter à votre serveur NTP, définir des options telles que le délai maximum d'ajustement d'horloge autorisé, et bien plus encore.

En résumé, le fichier ``/etc/chrony.conf`` est utilisé pour spécifier la configuration du service de synchronisation du temps Chrony sur un système Linux.






## à quoi sert ``/etc/ssh/sshd_config``

Permet de paramétrer les options ssh




## Boot procédure
![[2023-09-21_17-41.png]]

