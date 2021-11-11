.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global do_src1
do_src1:
/* 80101FC8 000FDEE8  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80101FCC 000FDEEC  BF 41 00 28 */	stmw r26, 0x28(r1)
/* 80101FD0 000FDEF0  80 83 00 0C */	lwz r4, 0xc(r3)
/* 80101FD4 000FDEF4  80 A3 00 10 */	lwz r5, 0x10(r3)
/* 80101FD8 000FDEF8  80 C3 00 14 */	lwz r6, 0x14(r3)
/* 80101FDC 000FDEFC  81 03 00 1C */	lwz r8, 0x1c(r3)
/* 80101FE0 000FDF00  80 E3 00 20 */	lwz r7, 0x20(r3)
/* 80101FE4 000FDF04  83 E3 00 04 */	lwz r31, 4(r3)
/* 80101FE8 000FDF08  83 C3 00 00 */	lwz r30, 0(r3)
/* 80101FEC 000FDF0C  81 23 00 08 */	lwz r9, 8(r3)
/* 80101FF0 000FDF10  3D 40 43 30 */	lis r10, 0x4330
/* 80101FF4 000FDF14  91 41 00 08 */	stw r10, 8(r1)
/* 80101FF8 000FDF18  91 41 00 10 */	stw r10, 0x10(r1)
/* 80101FFC 000FDF1C  91 41 00 18 */	stw r10, 0x18(r1)
/* 80102000 000FDF20  91 41 00 20 */	stw r10, 0x20(r1)
/* 80102004 000FDF24  3D 40 80 2F */	lis r10, lbl_802F6A78@ha
/* 80102008 000FDF28  C9 2A 6A 78 */	lfd f9, lbl_802F6A78@l(r10)
/* 8010200C 000FDF2C  54 AA 10 3A */	slwi r10, r5, 2
/* 80102010 000FDF30  81 69 00 00 */	lwz r11, 0(r9)
/* 80102014 000FDF34  83 A9 00 04 */	lwz r29, 4(r9)
/* 80102018 000FDF38  83 89 00 08 */	lwz r28, 8(r9)
/* 8010201C 000FDF3C  7F 7F 50 2E */	lwzx r27, r31, r10
/* 80102020 000FDF40  6D 6B 80 00 */	xoris r11, r11, 0x8000
/* 80102024 000FDF44  6F BD 80 00 */	xoris r29, r29, 0x8000
/* 80102028 000FDF48  91 61 00 0C */	stw r11, 0xc(r1)
/* 8010202C 000FDF4C  6F 9C 80 00 */	xoris r28, r28, 0x8000
/* 80102030 000FDF50  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80102034 000FDF54  6F 7B 80 00 */	xoris r27, r27, 0x8000
/* 80102038 000FDF58  93 81 00 1C */	stw r28, 0x1c(r1)
/* 8010203C 000FDF5C  C8 21 00 08 */	lfd f1, 8(r1)
/* 80102040 000FDF60  93 61 00 24 */	stw r27, 0x24(r1)
/* 80102044 000FDF64  C8 41 00 10 */	lfd f2, 0x10(r1)
/* 80102048 000FDF68  EC 21 48 28 */	fsubs f1, f1, f9
/* 8010204C 000FDF6C  C8 61 00 18 */	lfd f3, 0x18(r1)
/* 80102050 000FDF70  EC 42 48 28 */	fsubs f2, f2, f9
/* 80102054 000FDF74  C8 81 00 20 */	lfd f4, 0x20(r1)
/* 80102058 000FDF78  EC 63 48 28 */	fsubs f3, f3, f9
/* 8010205C 000FDF7C  EC 84 48 28 */	fsubs f4, f4, f9
/* 80102060 000FDF80  3B 40 FF FC */	li r26, -4
/* 80102064 000FDF84  3D 80 80 1F */	lis r12, lbl_801EC800@ha
/* 80102068 000FDF88  39 8C C8 00 */	addi r12, r12, lbl_801EC800@l
/* 8010206C 000FDF8C  39 20 00 A0 */	li r9, 0xa0
/* 80102070 000FDF90  7D 29 03 A6 */	mtctr r9
lbl_80102074:
/* 80102074 000FDF94  54 8A 3D 76 */	rlwinm r10, r4, 7, 0x15, 0x1b
/* 80102078 000FDF98  7C 84 30 14 */	addc r4, r4, r6
/* 8010207C 000FDF9C  7D 4A 62 14 */	add r10, r10, r12
/* 80102080 000FDFA0  7C 00 04 00 */	mcrxr cr0
/* 80102084 000FDFA4  C0 AA 00 00 */	lfs f5, 0(r10)
/* 80102088 000FDFA8  41 82 00 34 */	beq lbl_801020BC
/* 8010208C 000FDFAC  C0 CA 00 04 */	lfs f6, 4(r10)
/* 80102090 000FDFB0  ED 41 01 72 */	fmuls f10, f1, f5
/* 80102094 000FDFB4  C0 EA 00 08 */	lfs f7, 8(r10)
/* 80102098 000FDFB8  ED 42 51 BA */	fmadds f10, f2, f6, f10
/* 8010209C 000FDFBC  C1 0A 00 0C */	lfs f8, 0xc(r10)
/* 801020A0 000FDFC0  ED 43 51 FA */	fmadds f10, f3, f7, f10
/* 801020A4 000FDFC4  3B DE 00 04 */	addi r30, r30, 4
/* 801020A8 000FDFC8  ED 44 52 3A */	fmadds f10, f4, f8, f10
/* 801020AC 000FDFCC  FD 40 50 1E */	fctiwz f10, f10
/* 801020B0 000FDFD0  7D 5A F7 AE */	stfiwx f10, r26, r30
/* 801020B4 000FDFD4  42 00 FF C0 */	bdnz lbl_80102074
/* 801020B8 000FDFD8  48 00 00 70 */	b lbl_80102128
lbl_801020BC:
/* 801020BC 000FDFDC  38 A5 00 01 */	addi r5, r5, 1
/* 801020C0 000FDFE0  C0 CA 00 04 */	lfs f6, 4(r10)
/* 801020C4 000FDFE4  ED 41 01 72 */	fmuls f10, f1, f5
/* 801020C8 000FDFE8  7C 05 40 00 */	cmpw r5, r8
/* 801020CC 000FDFEC  FC 20 10 90 */	fmr f1, f2
/* 801020D0 000FDFF0  C0 EA 00 08 */	lfs f7, 8(r10)
/* 801020D4 000FDFF4  ED 42 51 BA */	fmadds f10, f2, f6, f10
/* 801020D8 000FDFF8  FC 40 18 90 */	fmr f2, f3
/* 801020DC 000FDFFC  C1 0A 00 0C */	lfs f8, 0xc(r10)
/* 801020E0 000FE000  ED 43 51 FA */	fmadds f10, f3, f7, f10
/* 801020E4 000FE004  3B DE 00 04 */	addi r30, r30, 4
/* 801020E8 000FE008  FC 60 20 90 */	fmr f3, f4
/* 801020EC 000FE00C  40 A2 00 08 */	bne+ lbl_801020F4
/* 801020F0 000FE010  7C E5 3B 78 */	mr r5, r7
lbl_801020F4:
/* 801020F4 000FE014  ED 44 52 3A */	fmadds f10, f4, f8, f10
/* 801020F8 000FE018  54 A9 10 3A */	slwi r9, r5, 2
/* 801020FC 000FE01C  42 40 00 24 */	bdz lbl_80102120
/* 80102100 000FE020  7D 49 F8 2E */	lwzx r10, r9, r31
/* 80102104 000FE024  FD 40 50 1E */	fctiwz f10, f10
/* 80102108 000FE028  6D 4A 80 00 */	xoris r10, r10, 0x8000
/* 8010210C 000FE02C  91 41 00 0C */	stw r10, 0xc(r1)
/* 80102110 000FE030  7D 5A F7 AE */	stfiwx f10, r26, r30
/* 80102114 000FE034  C8 81 00 08 */	lfd f4, 8(r1)
/* 80102118 000FE038  EC 84 48 28 */	fsubs f4, f4, f9
/* 8010211C 000FE03C  4B FF FF 58 */	b lbl_80102074
lbl_80102120:
/* 80102120 000FE040  FD 40 50 1E */	fctiwz f10, f10
/* 80102124 000FE044  7D 5A F7 AE */	stfiwx f10, r26, r30
lbl_80102128:
/* 80102128 000FE048  81 23 00 08 */	lwz r9, 8(r3)
/* 8010212C 000FE04C  FC 20 08 1E */	fctiwz f1, f1
/* 80102130 000FE050  FC 40 10 1E */	fctiwz f2, f2
/* 80102134 000FE054  FC 60 18 1E */	fctiwz f3, f3
/* 80102138 000FE058  7C 20 4F AE */	stfiwx f1, 0, r9
/* 8010213C 000FE05C  39 49 00 04 */	addi r10, r9, 4
/* 80102140 000FE060  7C 40 57 AE */	stfiwx f2, 0, r10
/* 80102144 000FE064  39 49 00 08 */	addi r10, r9, 8
/* 80102148 000FE068  7C 60 57 AE */	stfiwx f3, 0, r10
/* 8010214C 000FE06C  90 83 00 0C */	stw r4, 0xc(r3)
/* 80102150 000FE070  90 A3 00 10 */	stw r5, 0x10(r3)
/* 80102154 000FE074  BB 41 00 28 */	lmw r26, 0x28(r1)
/* 80102158 000FE078  38 21 00 40 */	addi r1, r1, 0x40
/* 8010215C 000FE07C  4E 80 00 20 */	blr

