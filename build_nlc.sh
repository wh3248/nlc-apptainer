####
# Build script to build the nasa-land-coupler project
# from source using an apptainer image to install all
# the system dependencies.
#
# This requires apptainer installed which only works on
# Linux machines. However, using apptainer means the
# nasa-land-coupler can be easily installed and run on
# any Linux machine.
####
if [[! -f esmf_build]] then;
    echo build
fi

