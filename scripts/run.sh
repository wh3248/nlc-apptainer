ROOT_DIR="$(dirname $(dirname $(realpath "$0")))"
SCRIPTS_DIR="$ROOT_DIR/scripts"
apptainer shell --writable --fakeroot --shell /bin/sh $SCRIPTS_DIR/nlc.sif
#apptainer shell --shell /bin/sh $SCRIPTS_DIR/nlc.sif
