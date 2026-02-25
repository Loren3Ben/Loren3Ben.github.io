# docker 基本使用



### 安装Docker的完整步骤



**步骤1：卸载旧版本Docker（如果存在）**  

sudo apt remove docker docker-engine docker.io containerd runc

**步骤2：安装必要依赖**  

sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common

**步骤3：添加Docker官方GPG密钥**

```
#创建keyrings目录（如果不存在）

sudo mkdir -p /etc/apt/keyrings

#下载并安装Docker的GPG密钥

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

**步骤4：添加Docker APT仓库**

```
# 添加Docker官方仓库
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

**步骤5：更新并安装Docker**

```
# 更新包含Docker仓库的软件包列表
sudo apt update

# 安装Docker及相关组件
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

**步骤6：验证安装和后续配置**

```
# 启动Docker服务并设置开机自启
sudo systemctl start docker
sudo systemctl enable docker

# 验证安装
sudo docker --version
sudo docker run hello-world

# 将当前用户加入docker组（可选，避免每次使用sudo）
sudo usermod -aG docker $USER
```

