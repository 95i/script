#!/bin/bash

set -e

JDK_URL="https://pan.isn.im/d/%E8%BD%AF%E4%BB%B6/jdk-8u321-linux-x64.tar.gz"
INSTALL_DIR="/usr/local"
JDK_NAME="jdk1.8.0_321"
PROFILE_FILE="/etc/profile"

echo ">>> 1. 检查 root 权限"
if [ "$EUID" -ne 0 ]; then
  echo "请使用 root 用户执行该脚本"
  exit 1
fi

echo ">>> 2. 下载 JDK"
cd /tmp
if [ ! -f jdk-8u321-linux-x64.tar.gz ]; then
  wget -O jdk-8u321-linux-x64.tar.gz "$JDK_URL" --no-check-certificate
else
  echo "JDK 压缩包已存在，跳过下载"
fi

echo ">>> 3. 解压并安装到 /usr/local"
tar -zxf jdk-8u321-linux-x64.tar.gz
rm -rf ${INSTALL_DIR}/${JDK_NAME}
mv ${JDK_NAME} ${INSTALL_DIR}/

echo ">>> 4. 配置 /etc/profile 环境变量"

# 先清理旧的 JDK 配置（避免重复）
sed -i '/JAVA_HOME=\/usr\/local\/jdk1.8.0_321/d' ${PROFILE_FILE}
sed -i '/JRE_HOME=\/usr\/local\/jdk1.8.0_321\/jre/d' ${PROFILE_FILE}
sed -i '/CLASS_PATH=.*jdk1.8.0_321/d' ${PROFILE_FILE}

cat >> ${PROFILE_FILE} <<EOF

# >>> JDK 8u321
export JAVA_HOME=${INSTALL_DIR}/${JDK_NAME}
export JRE_HOME=\$JAVA_HOME/jre
export CLASS_PATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib
export PATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin
# <<< JDK 8u321
EOF

echo ">>> 5. 立即生效环境变量"
source /etc/profile

echo ">>> 6. 验证 Java"
java -version

echo ">>> JDK 8u321 安装并配置完成 ✔"