.global do_src2
do_src2:
/* 80102160 000FE080  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80102164 000FE084  BF 41 00 28 */	stmw r26, 0x28(r1)
/* 80102168 000FE088  80 83 00 0C */	lwz r4, 0xc(r3)
/* 8010216C 000FE08C  80 A3 00 10 */	lwz r5, 0x10(r3)
/* 80102170 000FE090  80 C3 00 14 */	lwz r6, 0x14(r3)
/* 80102174 000FE094  81 03 00 1C */	lwz r8, 0x1c(r3)
/* 80102178 000FE098  80 E3 00 20 */	lwz r7, 0x20(r3)
/* 8010217C 000FE09C  83 E3 00 04 */	lwz r31, 4(r3)
/* 80102180 000FE0A0  83 C3 00 00 */	lwz r30, 0(r3)
/* 80102184 000FE0A4  81 23 00 08 */	lwz r9, 8(r3)
/* 80102188 000FE0A8  3D 40 43 30 */	lis r10, 0x4330
/* 8010218C 000FE0AC  91 41 00 08 */	stw r10, 8(r1)
/* 80102190 000FE0B0  91 41 00 10 */	stw r10, 0x10(r1)
/* 80102194 000FE0B4  91 41 00 18 */	stw r10, 0x18(r1)
/* 80102198 000FE0B8  91 41 00 20 */	stw r10, 0x20(r1)
/* 8010219C 000FE0BC  3D 40 80 2F */	lis r10, lbl_802F6A78@ha
/* 801021A0 000FE0C0  C9 2A 6A 78 */	lfd f9, lbl_802F6A78@l(r10)
/* 801021A4 000FE0C4  54 AA 10 3A */	slwi r10, r5, 2
/* 801021A8 000FE0C8  81 69 00 00 */	lwz r11, 0(r9)
/* 801021AC 000FE0CC  83 A9 00 04 */	lwz r29, 4(r9)
/* 801021B0 000FE0D0  83 89 00 08 */	lwz r28, 8(r9)
/* 801021B4 000FE0D4  7F 7F 50 2E */	lwzx r27, r31, r10
/* 801021B8 000FE0D8  6D 6B 80 00 */	xoris r11, r11, 0x8000
/* 801021BC 000FE0DC  6F BD 80 00 */	xoris r29, r29, 0x8000
/* 801021C0 000FE0E0  91 61 00 0C */	stw r11, 0xc(r1)
/* 801021C4 000FE0E4  6F 9C 80 00 */	xoris r28, r28, 0x8000
/* 801021C8 000FE0E8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801021CC 000FE0EC  6F 7B 80 00 */	xoris r27, r27, 0x8000
/* 801021D0 000FE0F0  93 81 00 1C */	stw r28, 0x1c(r1)
/* 801021D4 000FE0F4  C8 21 00 08 */	lfd f1, 8(r1)
/* 801021D8 000FE0F8  93 61 00 24 */	stw r27, 0x24(r1)
/* 801021DC 000FE0FC  C8 41 00 10 */	lfd f2, 0x10(r1)
/* 801021E0 000FE100  EC 21 48 28 */	fsubs f1, f1, f9
/* 801021E4 000FE104  C8 61 00 18 */	lfd f3, 0x18(r1)
/* 801021E8 000FE108  EC 42 48 28 */	fsubs f2, f2, f9
/* 801021EC 000FE10C  C8 81 00 20 */	lfd f4, 0x20(r1)
/* 801021F0 000FE110  EC 63 48 28 */	fsubs f3, f3, f9
/* 801021F4 000FE114  EC 84 48 28 */	fsubs f4, f4, f9
/* 801021F8 000FE118  3B 40 FF FC */	li r26, -4
/* 801021FC 000FE11C  3D 80 80 1F */	lis r12, lbl_801EC800@ha
/* 80102200 000FE120  39 8C C8 00 */	addi r12, r12, lbl_801EC800@l
/* 80102204 000FE124  39 20 00 A0 */	li r9, 0xa0
/* 80102208 000FE128  7D 29 03 A6 */	mtctr r9
lbl_8010220C:
/* 8010220C 000FE12C  54 8A 3D 76 */	rlwinm r10, r4, 7, 0x15, 0x1b
/* 80102210 000FE130  7C 84 30 14 */	addc r4, r4, r6
/* 80102214 000FE134  7D 4A 62 14 */	add r10, r10, r12
/* 80102218 000FE138  7C 00 04 00 */	mcrxr cr0
/* 8010221C 000FE13C  38 A5 00 01 */	addi r5, r5, 1
/* 80102220 000FE140  C0 AA 00 00 */	lfs f5, 0(r10)
/* 80102224 000FE144  41 82 00 64 */	beq lbl_80102288
/* 80102228 000FE148  C0 CA 00 04 */	lfs f6, 4(r10)
/* 8010222C 000FE14C  ED 41 01 72 */	fmuls f10, f1, f5
/* 80102230 000FE150  7C 05 40 00 */	cmpw r5, r8
/* 80102234 000FE154  FC 20 10 90 */	fmr f1, f2
/* 80102238 000FE158  C0 EA 00 08 */	lfs f7, 8(r10)
/* 8010223C 000FE15C  ED 42 51 BA */	fmadds f10, f2, f6, f10
/* 80102240 000FE160  FC 40 18 90 */	fmr f2, f3
/* 80102244 000FE164  C1 0A 00 0C */	lfs f8, 0xc(r10)
/* 80102248 000FE168  ED 43 51 FA */	fmadds f10, f3, f7, f10
/* 8010224C 000FE16C  3B DE 00 04 */	addi r30, r30, 4
/* 80102250 000FE170  FC 60 20 90 */	fmr f3, f4
/* 80102254 000FE174  40 A2 00 08 */	bne+ lbl_8010225C
/* 80102258 000FE178  7C E5 3B 78 */	mr r5, r7
lbl_8010225C:
/* 8010225C 000FE17C  ED 44 52 3A */	fmadds f10, f4, f8, f10
/* 80102260 000FE180  54 A9 10 3A */	slwi r9, r5, 2
/* 80102264 000FE184  42 40 00 A8 */	bdz lbl_8010230C
/* 80102268 000FE188  7D 49 F8 2E */	lwzx r10, r9, r31
/* 8010226C 000FE18C  FD 40 50 1E */	fctiwz f10, f10
/* 80102270 000FE190  6D 4A 80 00 */	xoris r10, r10, 0x8000
/* 80102274 000FE194  91 41 00 0C */	stw r10, 0xc(r1)
/* 80102278 000FE198  7D 5A F7 AE */	stfiwx f10, r26, r30
/* 8010227C 000FE19C  C8 81 00 08 */	lfd f4, 8(r1)
/* 80102280 000FE1A0  EC 84 48 28 */	fsubs f4, f4, f9
/* 80102284 000FE1A4  4B FF FF 88 */	b lbl_8010220C
lbl_80102288:
/* 80102288 000FE1A8  7C 05 40 00 */	cmpw r5, r8
/* 8010228C 000FE1AC  C0 CA 00 04 */	lfs f6, 4(r10)
/* 80102290 000FE1B0  40 A2 00 08 */	bne+ lbl_80102298
/* 80102294 000FE1B4  7C E5 3B 78 */	mr r5, r7
lbl_80102298:
/* 80102298 000FE1B8  54 AB 10 3A */	slwi r11, r5, 2
/* 8010229C 000FE1BC  38 A5 00 01 */	addi r5, r5, 1
/* 801022A0 000FE1C0  7F AB F8 2E */	lwzx r29, r11, r31
/* 801022A4 000FE1C4  ED 41 01 72 */	fmuls f10, f1, f5
/* 801022A8 000FE1C8  7C 05 40 00 */	cmpw r5, r8
/* 801022AC 000FE1CC  6F BD 80 00 */	xoris r29, r29, 0x8000
/* 801022B0 000FE1D0  FC 20 18 90 */	fmr f1, f3
/* 801022B4 000FE1D4  C0 EA 00 08 */	lfs f7, 8(r10)
/* 801022B8 000FE1D8  93 A1 00 0C */	stw r29, 0xc(r1)
/* 801022BC 000FE1DC  ED 42 51 BA */	fmadds f10, f2, f6, f10
/* 801022C0 000FE1E0  C1 0A 00 0C */	lfs f8, 0xc(r10)
/* 801022C4 000FE1E4  ED 43 51 FA */	fmadds f10, f3, f7, f10
/* 801022C8 000FE1E8  C8 61 00 08 */	lfd f3, 8(r1)
/* 801022CC 000FE1EC  FC 40 20 90 */	fmr f2, f4
/* 801022D0 000FE1F0  3B DE 00 04 */	addi r30, r30, 4
/* 801022D4 000FE1F4  EC 63 48 28 */	fsubs f3, f3, f9
/* 801022D8 000FE1F8  40 A2 00 08 */	bne+ lbl_801022E0
/* 801022DC 000FE1FC  7C E5 3B 78 */	mr r5, r7
lbl_801022E0:
/* 801022E0 000FE200  ED 44 52 3A */	fmadds f10, f4, f8, f10
/* 801022E4 000FE204  54 A9 10 3A */	slwi r9, r5, 2
/* 801022E8 000FE208  42 40 00 24 */	bdz lbl_8010230C
/* 801022EC 000FE20C  7D 49 F8 2E */	lwzx r10, r9, r31
/* 801022F0 000FE210  FD 40 50 1E */	fctiwz f10, f10
/* 801022F4 000FE214  6D 4A 80 00 */	xoris r10, r10, 0x8000
/* 801022F8 000FE218  91 41 00 0C */	stw r10, 0xc(r1)
/* 801022FC 000FE21C  7D 5A F7 AE */	stfiwx f10, r26, r30
/* 80102300 000FE220  C8 81 00 08 */	lfd f4, 8(r1)
/* 80102304 000FE224  EC 84 48 28 */	fsubs f4, f4, f9
/* 80102308 000FE228  4B FF FF 04 */	b lbl_8010220C
lbl_8010230C:
/* 8010230C 000FE22C  FD 40 50 1E */	fctiwz f10, f10
/* 80102310 000FE230  7D 5A F7 AE */	stfiwx f10, r26, r30
/* 80102314 000FE234  81 23 00 08 */	lwz r9, 8(r3)
/* 80102318 000FE238  FC 20 08 1E */	fctiwz f1, f1
/* 8010231C 000FE23C  FC 40 10 1E */	fctiwz f2, f2
/* 80102320 000FE240  FC 60 18 1E */	fctiwz f3, f3
/* 80102324 000FE244  7C 20 4F AE */	stfiwx f1, 0, r9
/* 80102328 000FE248  39 49 00 04 */	addi r10, r9, 4
/* 8010232C 000FE24C  7C 40 57 AE */	stfiwx f2, 0, r10
/* 80102330 000FE250  39 49 00 08 */	addi r10, r9, 8
/* 80102334 000FE254  7C 60 57 AE */	stfiwx f3, 0, r10
/* 80102338 000FE258  90 83 00 0C */	stw r4, 0xc(r3)
/* 8010233C 000FE25C  90 A3 00 10 */	stw r5, 0x10(r3)
/* 80102340 000FE260  BB 41 00 28 */	lmw r26, 0x28(r1)
/* 80102344 000FE264  38 21 00 40 */	addi r1, r1, 0x40
/* 80102348 000FE268  4E 80 00 20 */	blr

