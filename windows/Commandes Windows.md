
[[07-01-2024]]
[[14-01-2024]]: ajouts commands
[[20-01-2024]]: ajouts command


## DNS

| ipconfig /flushdns  | Efface les records DNS du hosts |
| --- | --- |
| ipconfig /displaydns  | Affiche les records DNS |

## Network

| ipconfig /all     | Affiches la config réseau                                             |
| ----------------- | --------------------------------------------------------------------- |
| ipconfig /release | Libére l'IP attribuée par le DHCP                                     |
| ipconfig /renew   | Demande une IP au serveur DHCP                                        |
| whoami            | Permet de connaître en tant que quel utilisateur nous sommes connecté |
| nslookup                  | Pour connaître l'IP d'un domaine ou pour trouver le nom du domaine                                                                      |

## SERVEUR

| get-windowsfeature \| more                         | obtenir la liste des fonctionnalités installées sur un serveur |
| -------------------------------------------------- | -------------------------------------------------------------- |
| install-windowsfeature DNS -IncludeManagementTools | Installe un serveur DNS                                                               |
| sconfig                                                   | Permet d’accéder au menu serveur en version core                                                               |

## Remote Management


| `winrm qc`                                                          | Sur la cible permet de prendre le control plus tard (voir notes windows hardening => 3. )                                                                                  |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ``winrs -r:<hostname><command>``                                  | Permet de lancer des commandes sur un host à distance (voir notes **windows hardening => 3.** )                                                                            |
| -`Enable-PSRemoting`<br>-`Enter-PSSession -ComputerName HYDRA-DC` | 1. Permet d'autoriser la prise à distance d'une cible à l'aide de powershell. 2. Permet de créer une session avec la cible. stance (voir notes **windows hardening => 3. ) |
|                                                                   |                                                                                                                                                                            |





## Directories Windows 

- Hosts file:  ``C:\Windows\System32\Drivers\etc\HOSTS``
- Zone file DNS: ``C:\Windows\System32\dns``








## Ressource Monitor

![[firefox_62JzmXKNap.png]]

## Ex: nslookup


![[chrome_pV1UttUUmR.png]]
