FROM ubuntu:bionic as cppbuild
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y build-essential
RUN apt install -y cmake
WORKDIR /libbuild
COPY *.cpp .
COPY CMakeLists.txt .
COPY callCpp.py .
RUN cmake -DCMAKE_BUILD_TYPE=Release .
RUN make
RUN echo 'These are the files now'
RUN ls -lha

FROM python:3 as final
WORKDIR /app
COPY *.py .
COPY --from=cppbuild /libbuild/*.so .
RUN ls -lha
ENTRYPOINT ["python", "callCpp.py"]