#!/bin/bash

set -e

MAVEN_URL="https://pan.isn.im/d/%E8%BD%AF%E4%BB%B6/apache-maven-3.9.12-bin.tar.gz"
INSTALL_DIR="/usr/local"
MAVEN_NAME="apache-maven-3.9.12"
PROFILE_FILE="/etc/profile"

echo ">>> 1. 检查 root 权限"
if [ "$EUID" -ne 0 ]; then
  echo "请使用 root 用户执行该脚本"
  exit 1
fi

echo ">>> 2. 下载 Maven"
cd /tmp
if [ ! -f apache-maven-3.9.12-bin.tar.gz ]; then
  curl -fL -o apache-maven-3.9.12-bin.tar.gz "$MAVEN_URL"
else
  echo "Maven 压缩包已存在，跳过下载"
fi

echo ">>> 3. 解压并安装到 /usr/local"
tar -zxf apache-maven-3.9.12-bin.tar.gz
rm -rf ${INSTALL_DIR}/${MAVEN_NAME}
mv ${MAVEN_NAME} ${INSTALL_DIR}/

echo ">>> 4. 配置 /etc/profile 环境变量"

# 清理旧 Maven 配置，避免重复
sed -i '/MAVEN_HOME=\/usr\/local\/apache-maven-3.9.12/d' ${PROFILE_FILE}
sed -i '/PATH=.*apache-maven-3.9.12/d' ${PROFILE_FILE}

cat >> ${PROFILE_FILE} <<EOF

# >>> Maven 3.9.12
export MAVEN_HOME=${INSTALL_DIR}/${MAVEN_NAME}
export PATH=\$PATH:\$MAVEN_HOME/bin
# <<< Maven 3.9.12
EOF

echo ">>> 5. 立即生效环境变量"
source /etc/profile

echo ">>> 6. 验证 Maven 安装"
mvn -version

echo ">>> Maven 3.9.12 安装完成 ✔"
