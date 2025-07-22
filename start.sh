export MY_VAR="value"
#install containerlab
bash -c "$(curl -sL https://get.containerlab.dev)"

#install docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# wireshark
sudo apt install wireshark

# import ceos image
sudo docker pull zhen06199/ceos:4.28.0F
sudo docker tag zhen06199/ceos:4.28.0F ceos:4.28.0F
sudo docker rmi zhen06199/ceos:4.28.0F

# Import container with K3s cluster, KWOK and LIQO
sudo docker pull testing954/clab-frr01-client27-with-cpu:latest
sudo docker tag testing954/clab-frr01-client27-with-cpu:latest cluster-node:latest
sudo docker rmi testing954/clab-frr01-client27-with-cpu:latest

# deploy topology
sudo clab deploy --topo topo.yaml

# configure
sudo docker exec -d clab-start-ceos1 ip addr add 10.0.2.1/29 dev eth1
sudo docker exec -d clab-start-ceos2 ip addr add 10.0.2.2/29 dev eth1

# ping test
sudo echo "Quick Connection test"
sudo echo "ceos1:eth1 <-->ceos2:eth1"
sudo docker exec clab-start-ceos1 ping -c1 10.0.2.2
sudo docker exec clab-start-ceos2 ping -c1 10.0.2.1

#wireshark
sudo ip netns exec clab-start-ceos1 tcpdump -U -nni eth1 -w - |     wireshark -k -i -

