// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sme2,+sme-i16i64 < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sme2,+sme-i16i64 < %s \
// RUN:        | llvm-objdump -d --mattr=+sme2,+sme-i16i64 - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sme2,+sme-i16i64 < %s \
// RUN:        | llvm-objdump -d --mattr=-sme2 - | FileCheck %s --check-prefix=CHECK-UNKNOWN
// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sme2,+sme-i16i64 < %s \
// RUN:        | sed '/.text/d' | sed 's/.*encoding: //g' \
// RUN:        | llvm-mc -triple=aarch64 -mattr=+sme2,+sme-i16i64 -disassemble -show-encoding \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST


add     za.s[w8, 0, vgx2], {z0.s, z1.s}, z0.s  // 11000001, 00100000, 00011000, 00010000
// CHECK-INST: add     za.s[w8, 0, vgx2], { z0.s, z1.s }, z0.s
// CHECK-ENCODING: [0x10,0x18,0x20,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1201810 <unknown>

add     za.s[w8, 0], {z0.s - z1.s}, z0.s  // 11000001-00100000-00011000-00010000
// CHECK-INST: add     za.s[w8, 0, vgx2], { z0.s, z1.s }, z0.s
// CHECK-ENCODING: [0x10,0x18,0x20,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1201810 <unknown>

add     za.s[w10, 5, vgx2], {z10.s, z11.s}, z5.s  // 11000001, 00100101, 01011001, 01010101
// CHECK-INST: add     za.s[w10, 5, vgx2], { z10.s, z11.s }, z5.s
// CHECK-ENCODING: [0x55,0x59,0x25,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1255955 <unknown>

add     za.s[w10, 5], {z10.s - z11.s}, z5.s  // 11000001-00100101-01011001-01010101
// CHECK-INST: add     za.s[w10, 5, vgx2], { z10.s, z11.s }, z5.s
// CHECK-ENCODING: [0x55,0x59,0x25,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1255955 <unknown>

add     za.s[w11, 7, vgx2], {z13.s, z14.s}, z8.s  // 11000001, 00101000, 01111001, 10110111
// CHECK-INST: add     za.s[w11, 7, vgx2], { z13.s, z14.s }, z8.s
// CHECK-ENCODING: [0xb7,0x79,0x28,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12879b7 <unknown>

add     za.s[w11, 7], {z13.s - z14.s}, z8.s  // 11000001-00101000-01111001-10110111
// CHECK-INST: add     za.s[w11, 7, vgx2], { z13.s, z14.s }, z8.s
// CHECK-ENCODING: [0xb7,0x79,0x28,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12879b7 <unknown>

add     za.s[w11, 7, vgx2], {z31.s, z0.s}, z15.s  // 11000001, 00101111, 01111011, 11110111
// CHECK-INST: add     za.s[w11, 7, vgx2], { z31.s, z0.s }, z15.s
// CHECK-ENCODING: [0xf7,0x7b,0x2f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12f7bf7 <unknown>

add     za.s[w11, 7], {z31.s - z0.s}, z15.s  // 11000001-00101111-01111011-11110111
// CHECK-INST: add     za.s[w11, 7, vgx2], { z31.s, z0.s }, z15.s
// CHECK-ENCODING: [0xf7,0x7b,0x2f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12f7bf7 <unknown>

add     za.s[w8, 5, vgx2], {z17.s, z18.s}, z0.s  // 11000001, 00100000, 00011010, 00110101
// CHECK-INST: add     za.s[w8, 5, vgx2], { z17.s, z18.s }, z0.s
// CHECK-ENCODING: [0x35,0x1a,0x20,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1201a35 <unknown>

add     za.s[w8, 5], {z17.s - z18.s}, z0.s  // 11000001-00100000-00011010-00110101
// CHECK-INST: add     za.s[w8, 5, vgx2], { z17.s, z18.s }, z0.s
// CHECK-ENCODING: [0x35,0x1a,0x20,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1201a35 <unknown>