.global sndAuxCallbackChorus
sndAuxCallbackChorus:
/* 8010234C 000FE26C  7C 08 02 A6 */	mflr r0
/* 80102350 000FE270  90 01 00 04 */	stw r0, 4(r1)
/* 80102354 000FE274  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80102358 000FE278  BF 21 00 24 */	stmw r25, 0x24(r1)
/* 8010235C 000FE27C  7C 9D 23 78 */	mr r29, r4
/* 80102360 000FE280  7C BE 2B 78 */	mr r30, r5
/* 80102364 000FE284  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 80102368 000FE288  2C 00 00 01 */	cmpwi r0, 1
/* 8010236C 000FE28C  41 82 03 38 */	beq lbl_801026A4
/* 80102370 000FE290  40 80 03 34 */	bge lbl_801026A4
/* 80102374 000FE294  2C 00 00 00 */	cmpwi r0, 0
/* 80102378 000FE298  40 80 00 08 */	bge lbl_80102380
/* 8010237C 000FE29C  48 00 03 28 */	b lbl_801026A4
lbl_80102380:
/* 80102380 000FE2A0  88 9E 00 24 */	lbz r4, 0x24(r30)
/* 80102384 000FE2A4  3C 60 55 55 */	lis r3, 0x55555556@ha
/* 80102388 000FE2A8  38 03 55 56 */	addi r0, r3, 0x55555556@l
/* 8010238C 000FE2AC  80 DD 00 00 */	lwz r6, 0(r29)
/* 80102390 000FE2B0  38 84 00 01 */	addi r4, r4, 1
/* 80102394 000FE2B4  7C 60 20 96 */	mulhw r3, r0, r4
/* 80102398 000FE2B8  80 FD 00 04 */	lwz r7, 4(r29)
/* 8010239C 000FE2BC  81 1D 00 08 */	lwz r8, 8(r29)
/* 801023A0 000FE2C0  54 60 0F FE */	srwi r0, r3, 0x1f
/* 801023A4 000FE2C4  7C 03 02 14 */	add r0, r3, r0
/* 801023A8 000FE2C8  1C 00 00 03 */	mulli r0, r0, 3
/* 801023AC 000FE2CC  7C 00 20 50 */	subf r0, r0, r4
/* 801023B0 000FE2D0  54 1F 06 3E */	clrlwi r31, r0, 0x18
/* 801023B4 000FE2D4  57 E0 10 3A */	slwi r0, r31, 2
/* 801023B8 000FE2D8  7C BE 02 14 */	add r5, r30, r0
/* 801023BC 000FE2DC  7C 7E 00 2E */	lwzx r3, r30, r0
/* 801023C0 000FE2E0  80 85 00 0C */	lwz r4, 0xc(r5)
/* 801023C4 000FE2E4  80 A5 00 18 */	lwz r5, 0x18(r5)
/* 801023C8 000FE2E8  48 00 00 04 */	b lbl_801023CC
lbl_801023CC:
/* 801023CC 000FE2EC  38 00 00 14 */	li r0, 0x14
/* 801023D0 000FE2F0  7C 09 03 A6 */	mtctr r0
/* 801023D4 000FE2F4  48 00 00 04 */	b lbl_801023D8
lbl_801023D8:
/* 801023D8 000FE2F8  48 00 00 04 */	b lbl_801023DC
lbl_801023DC:
/* 801023DC 000FE2FC  80 06 00 00 */	lwz r0, 0(r6)
/* 801023E0 000FE300  38 C6 00 04 */	addi r6, r6, 4
/* 801023E4 000FE304  90 03 00 00 */	stw r0, 0(r3)
/* 801023E8 000FE308  38 63 00 04 */	addi r3, r3, 4
/* 801023EC 000FE30C  80 07 00 00 */	lwz r0, 0(r7)
/* 801023F0 000FE310  38 E7 00 04 */	addi r7, r7, 4
/* 801023F4 000FE314  90 04 00 00 */	stw r0, 0(r4)
/* 801023F8 000FE318  38 84 00 04 */	addi r4, r4, 4
/* 801023FC 000FE31C  80 08 00 00 */	lwz r0, 0(r8)
/* 80102400 000FE320  39 08 00 04 */	addi r8, r8, 4
/* 80102404 000FE324  90 05 00 00 */	stw r0, 0(r5)
/* 80102408 000FE328  38 A5 00 04 */	addi r5, r5, 4
/* 8010240C 000FE32C  80 06 00 00 */	lwz r0, 0(r6)
/* 80102410 000FE330  38 C6 00 04 */	addi r6, r6, 4
/* 80102414 000FE334  90 03 00 00 */	stw r0, 0(r3)
/* 80102418 000FE338  38 63 00 04 */	addi r3, r3, 4
/* 8010241C 000FE33C  80 07 00 00 */	lwz r0, 0(r7)
/* 80102420 000FE340  38 E7 00 04 */	addi r7, r7, 4
/* 80102424 000FE344  90 04 00 00 */	stw r0, 0(r4)
/* 80102428 000FE348  38 84 00 04 */	addi r4, r4, 4
/* 8010242C 000FE34C  80 08 00 00 */	lwz r0, 0(r8)
/* 80102430 000FE350  39 08 00 04 */	addi r8, r8, 4
/* 80102434 000FE354  90 05 00 00 */	stw r0, 0(r5)
/* 80102438 000FE358  38 A5 00 04 */	addi r5, r5, 4
/* 8010243C 000FE35C  80 06 00 00 */	lwz r0, 0(r6)
/* 80102440 000FE360  38 C6 00 04 */	addi r6, r6, 4
/* 80102444 000FE364  90 03 00 00 */	stw r0, 0(r3)
/* 80102448 000FE368  38 63 00 04 */	addi r3, r3, 4
/* 8010244C 000FE36C  80 07 00 00 */	lwz r0, 0(r7)
/* 80102450 000FE370  38 E7 00 04 */	addi r7, r7, 4
/* 80102454 000FE374  90 04 00 00 */	stw r0, 0(r4)
/* 80102458 000FE378  38 84 00 04 */	addi r4, r4, 4
/* 8010245C 000FE37C  80 08 00 00 */	lwz r0, 0(r8)
/* 80102460 000FE380  39 08 00 04 */	addi r8, r8, 4
/* 80102464 000FE384  90 05 00 00 */	stw r0, 0(r5)
/* 80102468 000FE388  38 A5 00 04 */	addi r5, r5, 4
/* 8010246C 000FE38C  80 06 00 00 */	lwz r0, 0(r6)
/* 80102470 000FE390  38 C6 00 04 */	addi r6, r6, 4
/* 80102474 000FE394  90 03 00 00 */	stw r0, 0(r3)
/* 80102478 000FE398  38 63 00 04 */	addi r3, r3, 4
/* 8010247C 000FE39C  80 07 00 00 */	lwz r0, 0(r7)
/* 80102480 000FE3A0  38 E7 00 04 */	addi r7, r7, 4
/* 80102484 000FE3A4  90 04 00 00 */	stw r0, 0(r4)
/* 80102488 000FE3A8  38 84 00 04 */	addi r4, r4, 4
/* 8010248C 000FE3AC  80 08 00 00 */	lwz r0, 0(r8)
/* 80102490 000FE3B0  39 08 00 04 */	addi r8, r8, 4
/* 80102494 000FE3B4  90 05 00 00 */	stw r0, 0(r5)
/* 80102498 000FE3B8  38 A5 00 04 */	addi r5, r5, 4
/* 8010249C 000FE3BC  80 06 00 00 */	lwz r0, 0(r6)
/* 801024A0 000FE3C0  38 C6 00 04 */	addi r6, r6, 4
/* 801024A4 000FE3C4  90 03 00 00 */	stw r0, 0(r3)
/* 801024A8 000FE3C8  38 63 00 04 */	addi r3, r3, 4
/* 801024AC 000FE3CC  80 07 00 00 */	lwz r0, 0(r7)
/* 801024B0 000FE3D0  38 E7 00 04 */	addi r7, r7, 4
/* 801024B4 000FE3D4  90 04 00 00 */	stw r0, 0(r4)
/* 801024B8 000FE3D8  38 84 00 04 */	addi r4, r4, 4
/* 801024BC 000FE3DC  80 08 00 00 */	lwz r0, 0(r8)
/* 801024C0 000FE3E0  39 08 00 04 */	addi r8, r8, 4
/* 801024C4 000FE3E4  90 05 00 00 */	stw r0, 0(r5)
/* 801024C8 000FE3E8  38 A5 00 04 */	addi r5, r5, 4
/* 801024CC 000FE3EC  80 06 00 00 */	lwz r0, 0(r6)
/* 801024D0 000FE3F0  38 C6 00 04 */	addi r6, r6, 4
/* 801024D4 000FE3F4  90 03 00 00 */	stw r0, 0(r3)
/* 801024D8 000FE3F8  38 63 00 04 */	addi r3, r3, 4
/* 801024DC 000FE3FC  80 07 00 00 */	lwz r0, 0(r7)
/* 801024E0 000FE400  38 E7 00 04 */	addi r7, r7, 4
/* 801024E4 000FE404  90 04 00 00 */	stw r0, 0(r4)
/* 801024E8 000FE408  38 84 00 04 */	addi r4, r4, 4
/* 801024EC 000FE40C  80 08 00 00 */	lwz r0, 0(r8)
/* 801024F0 000FE410  39 08 00 04 */	addi r8, r8, 4
/* 801024F4 000FE414  90 05 00 00 */	stw r0, 0(r5)
/* 801024F8 000FE418  38 A5 00 04 */	addi r5, r5, 4
/* 801024FC 000FE41C  80 06 00 00 */	lwz r0, 0(r6)
/* 80102500 000FE420  38 C6 00 04 */	addi r6, r6, 4
/* 80102504 000FE424  90 03 00 00 */	stw r0, 0(r3)
/* 80102508 000FE428  38 63 00 04 */	addi r3, r3, 4
/* 8010250C 000FE42C  80 07 00 00 */	lwz r0, 0(r7)
/* 80102510 000FE430  38 E7 00 04 */	addi r7, r7, 4
/* 80102514 000FE434  90 04 00 00 */	stw r0, 0(r4)
/* 80102518 000FE438  38 84 00 04 */	addi r4, r4, 4
/* 8010251C 000FE43C  80 08 00 00 */	lwz r0, 0(r8)
/* 80102520 000FE440  39 08 00 04 */	addi r8, r8, 4
/* 80102524 000FE444  90 05 00 00 */	stw r0, 0(r5)
/* 80102528 000FE448  38 A5 00 04 */	addi r5, r5, 4
/* 8010252C 000FE44C  80 06 00 00 */	lwz r0, 0(r6)
/* 80102530 000FE450  38 C6 00 04 */	addi r6, r6, 4
/* 80102534 000FE454  90 03 00 00 */	stw r0, 0(r3)
/* 80102538 000FE458  38 63 00 04 */	addi r3, r3, 4
/* 8010253C 000FE45C  80 07 00 00 */	lwz r0, 0(r7)
/* 80102540 000FE460  38 E7 00 04 */	addi r7, r7, 4
/* 80102544 000FE464  90 04 00 00 */	stw r0, 0(r4)
/* 80102548 000FE468  38 84 00 04 */	addi r4, r4, 4
/* 8010254C 000FE46C  80 08 00 00 */	lwz r0, 0(r8)
/* 80102550 000FE470  39 08 00 04 */	addi r8, r8, 4
/* 80102554 000FE474  90 05 00 00 */	stw r0, 0(r5)
/* 80102558 000FE478  38 A5 00 04 */	addi r5, r5, 4
/* 8010255C 000FE47C  42 00 FE 80 */	bdnz lbl_801023DC
/* 80102560 000FE480  80 1E 00 60 */	lwz r0, 0x60(r30)
/* 80102564 000FE484  7C 03 86 70 */	srawi r3, r0, 0x10
/* 80102568 000FE488  38 03 00 01 */	addi r0, r3, 1
/* 8010256C 000FE48C  90 1E 00 84 */	stw r0, 0x84(r30)
/* 80102570 000FE490  80 1E 00 60 */	lwz r0, 0x60(r30)
/* 80102574 000FE494  54 00 04 3E */	clrlwi r0, r0, 0x10
/* 80102578 000FE498  54 00 80 1E */	slwi r0, r0, 0x10
/* 8010257C 000FE49C  90 1E 00 80 */	stw r0, 0x80(r30)
/* 80102580 000FE4A0  80 7E 00 64 */	lwz r3, 0x64(r30)
/* 80102584 000FE4A4  38 03 FF FF */	addi r0, r3, -1
/* 80102588 000FE4A8  28 00 00 00 */	cmplwi r0, 0
/* 8010258C 000FE4AC  90 1E 00 64 */	stw r0, 0x64(r30)
/* 80102590 000FE4B0  40 82 00 18 */	bne lbl_801025A8
/* 80102594 000FE4B4  80 1E 00 68 */	lwz r0, 0x68(r30)
/* 80102598 000FE4B8  90 1E 00 64 */	stw r0, 0x64(r30)
/* 8010259C 000FE4BC  80 1E 00 60 */	lwz r0, 0x60(r30)
/* 801025A0 000FE4C0  7C 00 00 D0 */	neg r0, r0
/* 801025A4 000FE4C4  90 1E 00 60 */	stw r0, 0x60(r30)
lbl_801025A8:
/* 801025A8 000FE4C8  3B 20 00 00 */	li r25, 0
/* 801025AC 000FE4CC  48 00 00 04 */	b lbl_801025B0
lbl_801025B0:
/* 801025B0 000FE4D0  3B 5E 00 28 */	addi r26, r30, 0x28
/* 801025B4 000FE4D4  3B 7E 00 38 */	addi r27, r30, 0x38
/* 801025B8 000FE4D8  3B 9E 00 48 */	addi r28, r30, 0x48
/* 801025BC 000FE4DC  48 00 00 04 */	b lbl_801025C0
lbl_801025C0:
/* 801025C0 000FE4E0  48 00 00 04 */	b lbl_801025C4
lbl_801025C4:
/* 801025C4 000FE4E4  80 1E 00 5C */	lwz r0, 0x5c(r30)
/* 801025C8 000FE4E8  2C 19 00 01 */	cmpwi r25, 1
/* 801025CC 000FE4EC  90 1E 00 7C */	stw r0, 0x7c(r30)
/* 801025D0 000FE4F0  80 1E 00 58 */	lwz r0, 0x58(r30)
/* 801025D4 000FE4F4  90 1E 00 78 */	stw r0, 0x78(r30)
/* 801025D8 000FE4F8  41 82 00 38 */	beq lbl_80102610
/* 801025DC 000FE4FC  40 80 00 10 */	bge lbl_801025EC
/* 801025E0 000FE500  2C 19 00 00 */	cmpwi r25, 0
/* 801025E4 000FE504  40 80 00 14 */	bge lbl_801025F8
/* 801025E8 000FE508  48 00 00 54 */	b lbl_8010263C
lbl_801025EC:
/* 801025EC 000FE50C  2C 19 00 03 */	cmpwi r25, 3
/* 801025F0 000FE510  40 80 00 4C */	bge lbl_8010263C
/* 801025F4 000FE514  48 00 00 34 */	b lbl_80102628
lbl_801025F8:
/* 801025F8 000FE518  80 1E 00 00 */	lwz r0, 0(r30)
/* 801025FC 000FE51C  90 1E 00 70 */	stw r0, 0x70(r30)
/* 80102600 000FE520  80 1D 00 00 */	lwz r0, 0(r29)
/* 80102604 000FE524  90 1E 00 6C */	stw r0, 0x6c(r30)
/* 80102608 000FE528  93 5E 00 74 */	stw r26, 0x74(r30)
/* 8010260C 000FE52C  48 00 00 30 */	b lbl_8010263C
lbl_80102610:
/* 80102610 000FE530  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 80102614 000FE534  90 1E 00 70 */	stw r0, 0x70(r30)
/* 80102618 000FE538  80 1D 00 04 */	lwz r0, 4(r29)
/* 8010261C 000FE53C  90 1E 00 6C */	stw r0, 0x6c(r30)
/* 80102620 000FE540  93 7E 00 74 */	stw r27, 0x74(r30)
/* 80102624 000FE544  48 00 00 18 */	b lbl_8010263C
lbl_80102628:
/* 80102628 000FE548  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 8010262C 000FE54C  90 1E 00 70 */	stw r0, 0x70(r30)
/* 80102630 000FE550  80 1D 00 08 */	lwz r0, 8(r29)
/* 80102634 000FE554  90 1E 00 6C */	stw r0, 0x6c(r30)
/* 80102638 000FE558  93 9E 00 74 */	stw r28, 0x74(r30)
lbl_8010263C:
/* 8010263C 000FE55C  80 1E 00 84 */	lwz r0, 0x84(r30)
/* 80102640 000FE560  2C 00 00 01 */	cmpwi r0, 1
/* 80102644 000FE564  41 82 00 20 */	beq lbl_80102664
/* 80102648 000FE568  40 80 00 24 */	bge lbl_8010266C
/* 8010264C 000FE56C  2C 00 00 00 */	cmpwi r0, 0
/* 80102650 000FE570  40 80 00 08 */	bge lbl_80102658
/* 80102654 000FE574  48 00 00 18 */	b lbl_8010266C
lbl_80102658:
/* 80102658 000FE578  38 7E 00 6C */	addi r3, r30, 0x6c
/* 8010265C 000FE57C  4B FF F9 6D */	bl do_src1
/* 80102660 000FE580  48 00 00 0C */	b lbl_8010266C
lbl_80102664:
/* 80102664 000FE584  38 7E 00 6C */	addi r3, r30, 0x6c
/* 80102668 000FE588  4B FF FA F9 */	bl do_src2
lbl_8010266C:
/* 8010266C 000FE58C  3B 39 00 01 */	addi r25, r25, 1
/* 80102670 000FE590  28 19 00 03 */	cmplwi r25, 3
/* 80102674 000FE594  41 80 FF 50 */	blt lbl_801025C4
/* 80102678 000FE598  3C 60 88 89 */	lis r3, 0x88888889@ha
/* 8010267C 000FE59C  80 9E 00 7C */	lwz r4, 0x7c(r30)
/* 80102680 000FE5A0  38 03 88 89 */	addi r0, r3, 0x88888889@l
/* 80102684 000FE5A4  7C 00 20 16 */	mulhwu r0, r0, r4
/* 80102688 000FE5A8  54 00 C2 3E */	srwi r0, r0, 8
/* 8010268C 000FE5AC  1C 00 01 E0 */	mulli r0, r0, 0x1e0
/* 80102690 000FE5B0  7C 00 20 50 */	subf r0, r0, r4
/* 80102694 000FE5B4  90 1E 00 5C */	stw r0, 0x5c(r30)
/* 80102698 000FE5B8  80 1E 00 78 */	lwz r0, 0x78(r30)
/* 8010269C 000FE5BC  90 1E 00 58 */	stw r0, 0x58(r30)
/* 801026A0 000FE5C0  9B FE 00 24 */	stb r31, 0x24(r30)
lbl_801026A4:
/* 801026A4 000FE5C4  BB 21 00 24 */	lmw r25, 0x24(r1)
/* 801026A8 000FE5C8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 801026AC 000FE5CC  38 21 00 40 */	addi r1, r1, 0x40
/* 801026B0 000FE5D0  7C 08 03 A6 */	mtlr r0
/* 801026B4 000FE5D4  4E 80 00 20 */	blr

