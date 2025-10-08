####
# Build script to build the ESMF project
# from source using an apptainer image to install all
# the system dependencies.
#
# This requires apptainer installed which only works on
# Linux machines. However, using apptainer means the
# nasa-land-coupler can be easily installed and run on
# any Linux machine.
####
export ESMF_DIR=$ROOT_DIR/esmf_build
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT=O
export ESMF_COMPILER=gfortran
export ESMF_CXX=mpicc
export ESMF_INSTALL_PREFIX=$ROOT_DIR/esmf_install
export ESMF_MODDIR="$ESMF_DIR/mod/modO/Linux.gfortran.64.openmpi.default"

cd $ESMF_DIR
echo MOD
echo $ESMF_MODDIR
mkdir -p $ESMF_MODDIR
cp /usr/lib64/gfortran/modules/netcdf*.mod $ESMF_MODDIR
ls $ESMF_MODDIR
gmake info &>info.log
echo INSTALL DIR $ESMF_INSTALL_PREFIX
gmake &>make.log
make install &> install.log
