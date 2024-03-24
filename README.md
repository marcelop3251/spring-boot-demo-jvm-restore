# Spring-boot-demo-jvm-restore
This project is an example demonstration of the "JVM Checkpoint Restore" feature provided by Spring Boot. The goal is to illustrate how this feature can be used to create and restore checkpoints in a running Java application

## Steps to Run the Demonstration

### Step 1: Build and Execute Checkpoint

The first step involves running the checkpoint.sh script. This script is responsible for compiling the project, packaging it into a Docker image, and running a container with that image. After this initialization, the checkpoint is performed by Spring and the restoration files are created.

```
sh checkpoint.sh
```

### Step 2: Checkpoint Restore

After completing the first step, we can proceed with checkpoint restoration. This can be done by running the restore.sh script. This script simply executes a new container created from the restoration files generated in the previous step.

```
sh restore.sh
```

With these two steps, we can successfully demonstrate the "JVM Checkpoint Restore" feature in action. If there are any issues or questions during the demonstration execution, feel free to reach out.

### References
[JVM Checkpoint Store]([url](https://docs.spring.io/spring-framework/reference/integration/checkpoint-restore.html)https://docs.spring.io/spring-framework/reference/integration/checkpoint-restore.html)
[DEMO]([url](https://github.com/sdeleuze/spring-boot-crac-demo)https://github.com/sdeleuze/spring-boot-crac-demo)
