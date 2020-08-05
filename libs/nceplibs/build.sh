#!/bin/bash

## Yet another simple script that downloads and builds
## nceplibs libraries required for the UFS Weather application.
##      -Dusan Jovic Oct. 2019

set -eu
set -o pipefail

usage() {
  echo "Usage: $0 gnu | intel"
  exit 1
}

[[ $# -ne 1 ]] && usage

COMPILERS=$1

if [[ $COMPILERS == gnu ]]; then
  export CC=${CC:-gcc}
  export CXX=${CXX:-g++}
  export FC=${FC:-gfortran}
elif [[ $COMPILERS == intel ]]; then
  if [[ $(type ftn &> /dev/null) ]]; then
    # Special case on Cray systems
    export CC=${CC:-cc}
    export CXX=${CXX:-CC}
    export FC=${FC:-ftn}
  else
    export CC=${CC:-icc}
    export CXX=${CXX:-icpc}
    export FC=${FC:-ifort}
  fi
else
  usage
fi

date

echo
echo "Building nceplibs libraries using ${COMPILERS} compilers"
echo
#
# print compiler version
#
echo
${CC} --version | head -1
${CXX} --version | head -1
${FC} --version | head -1
mpiexec --version
cmake --version | head -1
echo

MYDIR=$(cd "$(dirname "$(readlink -n "${BASH_SOURCE[0]}" )" )" && pwd -P)

printf '%-.30s ' "Building NCEPLIBS ..........................."
(
  set -x

  rm -rf build
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr/local/NCEPlibs \
        -DCMAKE_C_COMPILER=${CC} \
        -DCMAKE_Fortran_COMPILER=${FC} \
        -DCMAKE_PREFIX_PATH="/usr/local" \
        ../NCEPLIBS

  make -j8 VERBOSE=1

) > log_NCEPLIBS 2>&1
echo 'done'

echo
date

echo
echo "Finished"
