## lua
```sh
export APP=app ; export SRC=src ; export LUA=lua
cd /$APP/$SRC

wget http://www.lua.org/ftp/lua-5.4.4.tar.gz
wget https://www.linuxfromscratch.org/patches/blfs/svn/lua-5.4.4-shared_library-1.patch
tar xvf ./lua-5.4.4.tar.gz && cd ./lua-5.4.4/
```

```sh
cat << EOF >> lua.pc 
V=5.4 
R=5.4.4 

prefix=/app/lua 
INSTALL_BIN=${prefix}/bin 
INSTALL_INC=${prefix}/include 
INSTALL_LIB=${prefix}/lib 
INSTALL_MAN=${prefix}/share/man/man1 
INSTALL_LMOD=${prefix}/share/lua/${V} 
INSTALL_CMOD=${prefix}/lib/lua/${V} 
exec_prefix=${prefix} 
libdir=${exec_prefix}/lib 
includedir=${prefix}/include 
 
Name: Lua 
Description: An Extensible Extension Language 
Version: ${R} 
Requires: 
Libs: -L${libdir} -llua -lm -ldl 
Cflags: -I${includedir} 
EOF 
```

```sh
make clean
patch -Np1 -i ../lua-5.4.4-shared_library-1.patch

make -j $(nproc) linux-readline
[[ $? -eq 0 ]] && make test
#[[ $? -eq 0 ]] && make install INSTALL_TOP=/$APP/$LUA

make INSTALL_TOP=/app/lua INSTALL_DATA="cp -d" INSTALL_MAN=/app/lua/man/man1 \
TO_LIB="liblua.so liblua.so.5.4 liblua.so.5.4.4" install

mkdir -pv /app/lua/doc/lua-5.4.4 &&
cp -v doc/*.{html,css,gif,png} /app/lua/doc/lua-5.4.4 &&
install -v -m644 -D lua.pc /usr/lib/pkgconfig/lua.pc

echo '/app/lua/lib' > /etc/ld.so.conf.d/lua54.conf && ldconfig
ldconfig -p | grep lua

useradd -M -U -r -s `which nologin` -d /$APP/$LUA $LUA
chown -R $LUA:$LUA /$APP/$LUA
```
