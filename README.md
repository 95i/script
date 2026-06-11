## 安装JDK8
```bash
curl -fsSL https://raw.githubusercontent.com/95i/script/refs/heads/main/install_jdk8.sh | sudo bash
```

## 安装Maven 3.9.12
```bash
curl -fsSL https://raw.githubusercontent.com/95i/script/refs/heads/main/install_maven3.sh | sudo bash
```
## 安装debian安装nodejs
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.6/install.sh | bash
source ~/.bashrc
nvm install 22
nvm use 22
```
## Centos7修改yum源
```bash
curl -o /etc/yum.repos.d/CentOS-Base.repo https://raw.githubusercontent.com/95i/script/refs/heads/main/CentOS-7-anon.repo
```
## Centos8修改yum源
```bash
rm -rf /etc/yum.repos.d/*
cat > /etc/yum.repos.d/CentOS-Vault.repo <<'EOF'
[BaseOS]
name=CentOS-8 - BaseOS
baseurl=https://vault.centos.org/8.5.2111/BaseOS/x86_64/os/
enabled=1
gpgcheck=0

[AppStream]
name=CentOS-8 - AppStream
baseurl=https://vault.centos.org/8.5.2111/AppStream/x86_64/os/
enabled=1
gpgcheck=0

[extras]
name=CentOS-8 - Extras
baseurl=https://vault.centos.org/8.5.2111/extras/x86_64/os/
enabled=1
gpgcheck=0
EOF
```
