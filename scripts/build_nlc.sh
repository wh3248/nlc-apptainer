#####
# Build the NASA-Land-Coupler GIT REPO with LIS
# Assume that the Git Repo has already been cloned to a parallel directory using:
# git clone --recursive git@github.com:NESII/lishydro.git
#
# This is the directory given by the instructions in the GitRepol
#     https://github.com/NASA-LIS/NASA-Land-Coupler

#
# Also assumes that the script to patch to clone repo has been run
#  bash patch_nlc.sh
#
# The patch script adds a file env/verde/verde.sh to support the verde environment
#
# This script sets required environment variables and then configures and builds the project.
#####


export ROOT_DIR="$(dirname $(dirname $(realpath "$0")))"
export ESMF_DIR="$ROOT_DIR/esmf_build"
export ESMF_INSTALL_DIR=$ROOT_DIR/esmf_install
export ECODES_INSTALL_DIR=$ROOT_DIR/eccodes_install
export SCRIPTS_DIR="$ROOT_DIR/scripts"
#export NLC_DIR=$(realpath "$ROOT_DIR/../NASA-Land-Coupler")
export NLC_DIR=$(realpath "$ROOT_DIR/../lishydro")
echo $NLC_DIR
cd $NLC_DIR
export LIS_ARCH=linux_gfortran
export LIS_FC=gfortran
export LIS_CC=mpicc
export LIS_MODESMF=$ESMF_INSTALL_DIR
export LIS_LIBESMF=$ESMF_INSTALL_DIR
export LIS_HDF4=/usr
export LIS_HDF5=/usr
export LIS_HDFEOS=/usr
export CMAKE_C_COMPILER=mpicc
export CMAKE_CXX_COMPILER=g++
export CMAKE_Fortran_COMPILER=mpifort
#export EXTRA_CMAKE_SETTINGS="-DNetCDF_FORTRAN_INCLUDE_DIR=/usr/lib64/gfortran/modules -DNetCDF_C_INCLUDE_DIR=/usr/include"
export ESMFMKFILE=$ESMF_INSTALL_DIR/lib/libO/Linux.gfortran.64.openmpi.default/esmf.mk
apptainer exec $SCRIPTS_DIR/nlc.sif bash $SCRIPTS_DIR/in_container/build_nlc.sh

