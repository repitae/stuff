sudo apt-get install \
   autoconf \
   curl \
   libtool \
   patch \
   python3-pip \
   unzip \
   wget \
   virtualenv


#sudo apt-get install libc++-15-dev libc++-dev libc++1-15 libc++abi-15-dev libc++abi1-15 lib32stdc++-8-dev libstdc++-8-dev

sudo wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-$([ $(uname -m) = "aarch64" ] && echo "arm64" || echo "amd64")
sudo chmod +x /usr/local/bin/bazel

cd /app
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
mv clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04 llvm14

cd /app
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.5/clang+llvm-15.0.5-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-15.0.5-x86_64-linux-gnu-ubuntu-18.04.tar.xz
mv clang+llvm-15.0.5-x86_64-linux-gnu-ubuntu-18.04 llvm15

cd /app
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.4/clang+llvm-16.0.4-x86_64-linux-gnu-ubuntu-22.04.tar.xz
tar xf clang+llvm-16.0.4-x86_64-linux-gnu-ubuntu-22.04.tar.xz
mv clang+llvm-16.0.4-x86_64-linux-gnu-ubuntu-22.04.tar llvm16

cd /app/src/
git clone https://github.com/envoyproxy/envoy envoy14
cd /app/src/envoy14
bazel clean
#bazel clean --expunge
bazel/setup_clang.sh /app/src/llvm14
bazel build envoy --config=clang --config=sizeopt

cd /app/src/
git clone https://github.com/envoyproxy/envoy envoy15
cd /app/src/envoy15
bazel clean
#bazel clean --expunge
bazel/setup_clang.sh /app/src/llvm15
bazel build envoy --config=libc++ --config=sizeopt

cd /app/src/
git clone https://github.com/envoyproxy/envoy envoy16
cd /app/src/envoy16
bazel clean
#bazel clean --expunge
bazel/setup_clang.sh /app/src/llvm16
bazel build envoy --config=libc++ --config=sizeopt


bazel --bazelrc=/dev/null build -c opt envoy.stripped 

bazel --bazelrc=/dev/null build -c opt envoy.stripped \
 --define deprecated_features=disabled --define perf_annotation=enabled \
 --copt="-g0" --copt="-fpic"
 
ls -alh ./bazel-bin/source/exe
ldd ./bazel-bin/source/exe/envoy
./bazel-bin/source/exe/envoy --config-path /app/src/cfg/config.yaml

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++