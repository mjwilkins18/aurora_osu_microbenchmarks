#!/bin/bash

MPI_PATH=/home/wilkins/mpich/build/install
MPIEXEC_PATH=/opt/cray/pals/1.4/bin/mpiexec
OSU_PATH=/home/wilkins/test/aurora_osu_microbenchmarks/build/libexec/osu-micro-benchmarks/mpi
GET_LOCAL_RANK_PATH=/home/wilkins/osu_microbenchmarks_sycl/c/get_local_rank

PROCS=24
PPN=12

${MPIEXEC_PATH} \
    -n $PROCS \
    -ppn $PPN \
    -genv MPIR_CVAR_ALLREDUCE_INTRA_ALGORITHM=recursive_doubling \
    -genv MPICH_ALLREDUCE_POSIX_INTRA_ALGORITHM=release_gather \
    -genv MPIR_CVAR_ALLREDUCE_COMPOSITION=1 \
    ${GET_LOCAL_RANK_PATH} \
    ${OSU_PATH}/collective/osu_allreduce -d sycl
