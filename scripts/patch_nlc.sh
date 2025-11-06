####
# Patch the NASA-Land-Coupler build files in the GIT workspace to support building
# using the Princeton Verde server. The Princeton servers are not supported in the
# NASA-Land-Coupler GIT repo, but a small change can allow them to be built.
#####
NLC_DIR="$(realpath "../../lishydro")"
#NLC_DIR="$(realpath "../../NASA-Land-Coupler")"
SETUP_SCRIPT=$NLC_DIR/scripts/setupenv.sh
MODIFIED_SETUP_SCRIPT=$NLC_DIR/scripts/setupenv.sh.updated
PREFIX=`cat $SETUP_SCRIPT | head -n -3`
cat > "$SETUP_SCRIPT" << EOF
$PREFIX
    "verde.princeton.edu")
      source "env/verde/verde.sh";;
    *) printf "ERROR: no modulefile file for ${1}\n"; exit 1 ;;
  esac
}
EOF
mkdir -p $NLC_DIR/env/verde
cp ./nlc_verde.sh $NLC_DIR/env/verde/verde.sh