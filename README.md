![](https://github.com/MinsukJi-NOAA/ci-test-base/workflows/centos%207/badge.svg)
![](https://github.com/MinsukJi-NOAA/ci-test-base/workflows/ubuntu%2020.04/badge.svg)

- Docker image to be used by ufs-weather-model for continuous integration
- Install tool chains and dependencies
- Adapted from https://github.com/DusanJovic-NOAA/simple-ufs

- CentOS 7
  - As root install (in the location):
    - gcc 9.1.1 (/opt/rh/devtoolset-9/root/usr/bin/)
    - cmake 3.17.0 (/usr/local/cmake/bin/)
    - mpich 3.3.1 (/usr/local/mpich3/)
    - hdf5 1.10.6 (/usr/local/)
    - netcdf 4.7.4 (/usr/local/)
    - netcdf-fortran 4.5.2 (/usr/local/)
    - esmf 8.1.0 beta snapshot 27 (/usr/local/)
    - ncep libararies develop branch (/usr/local/NCEPlibs/)
      - bacio-2.4.1
      - nemsio-2.5.2
      - w3nco-2.4.1
      - sp-2.3.3
      - w3emc-2.7.3
      - sigio-2.3.2
    - docker pull minsukjinoaa/ci-test-base:centos7

- Ubuntu 20.04
  - As root install (in the location):
    - gcc 9.3.0 (/usr/bin/)
    - cmake 3.16.3 (/usr/bin/)
    - mpich 3.3.2 (/usr/bin/)
    - hdf5 1.10.6 (/usr/local/)
    - netcdf 4.7.4 (/usr/local/)
    - netcdf-fortran 4.5.2 (/usr/local/)
    - esmf 8.1.0 beta snapshot 27 (/usr/local/)
    - ncep libararies develop branch (/usr/local/NCEPlibs/)
      - bacio-2.4.1
      - nemsio-2.5.2
      - w3nco-2.4.1
      - sp-2.3.3
      - w3emc-2.7.3
      - sigio-2.3.2
    - docker pull minsukjinoaa/ci-test-base:ubuntu20.04
