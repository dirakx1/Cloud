# you to install the centos epel.repo first
#
sudo chown nokia.nokia -R /specify-path/
sudo yum install git
sudo yum install python-pip
sudo yum install python-virtualenv
sudo yum install python-virtualenvwrapper.noarch
export WORKON_HOME=/specify_path/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
