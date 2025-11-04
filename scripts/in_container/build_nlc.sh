####
# Build the NLC from inside the apptainer
####
export IN_CONTAINER_DIR="$(dirname $(realpath "$0"))"
echo Configure the NLC
bash ./configure.sh < $IN_CONTAINER_DIR/nlc_prompts.txt
echo Build the NLC
bash ./build.sh --clean --components="LIS"