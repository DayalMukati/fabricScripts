echo "========================================================================"
echo "Installing GoLang"
echo "========================================================================"
sudo apt-get update
sudo apt-get -y upgrade
sudo rm -Rf go
sudo curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
sudo tar -xvf go1.6.linux-amd64.tar.gz
sudo mv go /usr/local

echo "========================================================================"
echo "Installion completed"
echo "========================================================================"

echo "========================================================================"
echo "Installing NodeJS"
echo "========================================================================"
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs  --assume-yes
sudo apt-get install build-essential  --assume-yes

echo "========================================================================"
echo "Installion completed"
echo "========================================================================"

echo "========================================================================"
echo "Installing Python"
echo "========================================================================"
sudo apt-get install python  --assume-yes

echo "========================================================================"
echo "Installion completed"
echo "========================================================================"

echo "========================================================================"
echo "Installing Docker"
echo "========================================================================"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg  | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce  --assume-yes
echo "========================================================================"
echo "Installion completed"
echo "========================================================================"

echo "========================================================================"
echo "Installing Docker Compose"
echo "========================================================================"
# sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.15.0/docker-compose-$(uname -s)-$(uname -m)"
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v
sudo usermod -aG docker $USER
echo "========================================================================"
echo "Installion completed"
echo "========================================================================"

echo "========================================================================"
echo "Adding Path to Profile "
echo "========================================================================"
echo "export PATH=$PATH:/usr/local/go/bin"  >> ~/.profile
source ~/.profile
echo "========================================================================"
echo "Environment variable updated"
echo "========================================================================"

echo "========================================================================"
echo "Cleanup"
echo "========================================================================"

rm -Rf go1.6.linux-amd64.tar.gz
rm -Rf go
rm -Rf nodesource_setup.sh

echo "========================================================================"
echo "PLEASE RESTART THE VM NOW"
echo "========================================================================"