.global sndAuxCallbackPrepareChorus
sndAuxCallbackPrepareChorus:
/* 801026B8 000FE5D8  7C 08 02 A6 */	mflr r0
/* 801026BC 000FE5DC  90 01 00 04 */	stw r0, 4(r1)
/* 801026C0 000FE5E0  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 801026C4 000FE5E4  93 E1 00 24 */	stw r31, 0x24(r1)
/* 801026C8 000FE5E8  7C 7F 1B 78 */	mr r31, r3
/* 801026CC 000FE5EC  38 60 16 80 */	li r3, 0x1680
/* 801026D0 000FE5F0  4B FF EB A9 */	bl salMalloc
/* 801026D4 000FE5F4  90 7F 00 00 */	stw r3, 0(r31)
/* 801026D8 000FE5F8  80 7F 00 00 */	lwz r3, 0(r31)
/* 801026DC 000FE5FC  28 03 00 00 */	cmplwi r3, 0
/* 801026E0 000FE600  41 82 02 20 */	beq lbl_80102900
/* 801026E4 000FE604  38 03 07 80 */	addi r0, r3, 0x780
/* 801026E8 000FE608  90 1F 00 0C */	stw r0, 0xc(r31)
/* 801026EC 000FE60C  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 801026F0 000FE610  38 03 07 80 */	addi r0, r3, 0x780
/* 801026F4 000FE614  90 1F 00 18 */	stw r0, 0x18(r31)
/* 801026F8 000FE618  80 7F 00 00 */	lwz r3, 0(r31)
/* 801026FC 000FE61C  38 03 02 80 */	addi r0, r3, 0x280
/* 80102700 000FE620  90 1F 00 04 */	stw r0, 4(r31)
/* 80102704 000FE624  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80102708 000FE628  38 03 02 80 */	addi r0, r3, 0x280
/* 8010270C 000FE62C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80102710 000FE630  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 80102714 000FE634  38 03 02 80 */	addi r0, r3, 0x280
/* 80102718 000FE638  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8010271C 000FE63C  80 7F 00 00 */	lwz r3, 0(r31)
/* 80102720 000FE640  38 03 05 00 */	addi r0, r3, 0x500
/* 80102724 000FE644  90 1F 00 08 */	stw r0, 8(r31)
/* 80102728 000FE648  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 8010272C 000FE64C  38 03 05 00 */	addi r0, r3, 0x500
/* 80102730 000FE650  90 1F 00 14 */	stw r0, 0x14(r31)
/* 80102734 000FE654  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 80102738 000FE658  38 03 05 00 */	addi r0, r3, 0x500
/* 8010273C 000FE65C  90 1F 00 20 */	stw r0, 0x20(r31)
/* 80102740 000FE660  80 7F 00 00 */	lwz r3, 0(r31)
/* 80102744 000FE664  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 80102748 000FE668  80 BF 00 18 */	lwz r5, 0x18(r31)
/* 8010274C 000FE66C  48 00 00 04 */	b lbl_80102750
lbl_80102750:
/* 80102750 000FE670  38 00 00 28 */	li r0, 0x28
/* 80102754 000FE674  7C 09 03 A6 */	mtctr r0
/* 80102758 000FE678  48 00 00 04 */	b lbl_8010275C
lbl_8010275C:
/* 8010275C 000FE67C  48 00 00 04 */	b lbl_80102760
lbl_80102760:
/* 80102760 000FE680  38 C0 00 00 */	li r6, 0
/* 80102764 000FE684  90 C3 00 00 */	stw r6, 0(r3)
/* 80102768 000FE688  38 63 00 04 */	addi r3, r3, 4
/* 8010276C 000FE68C  90 C4 00 00 */	stw r6, 0(r4)
/* 80102770 000FE690  38 84 00 04 */	addi r4, r4, 4
/* 80102774 000FE694  90 C5 00 00 */	stw r6, 0(r5)
/* 80102778 000FE698  38 A5 00 04 */	addi r5, r5, 4
/* 8010277C 000FE69C  90 C3 00 00 */	stw r6, 0(r3)
/* 80102780 000FE6A0  38 63 00 04 */	addi r3, r3, 4
/* 80102784 000FE6A4  90 C4 00 00 */	stw r6, 0(r4)
/* 80102788 000FE6A8  38 84 00 04 */	addi r4, r4, 4
/* 8010278C 000FE6AC  90 C5 00 00 */	stw r6, 0(r5)
/* 80102790 000FE6B0  38 A5 00 04 */	addi r5, r5, 4
/* 80102794 000FE6B4  90 C3 00 00 */	stw r6, 0(r3)
/* 80102798 000FE6B8  38 63 00 04 */	addi r3, r3, 4
/* 8010279C 000FE6BC  90 C4 00 00 */	stw r6, 0(r4)
/* 801027A0 000FE6C0  38 84 00 04 */	addi r4, r4, 4
/* 801027A4 000FE6C4  90 C5 00 00 */	stw r6, 0(r5)
/* 801027A8 000FE6C8  38 A5 00 04 */	addi r5, r5, 4
/* 801027AC 000FE6CC  90 C3 00 00 */	stw r6, 0(r3)
/* 801027B0 000FE6D0  38 63 00 04 */	addi r3, r3, 4
/* 801027B4 000FE6D4  90 C4 00 00 */	stw r6, 0(r4)
/* 801027B8 000FE6D8  38 84 00 04 */	addi r4, r4, 4
/* 801027BC 000FE6DC  90 C5 00 00 */	stw r6, 0(r5)
/* 801027C0 000FE6E0  38 A5 00 04 */	addi r5, r5, 4
/* 801027C4 000FE6E4  90 C3 00 00 */	stw r6, 0(r3)
/* 801027C8 000FE6E8  38 63 00 04 */	addi r3, r3, 4
/* 801027CC 000FE6EC  90 C4 00 00 */	stw r6, 0(r4)
/* 801027D0 000FE6F0  38 84 00 04 */	addi r4, r4, 4
/* 801027D4 000FE6F4  90 C5 00 00 */	stw r6, 0(r5)
/* 801027D8 000FE6F8  38 A5 00 04 */	addi r5, r5, 4
/* 801027DC 000FE6FC  90 C3 00 00 */	stw r6, 0(r3)
/* 801027E0 000FE700  38 63 00 04 */	addi r3, r3, 4
/* 801027E4 000FE704  90 C4 00 00 */	stw r6, 0(r4)
/* 801027E8 000FE708  38 84 00 04 */	addi r4, r4, 4
/* 801027EC 000FE70C  90 C5 00 00 */	stw r6, 0(r5)
/* 801027F0 000FE710  38 A5 00 04 */	addi r5, r5, 4
/* 801027F4 000FE714  90 C3 00 00 */	stw r6, 0(r3)
/* 801027F8 000FE718  38 63 00 04 */	addi r3, r3, 4
/* 801027FC 000FE71C  90 C4 00 00 */	stw r6, 0(r4)
/* 80102800 000FE720  38 84 00 04 */	addi r4, r4, 4
/* 80102804 000FE724  90 C5 00 00 */	stw r6, 0(r5)
/* 80102808 000FE728  38 A5 00 04 */	addi r5, r5, 4
/* 8010280C 000FE72C  90 C3 00 00 */	stw r6, 0(r3)
/* 80102810 000FE730  38 63 00 04 */	addi r3, r3, 4
/* 80102814 000FE734  90 C4 00 00 */	stw r6, 0(r4)
/* 80102818 000FE738  38 84 00 04 */	addi r4, r4, 4
/* 8010281C 000FE73C  90 C5 00 00 */	stw r6, 0(r5)
/* 80102820 000FE740  38 A5 00 04 */	addi r5, r5, 4
/* 80102824 000FE744  42 00 FF 3C */	bdnz lbl_80102760
/* 80102828 000FE748  38 00 00 01 */	li r0, 1
/* 8010282C 000FE74C  98 1F 00 24 */	stb r0, 0x24(r31)
/* 80102830 000FE750  3C 80 88 89 */	lis r4, 0x88888889@ha
/* 80102834 000FE754  3C 60 CC CD */	lis r3, 0xCCCCCCCD@ha
/* 80102838 000FE758  90 DF 00 34 */	stw r6, 0x34(r31)
/* 8010283C 000FE75C  38 A0 01 E0 */	li r5, 0x1e0
/* 80102840 000FE760  38 04 88 89 */	addi r0, r4, 0x88888889@l
/* 80102844 000FE764  90 DF 00 30 */	stw r6, 0x30(r31)
/* 80102848 000FE768  38 83 CC CD */	addi r4, r3, 0xCCCCCCCD@l
/* 8010284C 000FE76C  38 60 00 01 */	li r3, 1
/* 80102850 000FE770  90 DF 00 2C */	stw r6, 0x2c(r31)
/* 80102854 000FE774  90 DF 00 28 */	stw r6, 0x28(r31)
/* 80102858 000FE778  90 DF 00 44 */	stw r6, 0x44(r31)
/* 8010285C 000FE77C  90 DF 00 40 */	stw r6, 0x40(r31)
/* 80102860 000FE780  90 DF 00 3C */	stw r6, 0x3c(r31)
/* 80102864 000FE784  90 DF 00 38 */	stw r6, 0x38(r31)
/* 80102868 000FE788  90 DF 00 54 */	stw r6, 0x54(r31)
/* 8010286C 000FE78C  90 DF 00 50 */	stw r6, 0x50(r31)
/* 80102870 000FE790  90 DF 00 4C */	stw r6, 0x4c(r31)
/* 80102874 000FE794  90 DF 00 48 */	stw r6, 0x48(r31)
/* 80102878 000FE798  90 BF 00 88 */	stw r5, 0x88(r31)
/* 8010287C 000FE79C  90 DF 00 8C */	stw r6, 0x8c(r31)
/* 80102880 000FE7A0  80 BF 00 90 */	lwz r5, 0x90(r31)
/* 80102884 000FE7A4  38 A5 FF FB */	addi r5, r5, -5
/* 80102888 000FE7A8  54 A5 28 34 */	slwi r5, r5, 5
/* 8010288C 000FE7AC  20 A5 01 40 */	subfic r5, r5, 0x140
/* 80102890 000FE7B0  90 BF 00 5C */	stw r5, 0x5c(r31)
/* 80102894 000FE7B4  90 DF 00 58 */	stw r6, 0x58(r31)
/* 80102898 000FE7B8  88 BF 00 24 */	lbz r5, 0x24(r31)
/* 8010289C 000FE7BC  80 DF 00 5C */	lwz r6, 0x5c(r31)
/* 801028A0 000FE7C0  38 A5 FF FF */	addi r5, r5, -1
/* 801028A4 000FE7C4  1C A5 00 A0 */	mulli r5, r5, 0xa0
/* 801028A8 000FE7C8  7C A6 2A 14 */	add r5, r6, r5
/* 801028AC 000FE7CC  7C 00 28 16 */	mulhwu r0, r0, r5
/* 801028B0 000FE7D0  54 00 C2 3E */	srwi r0, r0, 8
/* 801028B4 000FE7D4  1C 00 01 E0 */	mulli r0, r0, 0x1e0
/* 801028B8 000FE7D8  7C 00 28 50 */	subf r0, r0, r5
/* 801028BC 000FE7DC  90 1F 00 5C */	stw r0, 0x5c(r31)
/* 801028C0 000FE7E0  80 1F 00 98 */	lwz r0, 0x98(r31)
/* 801028C4 000FE7E4  7C 04 00 16 */	mulhwu r0, r4, r0
/* 801028C8 000FE7E8  54 04 F0 BE */	srwi r4, r0, 2
/* 801028CC 000FE7EC  38 04 00 01 */	addi r0, r4, 1
/* 801028D0 000FE7F0  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 801028D4 000FE7F4  90 1F 00 68 */	stw r0, 0x68(r31)
/* 801028D8 000FE7F8  80 1F 00 68 */	lwz r0, 0x68(r31)
/* 801028DC 000FE7FC  54 00 F8 7E */	srwi r0, r0, 1
/* 801028E0 000FE800  90 1F 00 64 */	stw r0, 0x64(r31)
/* 801028E4 000FE804  80 1F 00 68 */	lwz r0, 0x68(r31)
/* 801028E8 000FE808  80 9F 00 94 */	lwz r4, 0x94(r31)
/* 801028EC 000FE80C  1C 00 00 05 */	mulli r0, r0, 5
/* 801028F0 000FE810  54 84 80 1E */	slwi r4, r4, 0x10
/* 801028F4 000FE814  7C 04 03 96 */	divwu r0, r4, r0
/* 801028F8 000FE818  90 1F 00 60 */	stw r0, 0x60(r31)
/* 801028FC 000FE81C  48 00 00 08 */	b lbl_80102904
lbl_80102900:
/* 80102900 000FE820  38 60 00 00 */	li r3, 0
lbl_80102904:
/* 80102904 000FE824  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80102908 000FE828  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 8010290C 000FE82C  38 21 00 28 */	addi r1, r1, 0x28
/* 80102910 000FE830  7C 08 03 A6 */	mtlr r0
/* 80102914 000FE834  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F6A78
lbl_802F6A78:
	# ROM: 0x1F0498
	.byte 0x43, 0x30, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00
