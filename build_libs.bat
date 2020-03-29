set GODOT_PATH_RELATIVE_TO_PLUGIN="..\godot\bin"
set GIT_PLUGIN_RELATIVE_TO_GODOT="..\..\godot-git-plugin\"
git submodule init
git submodule update --init --recursive
cd %GODOT_PATH_RELATIVE_TO_PLUGIN%
godot.windows.tools.64.exe --gdnative-generate-json-api api.json
copy api.json %GIT_PLUGIN_RELATIVE_TO_GODOT%\api.json /Y
cd %GIT_PLUGIN_RELATIVE_TO_GODOT%

cd godot-git-plugin\thirdparty\libgit2\
mkdir build
cd build\
del /F CMakeCache.txt
cmake ..
cmake --build .
cd ../../../../
copy godot-git-plugin\thirdparty\libgit2\build\%1\git2.lib demo\bin\win64\

cd godot-cpp\
scons platform=windows target=%1 generate_bindings=yes bits=64
cd ..