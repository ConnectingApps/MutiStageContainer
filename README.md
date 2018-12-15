# MutiStageContainer
This project shows the usage of [multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/) in Docker. The application simply calls a C++ created library from a python script. In order to create the actual library, a lot of dependencies are needed (such as CMake). However, these dependancies are not needed in the final container. Only python, the script and the created library are needed.

What is nice about multi-stage builds in docker, is that we can split this. We just install a lot of dependencies in an ubuntu container, execute the CMake build there too and then the first stage is finished. The final stage is different. It simply copies the create library from the initial stage and then executes the python script.

It you want to give it a try: ensure you have a recent version of docker and git installed and run the following lines in your console.

```bash
git clone https://github.com/ConnectingApps/MutiStageContainer.git
cd MutiStageContainer
docker build -t msc .
docker run msc
```

**Do not forget the dot (.) in the build statement.**