add     za.s[w8, 1, vgx2], {z1.s, z2.s}, z14.s  // 11000001, 00101110, 00011000, 00110001
// CHECK-INST: add     za.s[w8, 1, vgx2], { z1.s, z2.s }, z14.s
// CHECK-ENCODING: [0x31,0x18,0x2e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12e1831 <unknown>

add     za.s[w8, 1], {z1.s - z2.s}, z14.s  // 11000001-00101110-00011000-00110001
// CHECK-INST: add     za.s[w8, 1, vgx2], { z1.s, z2.s }, z14.s
// CHECK-ENCODING: [0x31,0x18,0x2e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12e1831 <unknown>

add     za.s[w10, 0, vgx2], {z19.s, z20.s}, z4.s  // 11000001, 00100100, 01011010, 01110000
// CHECK-INST: add     za.s[w10, 0, vgx2], { z19.s, z20.s }, z4.s
// CHECK-ENCODING: [0x70,0x5a,0x24,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1245a70 <unknown>

add     za.s[w10, 0], {z19.s - z20.s}, z4.s  // 11000001-00100100-01011010-01110000
// CHECK-INST: add     za.s[w10, 0, vgx2], { z19.s, z20.s }, z4.s
// CHECK-ENCODING: [0x70,0x5a,0x24,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1245a70 <unknown>

add     za.s[w8, 0, vgx2], {z12.s, z13.s}, z2.s  // 11000001, 00100010, 00011001, 10010000
// CHECK-INST: add     za.s[w8, 0, vgx2], { z12.s, z13.s }, z2.s
// CHECK-ENCODING: [0x90,0x19,0x22,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1221990 <unknown>

add     za.s[w8, 0], {z12.s - z13.s}, z2.s  // 11000001-00100010-00011001-10010000
// CHECK-INST: add     za.s[w8, 0, vgx2], { z12.s, z13.s }, z2.s
// CHECK-ENCODING: [0x90,0x19,0x22,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1221990 <unknown>

add     za.s[w10, 1, vgx2], {z1.s, z2.s}, z10.s  // 11000001, 00101010, 01011000, 00110001
// CHECK-INST: add     za.s[w10, 1, vgx2], { z1.s, z2.s }, z10.s
// CHECK-ENCODING: [0x31,0x58,0x2a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12a5831 <unknown>

add     za.s[w10, 1], {z1.s - z2.s}, z10.s  // 11000001-00101010-01011000-00110001
// CHECK-INST: add     za.s[w10, 1, vgx2], { z1.s, z2.s }, z10.s
// CHECK-ENCODING: [0x31,0x58,0x2a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12a5831 <unknown>

add     za.s[w8, 5, vgx2], {z22.s, z23.s}, z14.s  // 11000001, 00101110, 00011010, 11010101
// CHECK-INST: add     za.s[w8, 5, vgx2], { z22.s, z23.s }, z14.s
// CHECK-ENCODING: [0xd5,0x1a,0x2e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12e1ad5 <unknown>

add     za.s[w8, 5], {z22.s - z23.s}, z14.s  // 11000001-00101110-00011010-11010101
// CHECK-INST: add     za.s[w8, 5, vgx2], { z22.s, z23.s }, z14.s
// CHECK-ENCODING: [0xd5,0x1a,0x2e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12e1ad5 <unknown>

add     za.s[w11, 2, vgx2], {z9.s, z10.s}, z1.s  // 11000001, 00100001, 01111001, 00110010
// CHECK-INST: add     za.s[w11, 2, vgx2], { z9.s, z10.s }, z1.s
// CHECK-ENCODING: [0x32,0x79,0x21,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1217932 <unknown>

add     za.s[w11, 2], {z9.s - z10.s}, z1.s  // 11000001-00100001-01111001-00110010
// CHECK-INST: add     za.s[w11, 2, vgx2], { z9.s, z10.s }, z1.s
// CHECK-ENCODING: [0x32,0x79,0x21,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1217932 <unknown>

add     za.s[w9, 7, vgx2], {z12.s, z13.s}, z11.s  // 11000001, 00101011, 00111001, 10010111
// CHECK-INST: add     za.s[w9, 7, vgx2], { z12.s, z13.s }, z11.s
// CHECK-ENCODING: [0x97,0x39,0x2b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12b3997 <unknown>

