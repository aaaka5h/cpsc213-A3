#  t  = s[2];
#  t  = s[t];   // t = s[s[2]]
#  m  = &p;
#  *m = 9;
#  m  = &s[s[8]];
#  *m = *m + s[1];

.pos 0x100
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
                ld 32(r3), r7           # r7 = value of s[8]
                




.pos 0x1000
t:              .long 0xffffffff        # t = -1
p:              .long 0xffffffff        # p = -1
m:              .long 0xffffffff        # m = -1

.pos 0x2000
s:              .long 0xffffffff        # s[0] = -1
                .long 0xffffffff        # s[1] = -1
                .long 0xffffffff        # s[2] = -1
                .long 0xffffffff        # s[3] = -1
                .long 0xffffffff        # s[4] = -1
                .long 0xffffffff        # s[5] = -1
                .long 0xffffffff        # s[6] = -1
                .long 0xffffffff        # s[7] = -1
                .long 0xffffffff        # s[8] = -1
                .long 0xffffffff        # s[9] = -1
                
 


.pos 0x100
                ld $f, r0                # r0 = address of f
                ld $m, r1                # r1 = address of m
                ld $0x04, r2             # r2 = 0x04
                ld $0xffffffff, r3       # r3 = 0x0f
                ld 0x0(r0), r4           # r4 = value of f
                ld $0x01, r5             # r5 = 0x01   

                add r4, r5               # (f + 1)
                add r5, r2               # ((f + 1) + 4)
                shl $2, r2               # (((f + 1) + 4) << 2)
                and r4, r2               # ((((f + 1) + 4) << 2) & f)
                shr $4, r2               # (((((f + 1) + 4) << 2) & f) / 16)
                st r2, 0x0(r1)           # m = (((((f + 1) + 4) << 2) & f) / 16)
                halt                     # halt        


.pos 0x1000 
m:              .long 0xffffffff         # m = -1
.pos 0x2000
f:              .long 0xffffffff         # f = -1