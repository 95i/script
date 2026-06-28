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
cat >/etc/yum.repos.d/CentOS-Vault.repo <<'EOF'
[BaseOS]
name=CentOS-8.5 - BaseOS
baseurl=https://mirrors.aliyun.com/centos-vault/8.5.2111/BaseOS/$basearch/os/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[AppStream]
name=CentOS-8.5 - AppStream
baseurl=https://mirrors.aliyun.com/centos-vault/8.5.2111/AppStream/$basearch/os/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[PowerTools]
name=CentOS-8.5 - PowerTools
baseurl=https://mirrors.aliyun.com/centos-vault/8.5.2111/PowerTools/$basearch/os/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[extras]
name=CentOS-8.5 - Extras
baseurl=https://mirrors.aliyun.com/centos-vault/8.5.2111/extras/$basearch/os/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
dnf clean all
dnf makecache
```
