FROM ubuntu:bionic as cppbuild
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y build-essential
RUN apt install -y cmake
WORKDIR /libbuild
COPY *.cpp .
COPY CMakeLists.txt .
RUN cmake -DCMAKE_BUILD_TYPE=Release .
RUN make

FROM python:3 as final
WORKDIR /app
COPY *.py .
COPY --from=cppbuild /libbuild/*.so .
ENTRYPOINT ["python", "callCpp.py"]