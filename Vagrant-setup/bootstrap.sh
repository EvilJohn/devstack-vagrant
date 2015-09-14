echo "Provisioning Devstack"

#install git
sudo apt-get install -y git

# clone devstack
git clone https://git.openstack.org/openstack-dev/devstack /home/vagrant/devstack

tee /home/vagrant/devstack/local.conf <<- 'EOM'
[[local|localrc]]
ADMIN_PASSWORD=happyjack
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
SERVICE_TOKEN=a682f596-76f3-11e3-b3b2-e716f9080d50
#FIXED_RANGE=172.31.1.0/24
#FLOATING_RANGE=192.168.20.0/25
#HOST_IP=10.3.4.5
EOM

cd devstack; ./stack.sh