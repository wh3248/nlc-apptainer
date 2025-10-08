#########
# BUILD EECODES in container
#########
mkdir -p build
cd build
echo run Cmake
export CMAKE_PREFIX_PATH=/usr/lib64/cmake
which cmake
cmake .. -DCMAKE_INSTALL_PREFIX=$ECCODES_DIR -DCMAKE_BUILD_TYPE=Release -DENABLE_NETCDF=ON -DENABLE_FORTRAN=ON
echo "***** Run Make"
make
echo "** FINISHED MAKE. RUN INSTALL"
make install
echo "*** ALL DONE INSTALL INTO $ECCODES_DIR"