add     za.s[w9, 7], {z12.s - z13.s}, z11.s  // 11000001-00101011-00111001-10010111
// CHECK-INST: add     za.s[w9, 7, vgx2], { z12.s, z13.s }, z11.s
// CHECK-ENCODING: [0x97,0x39,0x2b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c12b3997 <unknown>


add     za.d[w8, 0, vgx2], {z0.d, z1.d}, z0.d  // 11000001, 01100000, 00011000, 00010000
// CHECK-INST: add     za.d[w8, 0, vgx2], { z0.d, z1.d }, z0.d
// CHECK-ENCODING: [0x10,0x18,0x60,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1601810 <unknown>

add     za.d[w8, 0], {z0.d - z1.d}, z0.d  // 11000001-01100000-00011000-00010000
// CHECK-INST: add     za.d[w8, 0, vgx2], { z0.d, z1.d }, z0.d
// CHECK-ENCODING: [0x10,0x18,0x60,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1601810 <unknown>

add     za.d[w10, 5, vgx2], {z10.d, z11.d}, z5.d  // 11000001, 01100101, 01011001, 01010101
// CHECK-INST: add     za.d[w10, 5, vgx2], { z10.d, z11.d }, z5.d
// CHECK-ENCODING: [0x55,0x59,0x65,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1655955 <unknown>

add     za.d[w10, 5], {z10.d - z11.d}, z5.d  // 11000001-01100101-01011001-01010101
// CHECK-INST: add     za.d[w10, 5, vgx2], { z10.d, z11.d }, z5.d
// CHECK-ENCODING: [0x55,0x59,0x65,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1655955 <unknown>

add     za.d[w11, 7, vgx2], {z13.d, z14.d}, z8.d  // 11000001, 01101000, 01111001, 10110111
// CHECK-INST: add     za.d[w11, 7, vgx2], { z13.d, z14.d }, z8.d
// CHECK-ENCODING: [0xb7,0x79,0x68,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16879b7 <unknown>

add     za.d[w11, 7], {z13.d - z14.d}, z8.d  // 11000001-01101000-01111001-10110111
// CHECK-INST: add     za.d[w11, 7, vgx2], { z13.d, z14.d }, z8.d
// CHECK-ENCODING: [0xb7,0x79,0x68,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16879b7 <unknown>

add     za.d[w11, 7, vgx2], {z31.d, z0.d}, z15.d  // 11000001, 01101111, 01111011, 11110111
// CHECK-INST: add     za.d[w11, 7, vgx2], { z31.d, z0.d }, z15.d
// CHECK-ENCODING: [0xf7,0x7b,0x6f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16f7bf7 <unknown>

add     za.d[w11, 7], {z31.d - z0.d}, z15.d  // 11000001-01101111-01111011-11110111
// CHECK-INST: add     za.d[w11, 7, vgx2], { z31.d, z0.d }, z15.d
// CHECK-ENCODING: [0xf7,0x7b,0x6f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16f7bf7 <unknown>

add     za.d[w8, 5, vgx2], {z17.d, z18.d}, z0.d  // 11000001, 01100000, 00011010, 00110101
// CHECK-INST: add     za.d[w8, 5, vgx2], { z17.d, z18.d }, z0.d
// CHECK-ENCODING: [0x35,0x1a,0x60,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1601a35 <unknown>

add     za.d[w8, 5], {z17.d - z18.d}, z0.d  // 11000001-01100000-00011010-00110101
// CHECK-INST: add     za.d[w8, 5, vgx2], { z17.d, z18.d }, z0.d
// CHECK-ENCODING: [0x35,0x1a,0x60,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1601a35 <unknown>

add     za.d[w8, 1, vgx2], {z1.d, z2.d}, z14.d  // 11000001, 01101110, 00011000, 00110001
// CHECK-INST: add     za.d[w8, 1, vgx2], { z1.d, z2.d }, z14.d
// CHECK-ENCODING: [0x31,0x18,0x6e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16e1831 <unknown>

