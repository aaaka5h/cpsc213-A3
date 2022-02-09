# int  a;
# int* p;
# int  b[5];

#  a = 3;
#  p = &a;
#  *p = *p - 1;
#
#  p = &b[0];
#  p++;
#  p[a] = b[a];
#  *(p+3) = b[0];

.pos 0x100     
                # ld vars into registers
                ld $a, r0               # r0 = address of a
                ld $p, r1               # r1 = address of p
                ld $b, r2               # r2 = address of b

                # a = 3
                ld 0x0(r0), r3          # r3 = value of a
                ld $0x3, r4             # r4 = 3 (value)
                st r4, 0x0(r0)          # a = 3
                ld $0x3, r3             # r3 = value of a (0x3)

                # p = &a
                st r0, 0x0(r1)          # p = address of a

                # *p = *p - 1
                ld 0x0(r1), r5          # r5 = value of p (address of a)
                ld 0x0(r5), r6          # r6 = value of a
                dec r6                  # r6 = r6 - 1
                st r6, 0x0(r5)          # *p = *p - 1

                # p = &b[0]
                st r2, 0x0(r1)          # p = address of b
                ld 0x0(r1), r5          # r5 = value of p (address of b)

                # p++
                ld $b, r7                # r7 = address of b 
                inca r7                  # r7 = r7 + 4
                st r7, 0x0(r1)           # p = address of b[1]

                # p[a] = b[a]
                ld (r2, r6, 4), r7      # r7 = b[a]
                st r7, (r1, r6, 4)      # p[a] = b[a]

                # *(p+3) = b[0]
                ld $0x0, r4             # r4 = 0
                ld (r2, r4, 4), r3      # r3 = b[0]
                ld $0x3, r4             # r4 = 3
                st r3, (r6, r4, 4)      # p[3] = b[0]

                halt                    # halt

.pos 0x1000
a:              .long 0x00000002        # a = 2
p:              .long 0x00000004        # p = 4
b:              .long 0x00000001        # b[0] = 1
                .long 0x00000002        # b[1] = 2
                .long 0x00000003        # b[2] = 3
                .long 0x00000004        # b[3] = 4
                .long 0x00000005        # b[4] = 5
                                

