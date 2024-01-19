sudo apt-get install \
   autoconf \
   curl \
   libtool \
   patch \
   python3-pip \
   unzip \
   wget \
   virtualenv

#libc++-15-dev
#libc++-dev
#libc++1-15
#libc++abi-15-dev
#libc++abi1-15
#lib32stdc++-8-dev
#libstdc++-8-dev


sudo wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-$([ $(uname -m) = "aarch64" ] && echo "arm64" || echo "amd64")
sudo chmod +x /usr/local/bin/bazel

cd /app/src
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
mv clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04 llvm14

wget https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.5/clang+llvm-15.0.5-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-15.0.5-x86_64-linux-gnu-ubuntu-18.04.tar.xz
mv clang+llvm-15.0.5-x86_64-linux-gnu-ubuntu-18.04 llvm15

git clone https://github.com/envoyproxy/envoy envoy14
cd /app/src/envoy14
bazel clean
#bazel clean --expunge
bazel/setup_clang.sh /app/src/llvm14
#bazel build envoy --config=libc++
bazel build envoy --config=clang
bazel build envoy --config=sizeopt

git clone https://github.com/envoyproxy/envoy envoy15
cd /app/src/envoy15
bazel clean
#bazel clean --expunge
bazel/setup_clang.sh /app/src/llvm15
bazel build envoy --config=libc++
#bazel build envoy --config=clang

bazel --bazelrc=/dev/null build -c opt envoy.stripped 
--define deprecated_features=disabled --define perf_annotation=enabled
--copt="-g0" --copt="-fpic"

bazel --bazelrc=/dev/null build -c opt envoy.stripped \
 --define deprecated_features=disabled --define perf_annotation=enabled \
 --copt="-g0" --copt="-fpic"
 
ls -alh ./bazel-bin/source/exe
#ldd ./bazel-bin/source/exe/envoy-static 
#./bazel-bin/source/exe/envoy-static --config-path /app/src/cfg/config.yaml

## gcc13
```
cd /app/src/
sudo apt install build-essential
sudo apt install gcc-multilib
unset LIBRARY_PATH
unset LD_LIBRARY_PATH
#export LIBRARY_PATH=$LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/
wget https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.gz
tar xzf gcc-13.2.0.tar.gz
cd /app/src/gcc-13.2.0
./contrib/download_prerequisites 
./configure --prefix=/app/gcc13
#./configure --disable-multilib --prefix=/app/gcc13
make -j$(nproc)
sudo make install
/app/gcc13/bin/gcc --version

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 20
gcc --version
```


 
export CC=/app/gcc13/
export CXX=/app/gcc13/

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

sudo apt-get install clang
sudo update-alternatives --config cc
sudo update-alternatives --config c++


#cd /app/src/
#wget https://go.dev/dl/go1.21.6.src.tar.gz
#tar xzf go1.21.6.src.tar.gz
mkdir -p ~/go/src/github.com/traefik/traefik
cd ~/go/src/github.com/traefik/traefik
wget https://go.dev/dl/go1.20.13.linux-amd64.tar.gz
tar xzf go1.20.13.linux-amd64.tar.gz
sudo rm -rf /usr/local/go/
sudo chown -R root:root ./go
sudo mv go /usr/local
export GO111MODULE=on
export GOPATH=$HOME/.gowork
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

cd /app/src/
git clone https://github.com/traefik/traefik traefik
cd ./traefik/
export GO111MODULE=on
export GOPATH=$HOME/.gowork
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
go build ./cmd/traefik
go generate
#ls -alh ~/go/src/github.com/traefik/traefik
go test -v ./...
go test ./...
cd integration && go test -integration ./....
```