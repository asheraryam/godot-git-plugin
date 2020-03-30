git submodule init;
git submodule update --init --recursive;

cd godot-git-plugin/thirdparty/libgit2/
mkdir build
cd build/
rm CMakeCache.txt
cmake ..
cmake --build .
cd ../../../../
find ./ -iname "libgit2.a" -print
mv godot-git-plugin/thirdparty/libgit2/build/libgit2.a demo/bin/x11/libgit2.a

cd godot-cpp/;
apt-get install scons
scons platform=linux target=$1 generate_bindings=yes bits=64;
cd ..
