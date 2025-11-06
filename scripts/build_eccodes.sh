#####
# Script to get the source code of ESMF into a directory.
#
# This should be run external to the container and creates
#####
export ROOT_DIR="$(dirname $(dirname $(realpath "$0")))"
export ECCODES_BUILD_DIR="$ROOT_DIR/eccodes"
export ECCODES_DIR="$ROOT_DIR/eccodes_install"
export SCRIPTS_DIR="$ROOT_DIR/scripts"
cd $ROOT_DIR
if [[ ! -d "$ECCODES_BUILD_DIR" ]]; then
    cd $ROOT_DIR
    git clone https://github.com/ecmwf/eccodes.git
    cd $ECCODES_BUILD_DIR
    apptainer exec $SCRIPTS_DIR/nlc.sif bash $SCRIPTS_DIR/in_container/build_eccodes.sh
else
    echo Already built $ECCODES_BUILD_DIR
    cd $ECCODES_BUILD_DIR
    apptainer exec $SCRIPTS_DIR/nlc.sif bash $SCRIPTS_DIR/in_container/build_eccodes.sh
fi
if [[ ! -d "$ECCODES_DIR/lib" ]]; then
    echo Create soft link for $ECCODES_DIR/lib from $ECCODES_DIR/lib64
    ln -s $ECCODES_DIR/lib64 $ECCODES_DIR/lib
fi


