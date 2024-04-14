

## Processes

vidéo 1

Les processes ont un espace dans la mémoire vive qui leurs est alloué, ils ont des droits alloués.

![[mpv_eTEpmr7G6Y.png]]

## process explorer

### svchost.exe
Le process svchost.exe permet de host de multiples services dans le même process pour conserver de la mémoire vive cependant, si un service "bug" le process entier et shutdown.

svchost.exe

svchost.exe is a legitimate Windows process that is responsible for hosting multiple services in the background. It stands for "Service Host" and is an essential component of the Windows operating system. 

The main purpose of svchost.exe is to act as a container for various DLL (Dynamic Link Library) files that run in the background and provide important functionality to different system services. This allows multiple services to run under a single svchost.exe process, which helps optimize system resources.

However, since svchost.exe is a common target for malware and viruses, it's important to ensure that the process running on your computer is legitimate. Malicious programs may disguise themselves as svchost.exe in order to hide their activities and avoid detection.

It's worth noting that there can be multiple instances of svchost.exe running simultaneously, each hosting different services. This is normal behavior for Windows operating systems.

In conclusion, svchost.exe is an essential Windows process that hosts various services on your computer. However, due to its potential vulnerability to malware attacks, it's crucial to ensure that the process running on your system is legitimate.

Si il y'a + de3.5Go de mémoire vive chaque services à son process.

Les process sont complètements indépendants les uns des autres même si un process est parent.


## Virtual memory


tout ce qui concerne la RAM et gérer par des "pages"
### Pagination
La RAM (Random Access Memory) est une forme de mémoire volatile utilisée par un ordinateur pour stocker temporairement les données et les instructions nécessaires au fonctionnement du système et des programmes en cours d'exécution.

Pour gérer efficacement la RAM, le système d'exploitation utilise une technique appelée "pagination". La pagination divise la mémoire en blocs de taille fixe appelés "pages". Chaque page a une adresse virtuelle associée qui permet au système d'exploitation de localiser rapidement et facilement les données.

Lorsqu'un programme est exécuté, son code et ses données sont chargés en mémoire dans des pages. Lorsque la RAM est pleine, le système d'exploitation peut effectuer une opération appelée "swapping" pour déplacer certaines pages moins utilisées vers un espace de stockage temporaire, généralement sur le disque dur. Cela libère de l'espace dans la RAM pour charger de nouvelles pages plus nécessaires.

Lorsque le programme a besoin d'accéder à une page qui n'est pas actuellement chargée en mémoire, il se produit un "page fault". Le système d'exploitation récupère alors cette page manquante depuis le stockage temporaire sur le disque dur et la charge en mémoire avant de reprendre l'exécution du programme.

La gestion des pages est essentielle pour optimiser l'utilisation de la RAM. Un mauvais algorithme de pagination peut entraîner une utilisation inefficace de la mémoire, tandis qu'un bon algorithme garantit que les pages les plus utilisées sont toujours présentes en mémoire pour minimiser les temps d'accès aux données.

En résumé, la gestion des pages est une technique utilisée par le système d'exploitation pour organiser et gérer efficacement la mémoire RAM en divisant celle-ci en blocs appelés pages. Cela permet de charger les données et les instructions nécessaires à l'exécution des programmes, tout en optimisant l'utilisation de la mémoire disponible.


### La pagination divise la mémoire en blocs de taille fixe appelés "pages". que se passe t-il si le bloc est trop petit ?

Si le bloc est trop petit, cela peut entraîner plusieurs problèmes :

1. Fragmentation interne : Si la taille de la page est plus grande que celle requise par le processus, il y aura un espace inutilisé à l'intérieur de la page. Cela peut entraîner un gaspillage de mémoire car cet espace ne peut pas être utilisé par d'autres processus.

2. Perte d'efficacité : Si la taille des pages est trop petite, cela signifie qu'il y aura plus de pages nécessaires pour stocker un processus. Cela augmente le temps d'accès à la mémoire car le système doit rechercher dans un plus grand nombre de pages pour trouver les données nécessaires.

3. Augmentation du coût de gestion de la mémoire : Avec des pages plus petites, le système d'exploitation devra gérer un plus grand nombre de tables de pagination et maintenir une cartographie précise entre les pages physiques et virtuelles. Cela peut entraîner une augmentation des coûts en termes de temps et de ressources nécessaires pour gérer la mémoire.

En résumé, si les blocs sont trop petits, cela peut conduire à une fragmentation interne, une perte d'efficacité et une augmentation du coût de gestion de la mémoire. Il est donc important de choisir judicieusement la taille des blocs lorsqu'on met en œuvre la pagination dans un système informatique.

![[mpv_Gn8T77ZlVD.png]]

## Threads

vidéo 2

Les threads sont des unités d'exécution plus petites que les processus. Ils sont également appelés "processus légers". Un processus peut avoir plusieurs threads en cours d'exécution simultanément.

Chaque thread a son propre ensemble de registres, y compris un pointeur d'instruction (IP) et une pile. Les threads partagent le même espace mémoire et les mêmes ressources que le processus parent, ce qui leur permet de communiquer et de partager des données plus facilement.

Les threads peuvent être utilisés pour effectuer des tâches simultanément, améliorant ainsi les performances globales du système. Par exemple, un programme de traitement d'images peut utiliser un thread pour charger une image à partir du disque dur tandis qu'un autre thread effectue des opérations de traitement sur l'image chargée.

Les threads peuvent également être utilisés pour gérer les entrées/sorties asynchrones. Par exemple, un programme peut créer un thread pour envoyer des données sur un réseau tout en continuant à effectuer d'autres opérations en parallèle.

Cependant, il est important de noter que les threads partagent la même mémoire et les mêmes ressources, ce qui signifie qu'ils peuvent également se corrompre mutuellement s'ils ne sont pas correctement synchronisés. La synchronisation entre les threads est essentielle pour éviter les conditions de concurrence et garantir l'intégrité des données partagées.

En conclusion, les threads sont des unités d'exécution plus petites que les processus qui permettent une exécution simultanée de tâches dans un programme. Ils partagent la même mémoire et les mêmes ressources que le processus parent, ce qui facilite la communication et le partage de données. Cependant, une synchronisation appropriée entre les threads est nécessaire pour éviter les problèmes de concurrence et garantir l'intégrité des données.



![[mpv_j8DGgyKVmP.png]]

Les DLL peuvent être partagés entre plusieurs applications pour gagner en ressources.