.pos 0x100
                # tmp = 0
                ld $tmp, r0             # r0 = address of tmp
                ld 0x0(r0), r1          # r1 = value of tmp (0xc)
                ld $0x0, r2             # r2 = 0x0 (value)
                st r2, 0x0(r0)          # tmp = 0
                ld 0x0(r2), r1          # r1 = value of tmp (0x0)

                # tos = 0
                ld $tos, r3             # r3 = address of tos
                ld 0x0(r3), r4          # r4 = value of tos (0x5)
                st r2, 0x0(r3)          # tos = 0 (r2 = 0x0)
                ld 0x0(r2), r4          # r4 = value of tos (0x0)

                # s[tos] = a[0]
                ld $s, r5               # r5 = address of s
                ld $a, r6               # r6 = address of a
                ld 0x0(r6), r7          # r7 = a[0]
                st r7, (r5, r4, 4)      # s[tos] = a[0] (r4 = value of tos)

                # tos++
                inc r4                  # r4 = r4 + 1
                st r4, 0x0(r3)          # tos = tos + 1

                # s[tos] = a[1]
                inca r6                 # r6 = address of a[1]
                ld 0x0(r6), r7          # r7 = a[1]
                st r7, (r5, r4, 4)      # s[tos] = a[1]

                # tos++
                inc r4                  # r4 = r4 + 1
                st r4, 0x0(r3)          # tos = tos + 1

                # s[tos] = a[2]         
                inca r6                 # r6 = address of a[2]
                ld 0x0(r6), r7          # r7 = a[2]
                st r7, (r5, r4, 4)      # s[tos] = a[2]

                # tos++
                inc r4                  # r4 = r4 + 1
                st r4, 0x0(r3)          # tos = tos + 1

                # tos--
                dec r4                  # r4 = r4 - 1
                st r4, 0x0(r3)          # tos = tos - 1

                # tmp = s[tos]         
                ld (r5, r4, 4), r7      # r7 = s[tos] (last register!)
                st r7, 0x0(r0)          # tmp = s[tos]
                ld 0x0(r0), r1          # r1 = value of tmp

                # tos--
                dec r4                  # r4 = r4 - 1
                st r4, 0x0(r3)          # tos = tos - 1

                # tmp = tmp + s[tos]
                ld (r5, r4, 4), r7      # r7 = s[tos] 
                add r1, r7              # r7 = tmp + s[tos]
                st r7, 0x0(r0)          # tmp = tmp + s[tos]
                ld 0x0(r0), r1          # r1 = value of tmp

                # tos--
                dec r4                  # r4 = r4 - 1
                st r4, 0x0(r3)          # tos = tos - 1

                # tmp = tmp + s[tos]
                ld (r5, r4, 4), r7      # r7 = s[tos]
                add r1, r7              # r7 = tmp + s[tos]
                st r7, 0x0(r0)          # tmp = tmp + s[tos]
                ld 0x0(r0), r1          # r1 = value of tmp

                halt                    # halt








.pos 0x1000
a:              .long 0x00000001        # a[0] = 1
                .long 0x00000002        # a[1] = 2
                .long 0x00000003        # a[2] = 3                
s:              .long 0x00000004        # s[0] = 4
                .long 0x00000005        # s[1] = 5
                .long 0x00000006        # s[2] = 6
                .long 0x00000007        # s[3] = 7
                .long 0x00000008        # s[4] = 8
tos:            .long 0x00000005        # tos = 5;
tmp:            .long 0x0000000c        # tmp = 12;