add     za.d[w8, 1], {z1.d - z2.d}, z14.d  // 11000001-01101110-00011000-00110001
// CHECK-INST: add     za.d[w8, 1, vgx2], { z1.d, z2.d }, z14.d
// CHECK-ENCODING: [0x31,0x18,0x6e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16e1831 <unknown>

add     za.d[w10, 0, vgx2], {z19.d, z20.d}, z4.d  // 11000001, 01100100, 01011010, 01110000
// CHECK-INST: add     za.d[w10, 0, vgx2], { z19.d, z20.d }, z4.d
// CHECK-ENCODING: [0x70,0x5a,0x64,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1645a70 <unknown>

add     za.d[w10, 0], {z19.d - z20.d}, z4.d  // 11000001-01100100-01011010-01110000
// CHECK-INST: add     za.d[w10, 0, vgx2], { z19.d, z20.d }, z4.d
// CHECK-ENCODING: [0x70,0x5a,0x64,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1645a70 <unknown>

add     za.d[w8, 0, vgx2], {z12.d, z13.d}, z2.d  // 11000001, 01100010, 00011001, 10010000
// CHECK-INST: add     za.d[w8, 0, vgx2], { z12.d, z13.d }, z2.d
// CHECK-ENCODING: [0x90,0x19,0x62,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1621990 <unknown>

add     za.d[w8, 0], {z12.d - z13.d}, z2.d  // 11000001-01100010-00011001-10010000
// CHECK-INST: add     za.d[w8, 0, vgx2], { z12.d, z13.d }, z2.d
// CHECK-ENCODING: [0x90,0x19,0x62,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1621990 <unknown>

add     za.d[w10, 1, vgx2], {z1.d, z2.d}, z10.d  // 11000001, 01101010, 01011000, 00110001
// CHECK-INST: add     za.d[w10, 1, vgx2], { z1.d, z2.d }, z10.d
// CHECK-ENCODING: [0x31,0x58,0x6a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16a5831 <unknown>

add     za.d[w10, 1], {z1.d - z2.d}, z10.d  // 11000001-01101010-01011000-00110001
// CHECK-INST: add     za.d[w10, 1, vgx2], { z1.d, z2.d }, z10.d
// CHECK-ENCODING: [0x31,0x58,0x6a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16a5831 <unknown>

add     za.d[w8, 5, vgx2], {z22.d, z23.d}, z14.d  // 11000001, 01101110, 00011010, 11010101
// CHECK-INST: add     za.d[w8, 5, vgx2], { z22.d, z23.d }, z14.d
// CHECK-ENCODING: [0xd5,0x1a,0x6e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16e1ad5 <unknown>

add     za.d[w8, 5], {z22.d - z23.d}, z14.d  // 11000001-01101110-00011010-11010101
// CHECK-INST: add     za.d[w8, 5, vgx2], { z22.d, z23.d }, z14.d
// CHECK-ENCODING: [0xd5,0x1a,0x6e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16e1ad5 <unknown>

add     za.d[w11, 2, vgx2], {z9.d, z10.d}, z1.d  // 11000001, 01100001, 01111001, 00110010
// CHECK-INST: add     za.d[w11, 2, vgx2], { z9.d, z10.d }, z1.d
// CHECK-ENCODING: [0x32,0x79,0x61,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1617932 <unknown>

add     za.d[w11, 2], {z9.d - z10.d}, z1.d  // 11000001-01100001-01111001-00110010
// CHECK-INST: add     za.d[w11, 2, vgx2], { z9.d, z10.d }, z1.d
// CHECK-ENCODING: [0x32,0x79,0x61,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1617932 <unknown>

add     za.d[w9, 7, vgx2], {z12.d, z13.d}, z11.d  // 11000001, 01101011, 00111001, 10010111
// CHECK-INST: add     za.d[w9, 7, vgx2], { z12.d, z13.d }, z11.d
// CHECK-ENCODING: [0x97,0x39,0x6b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16b3997 <unknown>

