#  t  = s[2];
#  t  = s[t];   // t = s[s[2]]
#  m  = &p;
#  *m = 9;
#  m  = &s[s[8]];
#  *m = *m + s[1];

.pos 0x100
                # ld vars into registers
                ld $t, r0               # r0 = address of t
                ld $p, r1               # r1 = address of p
                ld $m, r2               # r2 = address of m
                ld $s, r3               # r3 = address of s

                # t = s[2]
                ld 0x8(r3), r4          # r4 = value of s[2]
                st r4, 0x0(r0)          # t = value of s[2]

                # t = s[t]
                ld (r3, r4, 4), r4      # r4 = value of s[t]
                st r4, 0x0(r0)          # t = value of s[t]

                # m = &p
                st r1, 0x0(r2)          # m = address of p 

                # *m = 9
                ld $0x9, r5             # r5 = 0x9 (value)
                ld 0x0(r2), r6          # r6 = value of m (address of p)
                st r5, 0x0(r6)          # value of m = 0x9 (*m = 9)

                # m = &s[s[8]]
                ld 0x20(r3), r7         # r7 = value of s[8]
                shl $2, r7              # r7 = 2^2 * value of s[8]
                add r3, r7              # r7 = r3 + r7 (address of s[0] + 4*s[8])
                st r7, 0x0(r2)          # m = address of s[s[8]]

                # *m = *m + s[1]          
                ld 0x4(r3), r0          # r0 = value of s[1]
                ld 0x0(r7), r1          # r1 = value of s[s[8]]
                add r0, r1              # r1 = r0 + r1
                st r1, 0x0(r7)          # value of m (r7) = s[s[8]] + s[1]

                halt                    # halt program

.pos 0x1000
t:              .long 0xffffffff        # t = -1
p:              .long 0xffffffff        # p = -1
m:              .long 0xffffffff        # m = -1

.pos 0x2000
s:              .long 0x00000000        # s[0] = 9
                .long 0x00000001        # s[1] = 8
                .long 0x00000002        # s[2] = 7
                .long 0x00000003        # s[3] = 6
                .long 0x00000004        # s[4] = 5
                .long 0x00000005        # s[5] = 4
                .long 0x00000006        # s[6] = 3
                .long 0x00000007        # s[7] = 2
                .long 0x00000008        # s[8] = 1
                .long 0x00000009        # s[9] = 0
                
