


> [!NOTE] Tuto-proxmox-cluster
>https://www.youtube.com/watch?v=U1VzcjCB_sY


> [!tip] Tuto written
> https://www.learnlinux.tv/how-to-build-an-awesome-kubernetes-cluster-using-proxmox-virtual-environment/
> ---
> https://blog.kubesimplify.com/how-to-install-a-kubernetes-cluster-with-kubeadm-containerd-and-cilium-a-hands-on-guide

> [!tip] Créer Infra Proxmox
> [[Créer Une VM en CLI]]


## Configure Infrastructure

```
sudo swapoff -a
```


### Setting up a static IP

1. rentrer dans le folder
```bash
 cd /etc/netplan
```



2. Créer un backup
```bash
sudo cp 50-cloud-init.yaml  50-cloud-init.yaml.bak
```



4. Editer le fichier de configuration IP
```bash
sudo nano 50-cloud-init.yaml
```

```bash
network:
    version: 2
    ethernets:
        eth0:
            addresses: [192.168.2.101/24]
            nameservers:
                addresses: [192.168.2.8]
            routes:
                - to: default
                  via: 192.168.2.8


```

```bash
sudo netplan try
```

### hostname 
5. changer le nom du host name 
> [!tip]
> `sudo hostnamectl set-hostname master`

6. Ajuster le fichier hosts dans ```/etc/hosts```

```bash
# Your system has configured 'manage_etc_hosts' as True.
# As a result, if you wish for changes to this file to persist
# then you will need to either
# a.) make changes to the master file in /etc/cloud/templates/hosts.debian.tmpl
# b.) change or remove the value of 'manage_etc_hosts' in
#     /etc/cloud/cloud.cfg or cloud-config from user-data
#
127.0.1.1 worker1
127.0.0.1 localhost

# master node
192.168.2.101 master
192.168.2.110 master2

# worker node
192.168.2.102 worker1
192.168.2.103 worker2

# The following lines are desirable for IPv6 capable hosts
::1 localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

```

## Installer ContainerD
7. 
```bash
sudo apt-get install containerd -y
```
8. 
```bash
sudo systemctl status containerd.service
```

9. 
```bash
sudo mkdir /etc/containerd
```
10. 
```bash
sudo containerd config default | sudo tee /etc/containerd/config.toml
```
11. Editer le fichier de config ```/etc/containerd/config.toml ```

utiliser ```ctrl + w``` sur nano et taper ```runc.options ```


modifier ```systemdcgroup = true```   

12. Modifier sudo ```nano /etc/sysctl.conf```

Uncomment:
```net.ipv4.ip_forward=1```

![[2024-04-05_21-24.png]]

13. Configuration IPV4

> [!NOTE] Lien Tuto
>https://kubernetes.io/docs/setup/production-environment/container-runtimes/

```bash
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system
```


## Installing kubeadm, kubelet and kubectl

1. 
suivre le lien
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl

2. Effacer le ID de la VM (<mark style="background: #FF5582A6;">Template</mark>)


https://youtu.be/U1VzcjCB_sY?t=2068

```bash
 sudo truncate -s 0 /etc/machine-id
```

```bash
sudo rm /var/lib/dbus/machine-id
```

----------

## Installation spécifique Master Node !

https://youtu.be/U1VzcjCB_sY?t=2559


1. 
> [!NOTE] Title
> [[2.10 Initialize Cluster with kubeadm]]
> [[2.11 - Connect to cluster (kubeconfig & kubectl)]]
>Modifier les IP
>```bash
sudo kubeadm init --control-plane-endpoint=192.168.2.101 --node-name master --pod-network-cidr=10.244.0.0/16


> [!NOTE] Paramétrages Kubernet
> Pour Override les paramètres par défauts de Kubernet
> ```bash
> sudo less /etc/kubernetes/manifests
> kube-apiserver.yaml
> ```
> 

#### Authentification
Obliger de s’authentifier avec le fichier `admin.conf`
```bash
sudo kubectl get node --kubeconfig /etc/kubernetes/admin.conf
```



#### Eviter de taper `--kubeconfig /etc/kubernetes/admin.conf`



> [!tip] ### Access cluster as admin
> ```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config 



> [!tip] variable
> 7:30mns
> [[2.18 -]]
> ![[Pasted image 20240412024028.png]]


## Installer - Configure Network Plugin Cilium

[[2.18 - Configure Network Plugin cilium]]


> [!tip] Tuto installation
> https://docs.cilium.io/en/latest/gettingstarted/k8s-install-default/
> 

```bash
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
CLI_ARCH=amd64
if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
```

##### Install the plugin

```bash
git clone https://github.com/cilium/cilium.git
```

aller dans le dossier d'installation !

```
cilium install 
```


-------


## Joindre worker to Master-Node


> [!tip]
> token créer avec la commande
> ```bash
> kubeadm token create --print-join-command
> ```
> 
> Pour rejoindre les workers au cluster
> ```bash
> kubeadm join 192.168.2.101:6443 --token xixkbo.bxk3dj6lnumh4oi9 --discovery-token-ca-cert-hash sha256:7b7a321b7f0d28d1606808a7c21519209122dccb3bf7bcf2cf2aa14af6e957c9
> 
> ```

## Flannel

> [!tip]
> https://kubernetes.io/docs/tasks/administer-cluster/network-policy-provider/
> 
> ```bash
> kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
> ```



## A Editer !!!!!

### commands
```bash
kubectl get pod -n kube-system -o wide
```

![[Pasted image 20240413153601.png]]


> [!tip]
> token créer avec la commande
> ```bash
> kubeadm token create --print-join-command
> ```
> 
> Pour rejoindre les workers au cluster
> ```bash
> kubeadm join 192.168.2.101:6443 --token xixkbo.bxk3dj6lnumh4oi9 --discovery-token-ca-cert-hash sha256:7b7a321b7f0d28d1606808a7c21519209122dccb3bf7bcf2cf2aa14af6e957c9
> 
> ```

-------- 
### dossier


> [!tip] Pour Override les paramètres par défauts de Kubernet
> 
> ```bash
> sudo less /etc/kubernetes/manifests
> kube-apiserver.yaml
> ```
> 
> 

> [!tip] Obliger de s’authentifier avec le fichier `admin.conf`
> ```bash
> sudo kubectl get node --kubeconfig /etc/kubernetes/admin.conf
> ```
> 
> 
