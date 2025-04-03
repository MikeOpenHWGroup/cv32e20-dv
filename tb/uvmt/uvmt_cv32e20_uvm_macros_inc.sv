// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Copyright 2020,2022 OpenHW Group
// Copyright 2020 Silicon Labs, Inc.
// Copyright 2025 Thales DIS France SAS
// 
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.0
//

`ifndef __UVMT_CV32E20_UVM_MACROS_INC_SV__
`define __UVMT_CV32E20_UVM_MACROS_INC_SV__

// Simple inclusion of the uvm_macros.svh file into compilation scope.
// This should only be used in Xcelium where automatic load of UVM does not
// include the macros definition file.
// use of this include file "first" in the simulator compilation filelist
// ensures all macros are properly defined for usage
`include "uvm_macros.svh"

`define ASSERT_WARNING(msg)\
    `ifdef UVM\
        uvm_pkg::uvm_report_warning("ASSERT FAILED", msg, uvm_pkg::UVM_NONE, 1)\
    `else\
        $warning("%0t: ASSERT FAILED %0s", $time, msg)\
    `endif

`define ASSERT_ERROR(msg)\
    `ifdef UVM\
        uvm_pkg::uvm_report_error("ASSERT FAILED", msg, uvm_pkg::UVM_NONE, 1)\
    `else\
        $error("%0t: ASSERT FAILED %0s", $time, msg)\
    `endif

`define ASSERT_FATAL(msg)\
    `ifdef UVM\
        uvm_pkg::uvm_report_fatal("ASSERT FAILED", msg, uvm_pkg::UVM_NONE, 1)\
    `else\
        $fatal("%0t: ASSERT FAILED %0s", $time, msg)\
    `endif

`endif // __UVMT_CV32E20_UVM_MACROS_INC_SV__
