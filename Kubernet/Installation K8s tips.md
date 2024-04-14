


## Préparation de l'infra-structure
> [!NOTE] Préparation de l'infra-structure
> [[2.3 - Provision Infrastructure on AWS]]

> [!tip] Creation d'un VM
> [[Créer Une VM en CLI]]



> [!NOTE] Étapes à suivre
> https://gitlab.com/nanuchi/k8s-administrator-course/-/blob/master/02.%20Install%20Cluster/commands.md?ref_type=heads


> [!NOTE] second tuto
> https://www.youtube.com/watch?v=U1VzcjCB_sY



## Installing Kubeadm
> [!NOTE] Documentation Installation Kubeadm
> https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

> [!NOTE] 1. Installation K8s
> - désactiver sur chaque node le swap
> ``sudo swapoff -a``
> 


> [!NOTE] 2. Ouvrir ces ports 
> Voir documentation
> - https://kubernetes.io/docs/reference/networking/ports-and-protocols/
> 
>![[Pasted image 20240329085736.png]]


## Install containerd


> [!tips] Install and configure prerequisites
> https://kubernetes.io/docs/setup/production-environment/container-runtimes/

> [!NOTE] Commands
> 
> ```bash
> cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
> overlay
> br_netfilter
> EOF
> 
> sudo modprobe overlay
> sudo modprobe br_netfilter
> 
> # sysctl params required by setup, params persist across reboots
> cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
> net.bridge.bridge-nf-call-iptables  = 1
> net.bridge.bridge-nf-call-ip6tables = 1
> net.ipv4.ip_forward                 = 1
> EOF
> 
> # Apply sysctl params without reboot
> sudo sysctl --system
> ```

-----------------

## Provision Infrastructure

### Provision Infrastructure 

##### move private key to .ssh folder and restrict access
    mv ~/Downloads/k8s-node.pem ~/.ssh
    chmod 400 ~/.ssh/k8s-node.pem

##### ssh into ec2 instance with its public ip
    ssh -i ~/.ssh/k8s-node.pem ubuntu@35.180.130.108


### Configure Infrastructure
    sudo swapoff -a

##### set host names of nodes
    sudo vi /etc/hosts

##### get priavate ips of each node and add this to each server 
    45.14.48.178 master
    45.14.48.179 worker1
    45.14.48.180 worker2

##### we can now use these names instead of typing the IPs, when nodes talk to each other. After that, assign a hostname to each of these servers.

##### on master server
    sudo hostnamectl set-hostname master 

##### on worker1 server
    sudo hostnamectl set-hostname worker1 

##### on worker2 server
    sudo hostnamectl set-hostname worker2


### Initialize K8s cluster
    sudo kubeadm init

### Check kubelet process running 
    service kubelet status
    systemctl status kubelet

### Check extended logs of kubelet service
    journalctl -u kubelet

### Access cluster as admin
    mkdir -p $HOME/.kube
	    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

### Kubectl commands

##### get node information
    kubectl get node

##### get pods in kube-system namespace
    kubectl get pod -n kube-system

##### get pods from all namespaces
    kubectl get pod -A

##### get wide output
    kubectl get pod -n kube-system -o wide


### Install pod network plugin

##### Install CLI 

    CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
    CLI_ARCH=amd64
    if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
    curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
    sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
    sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
    rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
    
##### Install the plugin 
    cilium install 
[Link to the Cilium installation guide](https://docs.cilium.io/en/latest/gettingstarted/k8s-install-default/)    

##### check cilium status
    cilium status
    kubectl -n kube-system exec cilium-2hq5z -- cilium-dbg status
    cilium connectivity test

### Join worker nodes

##### create and execute script
    vim install-containerd.sh
    chmod u+x install-containerd.sh
    ./install-containerd.sh

##### on master
    kubeadm token create --help
    kubeadm token create --print-join-command

##### copy the output command and execute on worker node as ROOT
    sudo kubeadm join 172.31.43.99:6443 --token 9bds1l.3g9ypte9gf69b5ft --discovery-token-ca-cert-hash sha256:xxxx

##### start a test pod
    kubectl run test --image=nginx



-----------

## Install kubernet


> [!NOTE] Kubeadm Install
> https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/


