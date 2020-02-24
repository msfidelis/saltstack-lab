export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" > /etc/apt/sources.list.d/saltstack.list

sudo apt-get update

sudo apt-get install salt-minion salt-ssh salt-syndic salt-cloud salt-api python-pip git -y

# REPLACE SALT MASTER
sed -i 's/#master:\ salt/master:\ salt.master.raj.internal/g' /etc/salt/minion

service salt-minion restart