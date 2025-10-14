echo Running inside container
echo NLC_DIR $NLC_DIR
#cp /usr/lib64/gfortran/modules/netcdf*.mod $LIS_MODESMF
echo "CONFIGURE"
bash ./configure.sh < nlc_prompts.txt
echo BUILD
bash ./build.sh --clean