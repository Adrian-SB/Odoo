# k8s - Testing

Error cluster

adri@master:~$ sudo su
root@master:/home/adri# swapoff -a
root@master:/home/adri# modprobe br_netfilter
root@master:/home/adri# echo "1" > /proc/sys/net/ipv4/ip_forward
root@master:/home/adri# kubeadm init --pod-network-cidr=10.244.0.0/16
