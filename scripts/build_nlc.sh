#####
# Build 

export ROOT_DIR="$(dirname $(dirname $(realpath "$0")))"
export ESMF_DIR="$ROOT_DIR/esmf_build"
export ESMF_INSTALL_DIR=$ROOT_DIR/esmf_install
export ECODES_INSTALL_DIR=$ROOT_DIR/eccodes_install
export SCRIPTS_DIR="$ROOT_DIR/scripts"
export NLC_DIR=$(realpath "$ROOT_DIR/../NASA-Land-Coupler")
echo $NLC_DIR
cd $NLC_DIR
export LIS_ARCH=linux_ifc
export LIS_FC=gfortran
export LIS_CC=mpicc
export LIS_MODESMF=$ESMF_INSTALL_DIR/mod
export LIS_LIBESMF=$ESMF_INSTALL_DIR/lib
export LIS_HDF4=/usr/lib64
export LIS_HDF5=/usr/lib64
export LIS_HDFEOS=/usr/lib64
export CMAKE_C_COMPILER=mpicc
export CMAKE_CXX_COMPILER=g++
export CMAKE_Fortran_COMPILER=gfortran
export EXTRA_CMAKE_SETTINGS="-DNetCDF_FORTRAN_INCLUDE_DIR=/usr/lib64/gfortran/modules -DNetCDF_C_INCLUDE_DIR=/usr/include"
export ESMFMKFILE=$ESMF_INSTALL_DIR/lib/libO/Linux.gfortran.64.openmpi.default/esmf.mk
apptainer exec $SCRIPTS_DIR/nlc.sif bash $SCRIPTS_DIR/in_container/build_nlc.sh