add     za.d[w9, 7], {z12.d - z13.d}, z11.d  // 11000001-01101011-00111001-10010111
// CHECK-INST: add     za.d[w9, 7, vgx2], { z12.d, z13.d }, z11.d
// CHECK-ENCODING: [0x97,0x39,0x6b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c16b3997 <unknown>


add     za.s[w8, 0, vgx4], {z0.s - z3.s}, z0.s  // 11000001-00110000-00011000-00010000
// CHECK-INST: add     za.s[w8, 0, vgx4], { z0.s - z3.s }, z0.s
// CHECK-ENCODING: [0x10,0x18,0x30,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1301810 <unknown>

add     za.s[w8, 0], {z0.s - z3.s}, z0.s  // 11000001-00110000-00011000-00010000
// CHECK-INST: add     za.s[w8, 0, vgx4], { z0.s - z3.s }, z0.s
// CHECK-ENCODING: [0x10,0x18,0x30,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1301810 <unknown>

add     za.s[w10, 5, vgx4], {z10.s - z13.s}, z5.s  // 11000001-00110101-01011001-01010101
// CHECK-INST: add     za.s[w10, 5, vgx4], { z10.s - z13.s }, z5.s
// CHECK-ENCODING: [0x55,0x59,0x35,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1355955 <unknown>

add     za.s[w10, 5], {z10.s - z13.s}, z5.s  // 11000001-00110101-01011001-01010101
// CHECK-INST: add     za.s[w10, 5, vgx4], { z10.s - z13.s }, z5.s
// CHECK-ENCODING: [0x55,0x59,0x35,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1355955 <unknown>

add     za.s[w11, 7, vgx4], {z13.s - z16.s}, z8.s  // 11000001-00111000-01111001-10110111
// CHECK-INST: add     za.s[w11, 7, vgx4], { z13.s - z16.s }, z8.s
// CHECK-ENCODING: [0xb7,0x79,0x38,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13879b7 <unknown>

add     za.s[w11, 7], {z13.s - z16.s}, z8.s  // 11000001-00111000-01111001-10110111
// CHECK-INST: add     za.s[w11, 7, vgx4], { z13.s - z16.s }, z8.s
// CHECK-ENCODING: [0xb7,0x79,0x38,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13879b7 <unknown>

add     za.s[w11, 7, vgx4], {z31.s - z2.s}, z15.s  // 11000001-00111111-01111011-11110111
// CHECK-INST: add     za.s[w11, 7, vgx4], { z31.s, z0.s, z1.s, z2.s }, z15.s
// CHECK-ENCODING: [0xf7,0x7b,0x3f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13f7bf7 <unknown>

add     za.s[w11, 7], {z31.s - z2.s}, z15.s  // 11000001-00111111-01111011-11110111
// CHECK-INST: add     za.s[w11, 7, vgx4], { z31.s, z0.s, z1.s, z2.s }, z15.s
// CHECK-ENCODING: [0xf7,0x7b,0x3f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13f7bf7 <unknown>

add     za.s[w8, 5, vgx4], {z17.s - z20.s}, z0.s  // 11000001-00110000-00011010-00110101
// CHECK-INST: add     za.s[w8, 5, vgx4], { z17.s - z20.s }, z0.s
// CHECK-ENCODING: [0x35,0x1a,0x30,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1301a35 <unknown>

add     za.s[w8, 5], {z17.s - z20.s}, z0.s  // 11000001-00110000-00011010-00110101
// CHECK-INST: add     za.s[w8, 5, vgx4], { z17.s - z20.s }, z0.s
// CHECK-ENCODING: [0x35,0x1a,0x30,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1301a35 <unknown>

add     za.s[w8, 1, vgx4], {z1.s - z4.s}, z14.s  // 11000001-00111110-00011000-00110001
// CHECK-INST: add     za.s[w8, 1, vgx4], { z1.s - z4.s }, z14.s
// CHECK-ENCODING: [0x31,0x18,0x3e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13e1831 <unknown>

