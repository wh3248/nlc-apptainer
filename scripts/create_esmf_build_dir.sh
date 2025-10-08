    #####
    # Script to get the source code of ESMF into a directory.
    #
    # This should be run external to the container and creates
    #####
    export ROOT_DIR="$(dirname $(dirname $(realpath "$0")))"
    export ESMF_DIR="$ROOT_DIR/esmf_build"
    export SCRIPTS_DIR="$ROOT_DIR/scripts"
    if [[ ! -d "$ESMF_DIR" ]]; then
    if [[ -d "$ESMF_DIR" ]]; then
        echo "Remove the directory $ESMF_DIR"
        exit 0
    fi
    echo "Create ESMF_DIR"
    wget https://github.com/esmf-org/esmf/archive/refs/tags/v8.9.0.zip
    unzip v8.9.0.zip
    mv esmf-8.9.0 $ESMF_DIR
    rm v8.9.0.zip
    fi
    cd $ESMF_DIR
    pwd
    ls $SCRIPTS_DIR
    apptainer exec $SCRIPTS_DIR/nlc.sif bash $SCRIPTS_DIR/build_esmf.sh

  