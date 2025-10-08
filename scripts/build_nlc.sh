#####
# Build 

export ROOT_DIR="$(dirname $(dirname $(realpath "$0")))"
export ESMF_DIR="$ROOT_DIR/esmf_build"
export ESMF_INSTALL_DIR=$ROOT_DIR/esmf_install
export SCRIPTS_DIR="$ROOT_DIR/scripts"
export NLC_DIR=$(realpath "$ROOT_DIR/../NASA-Land-Coupler")
echo $NLC_DIR
cd $NLC_DIR
export LIS_MODESMF=$ESMF_INSTALL_DIR/mod
export LIS_LIBESMF=$ESMF_INSTALL_DIR/lib

apptainer exec $SCRIPTS_DIR/nlc.sif bash $SCRIPTS_DIR/in_container/build_nlc.sh