add     za.s[w8, 1], {z1.s - z4.s}, z14.s  // 11000001-00111110-00011000-00110001
// CHECK-INST: add     za.s[w8, 1, vgx4], { z1.s - z4.s }, z14.s
// CHECK-ENCODING: [0x31,0x18,0x3e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13e1831 <unknown>

add     za.s[w10, 0, vgx4], {z19.s - z22.s}, z4.s  // 11000001-00110100-01011010-01110000
// CHECK-INST: add     za.s[w10, 0, vgx4], { z19.s - z22.s }, z4.s
// CHECK-ENCODING: [0x70,0x5a,0x34,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1345a70 <unknown>

add     za.s[w10, 0], {z19.s - z22.s}, z4.s  // 11000001-00110100-01011010-01110000
// CHECK-INST: add     za.s[w10, 0, vgx4], { z19.s - z22.s }, z4.s
// CHECK-ENCODING: [0x70,0x5a,0x34,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1345a70 <unknown>

add     za.s[w8, 0, vgx4], {z12.s - z15.s}, z2.s  // 11000001-00110010-00011001-10010000
// CHECK-INST: add     za.s[w8, 0, vgx4], { z12.s - z15.s }, z2.s
// CHECK-ENCODING: [0x90,0x19,0x32,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1321990 <unknown>

add     za.s[w8, 0], {z12.s - z15.s}, z2.s  // 11000001-00110010-00011001-10010000
// CHECK-INST: add     za.s[w8, 0, vgx4], { z12.s - z15.s }, z2.s
// CHECK-ENCODING: [0x90,0x19,0x32,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1321990 <unknown>

add     za.s[w10, 1, vgx4], {z1.s - z4.s}, z10.s  // 11000001-00111010-01011000-00110001
// CHECK-INST: add     za.s[w10, 1, vgx4], { z1.s - z4.s }, z10.s
// CHECK-ENCODING: [0x31,0x58,0x3a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13a5831 <unknown>

add     za.s[w10, 1], {z1.s - z4.s}, z10.s  // 11000001-00111010-01011000-00110001
// CHECK-INST: add     za.s[w10, 1, vgx4], { z1.s - z4.s }, z10.s
// CHECK-ENCODING: [0x31,0x58,0x3a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13a5831 <unknown>

add     za.s[w8, 5, vgx4], {z22.s - z25.s}, z14.s  // 11000001-00111110-00011010-11010101
// CHECK-INST: add     za.s[w8, 5, vgx4], { z22.s - z25.s }, z14.s
// CHECK-ENCODING: [0xd5,0x1a,0x3e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13e1ad5 <unknown>

add     za.s[w8, 5], {z22.s - z25.s}, z14.s  // 11000001-00111110-00011010-11010101
// CHECK-INST: add     za.s[w8, 5, vgx4], { z22.s - z25.s }, z14.s
// CHECK-ENCODING: [0xd5,0x1a,0x3e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13e1ad5 <unknown>

add     za.s[w11, 2, vgx4], {z9.s - z12.s}, z1.s  // 11000001-00110001-01111001-00110010
// CHECK-INST: add     za.s[w11, 2, vgx4], { z9.s - z12.s }, z1.s
// CHECK-ENCODING: [0x32,0x79,0x31,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1317932 <unknown>

add     za.s[w11, 2], {z9.s - z12.s}, z1.s  // 11000001-00110001-01111001-00110010
// CHECK-INST: add     za.s[w11, 2, vgx4], { z9.s - z12.s }, z1.s
// CHECK-ENCODING: [0x32,0x79,0x31,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1317932 <unknown>

add     za.s[w9, 7, vgx4], {z12.s - z15.s}, z11.s  // 11000001-00111011-00111001-10010111
// CHECK-INST: add     za.s[w9, 7, vgx4], { z12.s - z15.s }, z11.s
// CHECK-ENCODING: [0x97,0x39,0x3b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13b3997 <unknown>

add     za.s[w9, 7], {z12.s - z15.s}, z11.s  // 11000001-00111011-00111001-10010111
// CHECK-INST: add     za.s[w9, 7, vgx4], { z12.s - z15.s }, z11.s
// CHECK-ENCODING: [0x97,0x39,0x3b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c13b3997 <unknown>


