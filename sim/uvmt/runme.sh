#!/bin/bash

###############################################################################
# Copyright 2025 OpenHW Group
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.0
#
# Dead-simple run-script to demonstrate assertion failure when generated
# a coverage report with both block and expression coverage enabled.
###############################################################################

# Warning! Do not do this unless you have the a riscv-gcc cross-compiler installed.
#make clean_all

# Clean up old coverage reports
rm -rf *-dcreport dsim.*

# Run the (precompiled) hello-world test, once with Block code coverage and again with Block and Expression
make test TEST=hello-world CV_SIMULATOR=dsim USE_ISS=0 TEST_PROG_COMP=NO DSIM_IMAGE=dsim.block.out DSIM_CODE_COV_FLAGS=block GEN_START_INDEX=0 RUN_INDEX=0
make test TEST=hello-world CV_SIMULATOR=dsim USE_ISS=0 TEST_PROG_COMP=NO DSIM_IMAGE=dsim.blockexpression.out DSIM_CODE_COV_FLAGS=block:expression GEN_START_INDEX=1 RUN_INDEX=1

# Generate the HTML reports.
printf "\n\nGenerating the HTML coverage reports....\n"
printf "dcreport -out_dir hw-block-dcreport ./dsim_results/default/hello-world/0/metrics.db\n"
dcreport -out_dir hw-block-dcreport ./dsim_results/default/hello-world/0/metrics.db
sleep 3
printf "dcreport -out_dir hw-block-expression-dcreport ./dsim_results/default/hello-world/1/metrics.db\n"
dcreport -out_dir hw-block-expression-dcreport ./dsim_results/default/hello-world/1/metrics.db
