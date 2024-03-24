#!/usr/bin/env bash
set -e

docker run --cap-add CHECKPOINT_RESTORE --cap-add SYS_ADMIN --rm -p 8080:8080 --name spring-boot-demo-jvm-restore marcelop3251/spring-boot-demo-jvm-restore:checkpoint