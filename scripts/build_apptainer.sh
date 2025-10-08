####
# Build script to build apptainer image with the NLC and ESMF
# required libraries.
####
ROOT_DIR="$(dirname $(dirname $(realpath "$0")))"
echo ROOT $ROOT_DIR
SCRIPTS_DIR="$ROOT_DIR/scripts"
echo SCRIPTS $SCRIPTS_DIR
rm -rf "$SCRIPTS_DIR/nlc.sif" "$SCRIPTS_DIR/nlc.log"
cd $scrips_dir
apptainer build --sandbox "$SCRIPTS_DIR/nlc.sif" "$SCRIPTS_DIR/nlc.def" 2>&1 | tee "$SCRIPTS_DIR/nlc.log"
#apptainer build "$SCRIPTS_DIR/nlc.sif" "$SCRIPTS_DIR/nlc.def" 2>&1 | tee "$SCRIPTS_DIR/nlc.log"
