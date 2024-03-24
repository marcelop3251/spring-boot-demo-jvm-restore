#!/usr/bin/env bash
set -e
echo "Arquitetura: $(uname -m)"
case $(uname -m) in
    arm64)   url="https://cdn.azul.com/zulu/bin/zulu21.32.17-ca-crac-jdk21.0.2-linux_aarch64.tar.gz" ;;
    *)       url="https://cdn.azul.com/zulu/bin/zulu21.32.17-ca-crac-jdk21.0.2-linux_x64.tar.gz" ;;
esac

echo "Using CRaC enabled JDK $url"

./gradlew clean build
docker build -t marcelop3251/spring-boot-demo-jvm-restore:builder --build-arg CRAC_JDK_URL=$url .
docker run -d --privileged --rm --name=spring-boot-demo-jvm-restore --ulimit nofile=1024 -p 8080:8080 -v $(pwd)/target:/opt/mnt -e FLAG=$1 marcelop3251/spring-boot-demo-jvm-restore:builder
echo "Please wait during creating the checkpoint..."
sleep 10
echo "commit creating the checkpoint..."
docker ps -a
docker commit --change='ENTRYPOINT ["/opt/app/entrypoint.sh"]' $(docker ps -qf "name=spring-boot-demo-jvm-restore") marcelop3251/spring-boot-demo-jvm-restore:checkpoint
echo "commit created with success..."
docker kill $(docker ps -qf "name=spring-boot-demo-jvm-restore")