add     za.d[w8, 0, vgx4], {z0.d - z3.d}, z0.d  // 11000001-01110000-00011000-00010000
// CHECK-INST: add     za.d[w8, 0, vgx4], { z0.d - z3.d }, z0.d
// CHECK-ENCODING: [0x10,0x18,0x70,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1701810 <unknown>

add     za.d[w8, 0], {z0.d - z3.d}, z0.d  // 11000001-01110000-00011000-00010000
// CHECK-INST: add     za.d[w8, 0, vgx4], { z0.d - z3.d }, z0.d
// CHECK-ENCODING: [0x10,0x18,0x70,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1701810 <unknown>

add     za.d[w10, 5, vgx4], {z10.d - z13.d}, z5.d  // 11000001-01110101-01011001-01010101
// CHECK-INST: add     za.d[w10, 5, vgx4], { z10.d - z13.d }, z5.d
// CHECK-ENCODING: [0x55,0x59,0x75,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1755955 <unknown>

add     za.d[w10, 5], {z10.d - z13.d}, z5.d  // 11000001-01110101-01011001-01010101
// CHECK-INST: add     za.d[w10, 5, vgx4], { z10.d - z13.d }, z5.d
// CHECK-ENCODING: [0x55,0x59,0x75,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1755955 <unknown>

add     za.d[w11, 7, vgx4], {z13.d - z16.d}, z8.d  // 11000001-01111000-01111001-10110111
// CHECK-INST: add     za.d[w11, 7, vgx4], { z13.d - z16.d }, z8.d
// CHECK-ENCODING: [0xb7,0x79,0x78,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17879b7 <unknown>

add     za.d[w11, 7], {z13.d - z16.d}, z8.d  // 11000001-01111000-01111001-10110111
// CHECK-INST: add     za.d[w11, 7, vgx4], { z13.d - z16.d }, z8.d
// CHECK-ENCODING: [0xb7,0x79,0x78,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17879b7 <unknown>

add     za.d[w11, 7, vgx4], {z31.d - z2.d}, z15.d  // 11000001-01111111-01111011-11110111
// CHECK-INST: add     za.d[w11, 7, vgx4], { z31.d, z0.d, z1.d, z2.d }, z15.d
// CHECK-ENCODING: [0xf7,0x7b,0x7f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17f7bf7 <unknown>

add     za.d[w11, 7], {z31.d - z2.d}, z15.d  // 11000001-01111111-01111011-11110111
// CHECK-INST: add     za.d[w11, 7, vgx4], { z31.d, z0.d, z1.d, z2.d }, z15.d
// CHECK-ENCODING: [0xf7,0x7b,0x7f,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17f7bf7 <unknown>

add     za.d[w8, 5, vgx4], {z17.d - z20.d}, z0.d  // 11000001-01110000-00011010-00110101
// CHECK-INST: add     za.d[w8, 5, vgx4], { z17.d - z20.d }, z0.d
// CHECK-ENCODING: [0x35,0x1a,0x70,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1701a35 <unknown>

add     za.d[w8, 5], {z17.d - z20.d}, z0.d  // 11000001-01110000-00011010-00110101
// CHECK-INST: add     za.d[w8, 5, vgx4], { z17.d - z20.d }, z0.d
// CHECK-ENCODING: [0x35,0x1a,0x70,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1701a35 <unknown>

add     za.d[w8, 1, vgx4], {z1.d - z4.d}, z14.d  // 11000001-01111110-00011000-00110001
// CHECK-INST: add     za.d[w8, 1, vgx4], { z1.d - z4.d }, z14.d
// CHECK-ENCODING: [0x31,0x18,0x7e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17e1831 <unknown>

add     za.d[w8, 1], {z1.d - z4.d}, z14.d  // 11000001-01111110-00011000-00110001
// CHECK-INST: add     za.d[w8, 1, vgx4], { z1.d - z4.d }, z14.d
// CHECK-ENCODING: [0x31,0x18,0x7e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17e1831 <unknown>

