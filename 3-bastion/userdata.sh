#!/bin/bash

set -e
exec > /var/log/userdata.log 2>&1

echo "Starting DevOps tools installation..."

# install basic tools
dnf install -y git curl wget unzip tar jq --setopt=install_weak_deps=False
echo "Basic tools installed"

# install docker (official repo)
dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user
echo "Docker installed"

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/
echo "kubectl installed"

# install eksctl
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"
tar -xzf eksctl_${PLATFORM}.tar.gz
mv eksctl /usr/local/bin/
rm -f eksctl_${PLATFORM}.tar.gz
echo "eksctl installed"

# install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
echo "helm installed"

# install kubens & kubectx
git clone https://github.com/ahmetb/kubectx /opt/kubectx || true
ln -s /opt/kubectx/kubens /usr/local/bin/kubens || true
ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx || true
echo "kubens & kubectx installed"

# install k9s
cd /tmp
curl -s https://api.github.com/repos/derailed/k9s/releases/latest \
| grep browser_download_url \
| grep Linux_amd64.tar.gz \
| cut -d '"' -f 4 \
| wget -qi -

tar -xzf k9s_Linux_amd64.tar.gz
mv k9s /usr/local/bin/
rm -f k9s_Linux_amd64.tar.gz
echo "k9s installed"

# install mysql client
dnf install -y mysql --setopt=install_weak_deps=False
echo "MySQL client installed"

echo "All DevOps tools installed successfully"