add     za.d[w10, 0, vgx4], {z19.d - z22.d}, z4.d  // 11000001-01110100-01011010-01110000
// CHECK-INST: add     za.d[w10, 0, vgx4], { z19.d - z22.d }, z4.d
// CHECK-ENCODING: [0x70,0x5a,0x74,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1745a70 <unknown>

add     za.d[w10, 0], {z19.d - z22.d}, z4.d  // 11000001-01110100-01011010-01110000
// CHECK-INST: add     za.d[w10, 0, vgx4], { z19.d - z22.d }, z4.d
// CHECK-ENCODING: [0x70,0x5a,0x74,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1745a70 <unknown>

add     za.d[w8, 0, vgx4], {z12.d - z15.d}, z2.d  // 11000001-01110010-00011001-10010000
// CHECK-INST: add     za.d[w8, 0, vgx4], { z12.d - z15.d }, z2.d
// CHECK-ENCODING: [0x90,0x19,0x72,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1721990 <unknown>

add     za.d[w8, 0], {z12.d - z15.d}, z2.d  // 11000001-01110010-00011001-10010000
// CHECK-INST: add     za.d[w8, 0, vgx4], { z12.d - z15.d }, z2.d
// CHECK-ENCODING: [0x90,0x19,0x72,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1721990 <unknown>

add     za.d[w10, 1, vgx4], {z1.d - z4.d}, z10.d  // 11000001-01111010-01011000-00110001
// CHECK-INST: add     za.d[w10, 1, vgx4], { z1.d - z4.d }, z10.d
// CHECK-ENCODING: [0x31,0x58,0x7a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17a5831 <unknown>

add     za.d[w10, 1], {z1.d - z4.d}, z10.d  // 11000001-01111010-01011000-00110001
// CHECK-INST: add     za.d[w10, 1, vgx4], { z1.d - z4.d }, z10.d
// CHECK-ENCODING: [0x31,0x58,0x7a,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17a5831 <unknown>

add     za.d[w8, 5, vgx4], {z22.d - z25.d}, z14.d  // 11000001-01111110-00011010-11010101
// CHECK-INST: add     za.d[w8, 5, vgx4], { z22.d - z25.d }, z14.d
// CHECK-ENCODING: [0xd5,0x1a,0x7e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17e1ad5 <unknown>

add     za.d[w8, 5], {z22.d - z25.d}, z14.d  // 11000001-01111110-00011010-11010101
// CHECK-INST: add     za.d[w8, 5, vgx4], { z22.d - z25.d }, z14.d
// CHECK-ENCODING: [0xd5,0x1a,0x7e,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17e1ad5 <unknown>

add     za.d[w11, 2, vgx4], {z9.d - z12.d}, z1.d  // 11000001-01110001-01111001-00110010
// CHECK-INST: add     za.d[w11, 2, vgx4], { z9.d - z12.d }, z1.d
// CHECK-ENCODING: [0x32,0x79,0x71,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1717932 <unknown>

add     za.d[w11, 2], {z9.d - z12.d}, z1.d  // 11000001-01110001-01111001-00110010
// CHECK-INST: add     za.d[w11, 2, vgx4], { z9.d - z12.d }, z1.d
// CHECK-ENCODING: [0x32,0x79,0x71,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c1717932 <unknown>

add     za.d[w9, 7, vgx4], {z12.d - z15.d}, z11.d  // 11000001-01111011-00111001-10010111
// CHECK-INST: add     za.d[w9, 7, vgx4], { z12.d - z15.d }, z11.d
// CHECK-ENCODING: [0x97,0x39,0x7b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17b3997 <unknown>

add     za.d[w9, 7], {z12.d - z15.d}, z11.d  // 11000001-01111011-00111001-10010111
// CHECK-INST: add     za.d[w9, 7, vgx4], { z12.d - z15.d }, z11.d
// CHECK-ENCODING: [0x97,0x39,0x7b,0xc1]
// CHECK-ERROR: instruction requires: sme2
// CHECK-UNKNOWN: c17b3997 <unknown>

