.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global OSInitAlarm
OSInitAlarm:
/* 800C1EC4 000BDDE4  7C 08 02 A6 */	mflr r0
/* 800C1EC8 000BDDE8  38 60 00 08 */	li r3, 8
/* 800C1ECC 000BDDEC  90 01 00 04 */	stw r0, 4(r1)
/* 800C1ED0 000BDDF0  94 21 FF F8 */	stwu r1, -8(r1)
/* 800C1ED4 000BDDF4  4B FF FE A1 */	bl __OSGetExceptionHandler
/* 800C1ED8 000BDDF8  3C 80 80 0C */	lis r4, DecrementerExceptionHandler@ha
/* 800C1EDC 000BDDFC  38 84 25 D4 */	addi r4, r4, DecrementerExceptionHandler@l
/* 800C1EE0 000BDE00  7C 03 20 40 */	cmplw r3, r4
/* 800C1EE4 000BDE04  41 82 00 1C */	beq lbl_800C1F00
/* 800C1EE8 000BDE08  38 00 00 00 */	li r0, 0
/* 800C1EEC 000BDE0C  38 6D A1 00 */	addi r3, r13, AlarmQueue@sda21
/* 800C1EF0 000BDE10  90 03 00 04 */	stw r0, 4(r3)
/* 800C1EF4 000BDE14  38 60 00 08 */	li r3, 8
/* 800C1EF8 000BDE18  90 0D A1 00 */	stw r0, AlarmQueue@sda21(r13)
/* 800C1EFC 000BDE1C  4B FF FE 5D */	bl __OSDBJUMPEND
lbl_800C1F00:
/* 800C1F00 000BDE20  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800C1F04 000BDE24  38 21 00 08 */	addi r1, r1, 8
/* 800C1F08 000BDE28  7C 08 03 A6 */	mtlr r0
/* 800C1F0C 000BDE2C  4E 80 00 20 */	blr

.global OSCreateAlarm
OSCreateAlarm:
/* 800C1F10 000BDE30  38 00 00 00 */	li r0, 0
/* 800C1F14 000BDE34  90 03 00 00 */	stw r0, 0(r3)
/* 800C1F18 000BDE38  4E 80 00 20 */	blr

.global InsertAlarm
InsertAlarm:
/* 800C1F1C 000BDE3C  7C 08 02 A6 */	mflr r0
/* 800C1F20 000BDE40  90 01 00 04 */	stw r0, 4(r1)
/* 800C1F24 000BDE44  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800C1F28 000BDE48  BF 21 00 24 */	stmw r25, 0x24(r1)
/* 800C1F2C 000BDE4C  3B 80 00 00 */	li r28, 0
/* 800C1F30 000BDE50  7C 7D 1B 78 */	mr r29, r3
/* 800C1F34 000BDE54  6F 84 80 00 */	xoris r4, r28, 0x8000
/* 800C1F38 000BDE58  3B 25 00 00 */	addi r25, r5, 0
/* 800C1F3C 000BDE5C  3B C6 00 00 */	addi r30, r6, 0
/* 800C1F40 000BDE60  3B E7 00 00 */	addi r31, r7, 0
/* 800C1F44 000BDE64  80 03 00 18 */	lwz r0, 0x18(r3)
/* 800C1F48 000BDE68  81 03 00 1C */	lwz r8, 0x1c(r3)
/* 800C1F4C 000BDE6C  6C 03 80 00 */	xoris r3, r0, 0x8000
/* 800C1F50 000BDE70  7C 08 E0 10 */	subfc r0, r8, r28
/* 800C1F54 000BDE74  7C 63 21 10 */	subfe r3, r3, r4
/* 800C1F58 000BDE78  7C 64 21 10 */	subfe r3, r4, r4
/* 800C1F5C 000BDE7C  7C 63 00 D1 */	neg. r3, r3
/* 800C1F60 000BDE80  41 82 00 7C */	beq lbl_800C1FDC
/* 800C1F64 000BDE84  48 00 7A 19 */	bl OSGetTime
/* 800C1F68 000BDE88  80 FD 00 20 */	lwz r7, 0x20(r29)
/* 800C1F6C 000BDE8C  6C 65 80 00 */	xoris r5, r3, 0x8000
/* 800C1F70 000BDE90  81 1D 00 24 */	lwz r8, 0x24(r29)
/* 800C1F74 000BDE94  6C E6 80 00 */	xoris r6, r7, 0x8000
/* 800C1F78 000BDE98  7C 04 40 10 */	subfc r0, r4, r8
/* 800C1F7C 000BDE9C  7C A5 31 10 */	subfe r5, r5, r6
/* 800C1F80 000BDEA0  7C A6 31 10 */	subfe r5, r6, r6
/* 800C1F84 000BDEA4  7C A5 00 D1 */	neg. r5, r5
/* 800C1F88 000BDEA8  3B C8 00 00 */	addi r30, r8, 0
/* 800C1F8C 000BDEAC  3B 27 00 00 */	addi r25, r7, 0
/* 800C1F90 000BDEB0  41 82 00 4C */	beq lbl_800C1FDC
/* 800C1F94 000BDEB4  83 7D 00 18 */	lwz r27, 0x18(r29)
/* 800C1F98 000BDEB8  7C 88 20 10 */	subfc r4, r8, r4
/* 800C1F9C 000BDEBC  83 5D 00 1C */	lwz r26, 0x1c(r29)
/* 800C1FA0 000BDEC0  7C 67 19 10 */	subfe r3, r7, r3
/* 800C1FA4 000BDEC4  38 BB 00 00 */	addi r5, r27, 0
/* 800C1FA8 000BDEC8  38 DA 00 00 */	addi r6, r26, 0
/* 800C1FAC 000BDECC  48 04 17 09 */	bl __div2i
/* 800C1FB0 000BDED0  38 00 00 01 */	li r0, 1
/* 800C1FB4 000BDED4  7C A4 00 14 */	addc r5, r4, r0
/* 800C1FB8 000BDED8  7C 9B 29 D6 */	mullw r4, r27, r5
/* 800C1FBC 000BDEDC  7C 1A 28 16 */	mulhwu r0, r26, r5
/* 800C1FC0 000BDEE0  7C 63 E1 14 */	adde r3, r3, r28
/* 800C1FC4 000BDEE4  7C 84 02 14 */	add r4, r4, r0
/* 800C1FC8 000BDEE8  7C 1A 19 D6 */	mullw r0, r26, r3
/* 800C1FCC 000BDEEC  7C 7A 29 D6 */	mullw r3, r26, r5
/* 800C1FD0 000BDEF0  7C 04 02 14 */	add r0, r4, r0
/* 800C1FD4 000BDEF4  7F DE 18 14 */	addc r30, r30, r3
/* 800C1FD8 000BDEF8  7F 39 01 14 */	adde r25, r25, r0
lbl_800C1FDC:
/* 800C1FDC 000BDEFC  93 FD 00 00 */	stw r31, 0(r29)
/* 800C1FE0 000BDF00  6F 24 80 00 */	xoris r4, r25, 0x8000
/* 800C1FE4 000BDF04  93 DD 00 0C */	stw r30, 0xc(r29)
/* 800C1FE8 000BDF08  93 3D 00 08 */	stw r25, 8(r29)
/* 800C1FEC 000BDF0C  80 CD A1 00 */	lwz r6, AlarmQueue@sda21(r13)
/* 800C1FF0 000BDF10  48 00 00 C4 */	b lbl_800C20B4
lbl_800C1FF4:
/* 800C1FF4 000BDF14  80 06 00 08 */	lwz r0, 8(r6)
/* 800C1FF8 000BDF18  80 A6 00 0C */	lwz r5, 0xc(r6)
/* 800C1FFC 000BDF1C  6C 03 80 00 */	xoris r3, r0, 0x8000
/* 800C2000 000BDF20  7C 05 F0 10 */	subfc r0, r5, r30
/* 800C2004 000BDF24  7C 63 21 10 */	subfe r3, r3, r4
/* 800C2008 000BDF28  7C 64 21 10 */	subfe r3, r4, r4
/* 800C200C 000BDF2C  7C 63 00 D1 */	neg. r3, r3
/* 800C2010 000BDF30  41 82 00 A0 */	beq lbl_800C20B0
/* 800C2014 000BDF34  80 06 00 10 */	lwz r0, 0x10(r6)
/* 800C2018 000BDF38  90 1D 00 10 */	stw r0, 0x10(r29)
/* 800C201C 000BDF3C  93 A6 00 10 */	stw r29, 0x10(r6)
/* 800C2020 000BDF40  90 DD 00 14 */	stw r6, 0x14(r29)
/* 800C2024 000BDF44  80 7D 00 10 */	lwz r3, 0x10(r29)
/* 800C2028 000BDF48  28 03 00 00 */	cmplwi r3, 0
/* 800C202C 000BDF4C  41 82 00 0C */	beq lbl_800C2038
/* 800C2030 000BDF50  93 A3 00 14 */	stw r29, 0x14(r3)
/* 800C2034 000BDF54  48 00 01 24 */	b lbl_800C2158
lbl_800C2038:
/* 800C2038 000BDF58  93 AD A1 00 */	stw r29, AlarmQueue@sda21(r13)
/* 800C203C 000BDF5C  48 00 79 41 */	bl OSGetTime
/* 800C2040 000BDF60  80 DD 00 0C */	lwz r6, 0xc(r29)
/* 800C2044 000BDF64  38 E0 00 00 */	li r7, 0
/* 800C2048 000BDF68  80 1D 00 08 */	lwz r0, 8(r29)
/* 800C204C 000BDF6C  6C E5 80 00 */	xoris r5, r7, 0x8000
/* 800C2050 000BDF70  7D 04 30 10 */	subfc r8, r4, r6
/* 800C2054 000BDF74  7C 03 01 10 */	subfe r0, r3, r0
/* 800C2058 000BDF78  6C 06 80 00 */	xoris r6, r0, 0x8000
/* 800C205C 000BDF7C  7C 07 40 10 */	subfc r0, r7, r8
/* 800C2060 000BDF80  7C A5 31 10 */	subfe r5, r5, r6
/* 800C2064 000BDF84  7C A6 31 10 */	subfe r5, r6, r6
/* 800C2068 000BDF88  7C A5 00 D1 */	neg. r5, r5
/* 800C206C 000BDF8C  41 82 00 10 */	beq lbl_800C207C
/* 800C2070 000BDF90  38 60 00 00 */	li r3, 0
/* 800C2074 000BDF94  4B FF F6 B5 */	bl PPCMtdec
/* 800C2078 000BDF98  48 00 00 E0 */	b lbl_800C2158
lbl_800C207C:
/* 800C207C 000BDF9C  3C 80 80 00 */	lis r4, 0x8000
/* 800C2080 000BDFA0  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 800C2084 000BDFA4  7C 04 40 10 */	subfc r0, r4, r8
/* 800C2088 000BDFA8  7C 63 31 10 */	subfe r3, r3, r6
/* 800C208C 000BDFAC  7C 66 31 10 */	subfe r3, r6, r6
/* 800C2090 000BDFB0  7C 63 00 D1 */	neg. r3, r3
/* 800C2094 000BDFB4  41 82 00 10 */	beq lbl_800C20A4
/* 800C2098 000BDFB8  7D 03 43 78 */	mr r3, r8
/* 800C209C 000BDFBC  4B FF F6 8D */	bl PPCMtdec
/* 800C20A0 000BDFC0  48 00 00 B8 */	b lbl_800C2158
lbl_800C20A4:
/* 800C20A4 000BDFC4  38 64 FF FF */	addi r3, r4, -1
/* 800C20A8 000BDFC8  4B FF F6 81 */	bl PPCMtdec
/* 800C20AC 000BDFCC  48 00 00 AC */	b lbl_800C2158
lbl_800C20B0:
/* 800C20B0 000BDFD0  80 C6 00 14 */	lwz r6, 0x14(r6)
lbl_800C20B4:
/* 800C20B4 000BDFD4  28 06 00 00 */	cmplwi r6, 0
/* 800C20B8 000BDFD8  40 82 FF 3C */	bne lbl_800C1FF4
/* 800C20BC 000BDFDC  3B C0 00 00 */	li r30, 0
/* 800C20C0 000BDFE0  93 DD 00 14 */	stw r30, 0x14(r29)
/* 800C20C4 000BDFE4  38 6D A1 00 */	addi r3, r13, AlarmQueue@sda21
/* 800C20C8 000BDFE8  80 83 00 04 */	lwz r4, 4(r3)
/* 800C20CC 000BDFEC  97 A3 00 04 */	stwu r29, 4(r3)
/* 800C20D0 000BDFF0  28 04 00 00 */	cmplwi r4, 0
/* 800C20D4 000BDFF4  90 9D 00 10 */	stw r4, 0x10(r29)
/* 800C20D8 000BDFF8  41 82 00 0C */	beq lbl_800C20E4
/* 800C20DC 000BDFFC  93 A4 00 14 */	stw r29, 0x14(r4)
/* 800C20E0 000BE000  48 00 00 78 */	b lbl_800C2158
lbl_800C20E4:
/* 800C20E4 000BE004  93 A3 00 00 */	stw r29, 0(r3)
/* 800C20E8 000BE008  93 AD A1 00 */	stw r29, AlarmQueue@sda21(r13)
/* 800C20EC 000BE00C  48 00 78 91 */	bl OSGetTime
/* 800C20F0 000BE010  80 DD 00 0C */	lwz r6, 0xc(r29)
/* 800C20F4 000BE014  6F C5 80 00 */	xoris r5, r30, 0x8000
/* 800C20F8 000BE018  80 1D 00 08 */	lwz r0, 8(r29)
/* 800C20FC 000BE01C  7C E4 30 10 */	subfc r7, r4, r6
/* 800C2100 000BE020  7C 03 01 10 */	subfe r0, r3, r0
/* 800C2104 000BE024  6C 06 80 00 */	xoris r6, r0, 0x8000
/* 800C2108 000BE028  7C 1E 38 10 */	subfc r0, r30, r7
/* 800C210C 000BE02C  7C A5 31 10 */	subfe r5, r5, r6
/* 800C2110 000BE030  7C A6 31 10 */	subfe r5, r6, r6
/* 800C2114 000BE034  7C A5 00 D1 */	neg. r5, r5
/* 800C2118 000BE038  41 82 00 10 */	beq lbl_800C2128
/* 800C211C 000BE03C  38 60 00 00 */	li r3, 0
/* 800C2120 000BE040  4B FF F6 09 */	bl PPCMtdec
/* 800C2124 000BE044  48 00 00 34 */	b lbl_800C2158
lbl_800C2128:
/* 800C2128 000BE048  3C 80 80 00 */	lis r4, 0x8000
/* 800C212C 000BE04C  6F C3 80 00 */	xoris r3, r30, 0x8000
/* 800C2130 000BE050  7C 04 38 10 */	subfc r0, r4, r7
/* 800C2134 000BE054  7C 63 31 10 */	subfe r3, r3, r6
/* 800C2138 000BE058  7C 66 31 10 */	subfe r3, r6, r6
/* 800C213C 000BE05C  7C 63 00 D1 */	neg. r3, r3
/* 800C2140 000BE060  41 82 00 10 */	beq lbl_800C2150
/* 800C2144 000BE064  7C E3 3B 78 */	mr r3, r7
/* 800C2148 000BE068  4B FF F5 E1 */	bl PPCMtdec
/* 800C214C 000BE06C  48 00 00 0C */	b lbl_800C2158
lbl_800C2150:
/* 800C2150 000BE070  38 64 FF FF */	addi r3, r4, -1
/* 800C2154 000BE074  4B FF F5 D5 */	bl PPCMtdec
lbl_800C2158:
/* 800C2158 000BE078  BB 21 00 24 */	lmw r25, 0x24(r1)
/* 800C215C 000BE07C  80 01 00 44 */	lwz r0, 0x44(r1)
/* 800C2160 000BE080  38 21 00 40 */	addi r1, r1, 0x40
/* 800C2164 000BE084  7C 08 03 A6 */	mtlr r0
/* 800C2168 000BE088  4E 80 00 20 */	blr

.global OSSetAlarm
OSSetAlarm:
/* 800C216C 000BE08C  7C 08 02 A6 */	mflr r0
/* 800C2170 000BE090  90 01 00 04 */	stw r0, 4(r1)
/* 800C2174 000BE094  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800C2178 000BE098  BF 61 00 24 */	stmw r27, 0x24(r1)
/* 800C217C 000BE09C  3B 63 00 00 */	addi r27, r3, 0
/* 800C2180 000BE0A0  3B A5 00 00 */	addi r29, r5, 0
/* 800C2184 000BE0A4  3B 86 00 00 */	addi r28, r6, 0
/* 800C2188 000BE0A8  3B C7 00 00 */	addi r30, r7, 0
/* 800C218C 000BE0AC  48 00 3F 31 */	bl OSDisableInterrupts
/* 800C2190 000BE0B0  38 00 00 00 */	li r0, 0
/* 800C2194 000BE0B4  90 1B 00 1C */	stw r0, 0x1c(r27)
/* 800C2198 000BE0B8  7C 7F 1B 78 */	mr r31, r3
/* 800C219C 000BE0BC  90 1B 00 18 */	stw r0, 0x18(r27)
/* 800C21A0 000BE0C0  48 00 77 DD */	bl OSGetTime
/* 800C21A4 000BE0C4  7C DC 20 14 */	addc r6, r28, r4
/* 800C21A8 000BE0C8  7C BD 19 14 */	adde r5, r29, r3
/* 800C21AC 000BE0CC  38 7B 00 00 */	addi r3, r27, 0
/* 800C21B0 000BE0D0  38 FE 00 00 */	addi r7, r30, 0
/* 800C21B4 000BE0D4  4B FF FD 69 */	bl InsertAlarm
/* 800C21B8 000BE0D8  7F E3 FB 78 */	mr r3, r31
/* 800C21BC 000BE0DC  48 00 3F 29 */	bl OSRestoreInterrupts
/* 800C21C0 000BE0E0  BB 61 00 24 */	lmw r27, 0x24(r1)
/* 800C21C4 000BE0E4  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800C21C8 000BE0E8  38 21 00 38 */	addi r1, r1, 0x38
/* 800C21CC 000BE0EC  7C 08 03 A6 */	mtlr r0
/* 800C21D0 000BE0F0  4E 80 00 20 */	blr

.global OSSetAbsAlarm
OSSetAbsAlarm:
/* 800C21D4 000BE0F4  7C 08 02 A6 */	mflr r0
/* 800C21D8 000BE0F8  90 01 00 04 */	stw r0, 4(r1)
/* 800C21DC 000BE0FC  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800C21E0 000BE100  BF 61 00 24 */	stmw r27, 0x24(r1)
/* 800C21E4 000BE104  3B 63 00 00 */	addi r27, r3, 0
/* 800C21E8 000BE108  3B A5 00 00 */	addi r29, r5, 0
/* 800C21EC 000BE10C  3B 86 00 00 */	addi r28, r6, 0
/* 800C21F0 000BE110  3B C7 00 00 */	addi r30, r7, 0
/* 800C21F4 000BE114  48 00 3E C9 */	bl OSDisableInterrupts
/* 800C21F8 000BE118  38 00 00 00 */	li r0, 0
/* 800C21FC 000BE11C  90 1B 00 1C */	stw r0, 0x1c(r27)
/* 800C2200 000BE120  7C 7F 1B 78 */	mr r31, r3
/* 800C2204 000BE124  38 7B 00 00 */	addi r3, r27, 0
/* 800C2208 000BE128  90 1B 00 18 */	stw r0, 0x18(r27)
/* 800C220C 000BE12C  38 DC 00 00 */	addi r6, r28, 0
/* 800C2210 000BE130  38 BD 00 00 */	addi r5, r29, 0
/* 800C2214 000BE134  38 FE 00 00 */	addi r7, r30, 0
/* 800C2218 000BE138  4B FF FD 05 */	bl InsertAlarm
/* 800C221C 000BE13C  7F E3 FB 78 */	mr r3, r31
/* 800C2220 000BE140  48 00 3E C5 */	bl OSRestoreInterrupts
/* 800C2224 000BE144  BB 61 00 24 */	lmw r27, 0x24(r1)
/* 800C2228 000BE148  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800C222C 000BE14C  38 21 00 38 */	addi r1, r1, 0x38
/* 800C2230 000BE150  7C 08 03 A6 */	mtlr r0
/* 800C2234 000BE154  4E 80 00 20 */	blr

.global OSSetPeriodicAlarm
OSSetPeriodicAlarm:
/* 800C2238 000BE158  7C 08 02 A6 */	mflr r0
/* 800C223C 000BE15C  90 01 00 04 */	stw r0, 4(r1)
/* 800C2240 000BE160  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800C2244 000BE164  BF 41 00 28 */	stmw r26, 0x28(r1)
/* 800C2248 000BE168  3B 43 00 00 */	addi r26, r3, 0
/* 800C224C 000BE16C  3B 85 00 00 */	addi r28, r5, 0
/* 800C2250 000BE170  3B 66 00 00 */	addi r27, r6, 0
/* 800C2254 000BE174  3B A7 00 00 */	addi r29, r7, 0
/* 800C2258 000BE178  3B E8 00 00 */	addi r31, r8, 0
/* 800C225C 000BE17C  3B C9 00 00 */	addi r30, r9, 0
/* 800C2260 000BE180  48 00 3E 5D */	bl OSDisableInterrupts
/* 800C2264 000BE184  93 FA 00 1C */	stw r31, 0x1c(r26)
/* 800C2268 000BE188  7C 7F 1B 78 */	mr r31, r3
/* 800C226C 000BE18C  38 7A 00 00 */	addi r3, r26, 0
/* 800C2270 000BE190  93 BA 00 18 */	stw r29, 0x18(r26)
/* 800C2274 000BE194  38 FE 00 00 */	addi r7, r30, 0
/* 800C2278 000BE198  38 C0 00 00 */	li r6, 0
/* 800C227C 000BE19C  93 7A 00 24 */	stw r27, 0x24(r26)
/* 800C2280 000BE1A0  38 A0 00 00 */	li r5, 0
/* 800C2284 000BE1A4  93 9A 00 20 */	stw r28, 0x20(r26)
/* 800C2288 000BE1A8  4B FF FC 95 */	bl InsertAlarm
/* 800C228C 000BE1AC  7F E3 FB 78 */	mr r3, r31
/* 800C2290 000BE1B0  48 00 3E 55 */	bl OSRestoreInterrupts
/* 800C2294 000BE1B4  BB 41 00 28 */	lmw r26, 0x28(r1)
/* 800C2298 000BE1B8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 800C229C 000BE1BC  38 21 00 40 */	addi r1, r1, 0x40
/* 800C22A0 000BE1C0  7C 08 03 A6 */	mtlr r0
/* 800C22A4 000BE1C4  4E 80 00 20 */	blr

.global OSCancelAlarm
OSCancelAlarm:
/* 800C22A8 000BE1C8  7C 08 02 A6 */	mflr r0
/* 800C22AC 000BE1CC  90 01 00 04 */	stw r0, 4(r1)
/* 800C22B0 000BE1D0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800C22B4 000BE1D4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800C22B8 000BE1D8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800C22BC 000BE1DC  7C 7E 1B 78 */	mr r30, r3
/* 800C22C0 000BE1E0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800C22C4 000BE1E4  48 00 3D F9 */	bl OSDisableInterrupts
/* 800C22C8 000BE1E8  80 1E 00 00 */	lwz r0, 0(r30)
/* 800C22CC 000BE1EC  3B E3 00 00 */	addi r31, r3, 0
/* 800C22D0 000BE1F0  28 00 00 00 */	cmplwi r0, 0
/* 800C22D4 000BE1F4  40 82 00 10 */	bne lbl_800C22E4
/* 800C22D8 000BE1F8  7F E3 FB 78 */	mr r3, r31
/* 800C22DC 000BE1FC  48 00 3E 09 */	bl OSRestoreInterrupts
/* 800C22E0 000BE200  48 00 00 C8 */	b lbl_800C23A8
lbl_800C22E4:
/* 800C22E4 000BE204  83 BE 00 14 */	lwz r29, 0x14(r30)
/* 800C22E8 000BE208  28 1D 00 00 */	cmplwi r29, 0
/* 800C22EC 000BE20C  40 82 00 14 */	bne lbl_800C2300
/* 800C22F0 000BE210  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 800C22F4 000BE214  38 6D A1 00 */	addi r3, r13, AlarmQueue@sda21
/* 800C22F8 000BE218  90 03 00 04 */	stw r0, 4(r3)
/* 800C22FC 000BE21C  48 00 00 0C */	b lbl_800C2308
lbl_800C2300:
/* 800C2300 000BE220  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 800C2304 000BE224  90 1D 00 10 */	stw r0, 0x10(r29)
lbl_800C2308:
/* 800C2308 000BE228  80 7E 00 10 */	lwz r3, 0x10(r30)
/* 800C230C 000BE22C  28 03 00 00 */	cmplwi r3, 0
/* 800C2310 000BE230  41 82 00 0C */	beq lbl_800C231C
/* 800C2314 000BE234  93 A3 00 14 */	stw r29, 0x14(r3)
/* 800C2318 000BE238  48 00 00 80 */	b lbl_800C2398
lbl_800C231C:
/* 800C231C 000BE23C  28 1D 00 00 */	cmplwi r29, 0
/* 800C2320 000BE240  93 AD A1 00 */	stw r29, AlarmQueue@sda21(r13)
/* 800C2324 000BE244  41 82 00 74 */	beq lbl_800C2398
/* 800C2328 000BE248  48 00 76 55 */	bl OSGetTime
/* 800C232C 000BE24C  80 DD 00 0C */	lwz r6, 0xc(r29)
/* 800C2330 000BE250  38 E0 00 00 */	li r7, 0
/* 800C2334 000BE254  80 1D 00 08 */	lwz r0, 8(r29)
/* 800C2338 000BE258  6C E5 80 00 */	xoris r5, r7, 0x8000
/* 800C233C 000BE25C  7D 04 30 10 */	subfc r8, r4, r6
/* 800C2340 000BE260  7C 03 01 10 */	subfe r0, r3, r0
/* 800C2344 000BE264  6C 06 80 00 */	xoris r6, r0, 0x8000
/* 800C2348 000BE268  7C 07 40 10 */	subfc r0, r7, r8
/* 800C234C 000BE26C  7C A5 31 10 */	subfe r5, r5, r6
/* 800C2350 000BE270  7C A6 31 10 */	subfe r5, r6, r6
/* 800C2354 000BE274  7C A5 00 D1 */	neg. r5, r5
/* 800C2358 000BE278  41 82 00 10 */	beq lbl_800C2368
/* 800C235C 000BE27C  38 60 00 00 */	li r3, 0
/* 800C2360 000BE280  4B FF F3 C9 */	bl PPCMtdec
/* 800C2364 000BE284  48 00 00 34 */	b lbl_800C2398
lbl_800C2368:
/* 800C2368 000BE288  3C 80 80 00 */	lis r4, 0x8000
/* 800C236C 000BE28C  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 800C2370 000BE290  7C 04 40 10 */	subfc r0, r4, r8
/* 800C2374 000BE294  7C 63 31 10 */	subfe r3, r3, r6
/* 800C2378 000BE298  7C 66 31 10 */	subfe r3, r6, r6
/* 800C237C 000BE29C  7C 63 00 D1 */	neg. r3, r3
/* 800C2380 000BE2A0  41 82 00 10 */	beq lbl_800C2390
/* 800C2384 000BE2A4  7D 03 43 78 */	mr r3, r8
/* 800C2388 000BE2A8  4B FF F3 A1 */	bl PPCMtdec
/* 800C238C 000BE2AC  48 00 00 0C */	b lbl_800C2398
lbl_800C2390:
/* 800C2390 000BE2B0  38 64 FF FF */	addi r3, r4, -1
/* 800C2394 000BE2B4  4B FF F3 95 */	bl PPCMtdec
lbl_800C2398:
/* 800C2398 000BE2B8  38 00 00 00 */	li r0, 0
/* 800C239C 000BE2BC  90 1E 00 00 */	stw r0, 0(r30)
/* 800C23A0 000BE2C0  7F E3 FB 78 */	mr r3, r31
/* 800C23A4 000BE2C4  48 00 3D 41 */	bl OSRestoreInterrupts
lbl_800C23A8:
/* 800C23A8 000BE2C8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800C23AC 000BE2CC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800C23B0 000BE2D0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800C23B4 000BE2D4  7C 08 03 A6 */	mtlr r0
/* 800C23B8 000BE2D8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800C23BC 000BE2DC  38 21 00 20 */	addi r1, r1, 0x20
/* 800C23C0 000BE2E0  4E 80 00 20 */	blr

.global DecrementerExceptionCallback
DecrementerExceptionCallback:
/* 800C23C4 000BE2E4  7C 08 02 A6 */	mflr r0
/* 800C23C8 000BE2E8  90 01 00 04 */	stw r0, 4(r1)
/* 800C23CC 000BE2EC  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800C23D0 000BE2F0  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800C23D4 000BE2F4  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800C23D8 000BE2F8  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800C23DC 000BE2FC  7C 9D 23 78 */	mr r29, r4
/* 800C23E0 000BE300  93 81 00 18 */	stw r28, 0x18(r1)
/* 800C23E4 000BE304  48 00 75 99 */	bl OSGetTime
/* 800C23E8 000BE308  80 0D A1 00 */	lwz r0, AlarmQueue@sda21(r13)
/* 800C23EC 000BE30C  3B 84 00 00 */	addi r28, r4, 0
/* 800C23F0 000BE310  3B C3 00 00 */	addi r30, r3, 0
/* 800C23F4 000BE314  28 00 00 00 */	cmplwi r0, 0
/* 800C23F8 000BE318  7C 1F 03 78 */	mr r31, r0
/* 800C23FC 000BE31C  40 82 00 0C */	bne lbl_800C2408
/* 800C2400 000BE320  7F A3 EB 78 */	mr r3, r29
/* 800C2404 000BE324  48 00 13 A5 */	bl OSLoadContext
lbl_800C2408:
/* 800C2408 000BE328  80 1F 00 08 */	lwz r0, 8(r31)
/* 800C240C 000BE32C  6F C4 80 00 */	xoris r4, r30, 0x8000
/* 800C2410 000BE330  80 BF 00 0C */	lwz r5, 0xc(r31)
/* 800C2414 000BE334  6C 03 80 00 */	xoris r3, r0, 0x8000
/* 800C2418 000BE338  7C 05 E0 10 */	subfc r0, r5, r28
/* 800C241C 000BE33C  7C 63 21 10 */	subfe r3, r3, r4
/* 800C2420 000BE340  7C 64 21 10 */	subfe r3, r4, r4
/* 800C2424 000BE344  7C 63 00 D1 */	neg. r3, r3
/* 800C2428 000BE348  41 82 00 7C */	beq lbl_800C24A4
/* 800C242C 000BE34C  48 00 75 51 */	bl OSGetTime
/* 800C2430 000BE350  80 DF 00 0C */	lwz r6, 0xc(r31)
/* 800C2434 000BE354  38 E0 00 00 */	li r7, 0
/* 800C2438 000BE358  80 1F 00 08 */	lwz r0, 8(r31)
/* 800C243C 000BE35C  6C E5 80 00 */	xoris r5, r7, 0x8000
/* 800C2440 000BE360  7D 04 30 10 */	subfc r8, r4, r6
/* 800C2444 000BE364  7C 03 01 10 */	subfe r0, r3, r0
/* 800C2448 000BE368  6C 06 80 00 */	xoris r6, r0, 0x8000
/* 800C244C 000BE36C  7C 07 40 10 */	subfc r0, r7, r8
/* 800C2450 000BE370  7C A5 31 10 */	subfe r5, r5, r6
/* 800C2454 000BE374  7C A6 31 10 */	subfe r5, r6, r6
/* 800C2458 000BE378  7C A5 00 D1 */	neg. r5, r5
/* 800C245C 000BE37C  41 82 00 10 */	beq lbl_800C246C
/* 800C2460 000BE380  38 60 00 00 */	li r3, 0
/* 800C2464 000BE384  4B FF F2 C5 */	bl PPCMtdec
/* 800C2468 000BE388  48 00 00 34 */	b lbl_800C249C
lbl_800C246C:
/* 800C246C 000BE38C  3C 80 80 00 */	lis r4, 0x8000
/* 800C2470 000BE390  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 800C2474 000BE394  7C 04 40 10 */	subfc r0, r4, r8
/* 800C2478 000BE398  7C 63 31 10 */	subfe r3, r3, r6
/* 800C247C 000BE39C  7C 66 31 10 */	subfe r3, r6, r6
/* 800C2480 000BE3A0  7C 63 00 D1 */	neg. r3, r3
/* 800C2484 000BE3A4  41 82 00 10 */	beq lbl_800C2494
/* 800C2488 000BE3A8  7D 03 43 78 */	mr r3, r8
/* 800C248C 000BE3AC  4B FF F2 9D */	bl PPCMtdec
/* 800C2490 000BE3B0  48 00 00 0C */	b lbl_800C249C
lbl_800C2494:
/* 800C2494 000BE3B4  38 64 FF FF */	addi r3, r4, -1
/* 800C2498 000BE3B8  4B FF F2 91 */	bl PPCMtdec
lbl_800C249C:
/* 800C249C 000BE3BC  7F A3 EB 78 */	mr r3, r29
/* 800C24A0 000BE3C0  48 00 13 09 */	bl OSLoadContext
lbl_800C24A4:
/* 800C24A4 000BE3C4  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 800C24A8 000BE3C8  28 03 00 00 */	cmplwi r3, 0
/* 800C24AC 000BE3CC  90 6D A1 00 */	stw r3, AlarmQueue@sda21(r13)
/* 800C24B0 000BE3D0  40 82 00 14 */	bne lbl_800C24C4
/* 800C24B4 000BE3D4  38 00 00 00 */	li r0, 0
/* 800C24B8 000BE3D8  38 6D A1 00 */	addi r3, r13, AlarmQueue@sda21
/* 800C24BC 000BE3DC  90 03 00 04 */	stw r0, 4(r3)
/* 800C24C0 000BE3E0  48 00 00 0C */	b lbl_800C24CC
lbl_800C24C4:
/* 800C24C4 000BE3E4  38 00 00 00 */	li r0, 0
/* 800C24C8 000BE3E8  90 03 00 10 */	stw r0, 0x10(r3)
lbl_800C24CC:
/* 800C24CC 000BE3EC  83 DF 00 00 */	lwz r30, 0(r31)
/* 800C24D0 000BE3F0  38 C0 00 00 */	li r6, 0
/* 800C24D4 000BE3F4  6C C4 80 00 */	xoris r4, r6, 0x8000
/* 800C24D8 000BE3F8  90 DF 00 00 */	stw r6, 0(r31)
/* 800C24DC 000BE3FC  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 800C24E0 000BE400  80 BF 00 1C */	lwz r5, 0x1c(r31)
/* 800C24E4 000BE404  6C 03 80 00 */	xoris r3, r0, 0x8000
/* 800C24E8 000BE408  7C 05 30 10 */	subfc r0, r5, r6
/* 800C24EC 000BE40C  7C 63 21 10 */	subfe r3, r3, r4
/* 800C24F0 000BE410  7C 64 21 10 */	subfe r3, r4, r4
/* 800C24F4 000BE414  7C 63 00 D1 */	neg. r3, r3
/* 800C24F8 000BE418  41 82 00 18 */	beq lbl_800C2510
/* 800C24FC 000BE41C  38 7F 00 00 */	addi r3, r31, 0
/* 800C2500 000BE420  38 FE 00 00 */	addi r7, r30, 0
/* 800C2504 000BE424  38 C0 00 00 */	li r6, 0
/* 800C2508 000BE428  38 A0 00 00 */	li r5, 0
/* 800C250C 000BE42C  4B FF FA 11 */	bl InsertAlarm
lbl_800C2510:
/* 800C2510 000BE430  83 8D A1 00 */	lwz r28, AlarmQueue@sda21(r13)
/* 800C2514 000BE434  28 1C 00 00 */	cmplwi r28, 0
/* 800C2518 000BE438  41 82 00 74 */	beq lbl_800C258C
/* 800C251C 000BE43C  48 00 74 61 */	bl OSGetTime
/* 800C2520 000BE440  80 DC 00 0C */	lwz r6, 0xc(r28)
/* 800C2524 000BE444  38 E0 00 00 */	li r7, 0
/* 800C2528 000BE448  80 1C 00 08 */	lwz r0, 8(r28)
/* 800C252C 000BE44C  6C E5 80 00 */	xoris r5, r7, 0x8000
/* 800C2530 000BE450  7D 04 30 10 */	subfc r8, r4, r6
/* 800C2534 000BE454  7C 03 01 10 */	subfe r0, r3, r0
/* 800C2538 000BE458  6C 06 80 00 */	xoris r6, r0, 0x8000
/* 800C253C 000BE45C  7C 07 40 10 */	subfc r0, r7, r8
/* 800C2540 000BE460  7C A5 31 10 */	subfe r5, r5, r6
/* 800C2544 000BE464  7C A6 31 10 */	subfe r5, r6, r6
/* 800C2548 000BE468  7C A5 00 D1 */	neg. r5, r5
/* 800C254C 000BE46C  41 82 00 10 */	beq lbl_800C255C
/* 800C2550 000BE470  38 60 00 00 */	li r3, 0
/* 800C2554 000BE474  4B FF F1 D5 */	bl PPCMtdec
/* 800C2558 000BE478  48 00 00 34 */	b lbl_800C258C
lbl_800C255C:
/* 800C255C 000BE47C  3C 80 80 00 */	lis r4, 0x8000
/* 800C2560 000BE480  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 800C2564 000BE484  7C 04 40 10 */	subfc r0, r4, r8
/* 800C2568 000BE488  7C 63 31 10 */	subfe r3, r3, r6
/* 800C256C 000BE48C  7C 66 31 10 */	subfe r3, r6, r6
/* 800C2570 000BE490  7C 63 00 D1 */	neg. r3, r3
/* 800C2574 000BE494  41 82 00 10 */	beq lbl_800C2584
/* 800C2578 000BE498  7D 03 43 78 */	mr r3, r8
/* 800C257C 000BE49C  4B FF F1 AD */	bl PPCMtdec
/* 800C2580 000BE4A0  48 00 00 0C */	b lbl_800C258C
lbl_800C2584:
/* 800C2584 000BE4A4  38 64 FF FF */	addi r3, r4, -1
/* 800C2588 000BE4A8  4B FF F1 A1 */	bl PPCMtdec
lbl_800C258C:
/* 800C258C 000BE4AC  48 00 67 39 */	bl OSDisableScheduler
/* 800C2590 000BE4B0  39 9E 00 00 */	addi r12, r30, 0
/* 800C2594 000BE4B4  7D 88 03 A6 */	mtlr r12
/* 800C2598 000BE4B8  38 7F 00 00 */	addi r3, r31, 0
/* 800C259C 000BE4BC  38 9D 00 00 */	addi r4, r29, 0
/* 800C25A0 000BE4C0  4E 80 00 21 */	blrl
/* 800C25A4 000BE4C4  48 00 67 61 */	bl OSEnableScheduler
/* 800C25A8 000BE4C8  48 00 6C 01 */	bl __OSReschedule
/* 800C25AC 000BE4CC  7F A3 EB 78 */	mr r3, r29
/* 800C25B0 000BE4D0  48 00 11 F9 */	bl OSLoadContext
/* 800C25B4 000BE4D4  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800C25B8 000BE4D8  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800C25BC 000BE4DC  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800C25C0 000BE4E0  7C 08 03 A6 */	mtlr r0
/* 800C25C4 000BE4E4  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800C25C8 000BE4E8  83 81 00 18 */	lwz r28, 0x18(r1)
/* 800C25CC 000BE4EC  38 21 00 28 */	addi r1, r1, 0x28
/* 800C25D0 000BE4F0  4E 80 00 20 */	blr

.global DecrementerExceptionHandler
DecrementerExceptionHandler:
/* 800C25D4 000BE4F4  90 04 00 00 */	stw r0, 0(r4)
/* 800C25D8 000BE4F8  90 24 00 04 */	stw r1, 4(r4)
/* 800C25DC 000BE4FC  90 44 00 08 */	stw r2, 8(r4)
/* 800C25E0 000BE500  BC C4 00 18 */	stmw r6, 0x18(r4)
/* 800C25E4 000BE504  7C 11 E2 A6 */	mfspr r0, 0x391
/* 800C25E8 000BE508  90 04 01 A8 */	stw r0, 0x1a8(r4)
/* 800C25EC 000BE50C  7C 12 E2 A6 */	mfspr r0, 0x392
/* 800C25F0 000BE510  90 04 01 AC */	stw r0, 0x1ac(r4)
/* 800C25F4 000BE514  7C 13 E2 A6 */	mfspr r0, 0x393
/* 800C25F8 000BE518  90 04 01 B0 */	stw r0, 0x1b0(r4)
/* 800C25FC 000BE51C  7C 14 E2 A6 */	mfspr r0, 0x394
/* 800C2600 000BE520  90 04 01 B4 */	stw r0, 0x1b4(r4)
/* 800C2604 000BE524  7C 15 E2 A6 */	mfspr r0, 0x395
/* 800C2608 000BE528  90 04 01 B8 */	stw r0, 0x1b8(r4)
/* 800C260C 000BE52C  7C 16 E2 A6 */	mfspr r0, 0x396
/* 800C2610 000BE530  90 04 01 BC */	stw r0, 0x1bc(r4)
/* 800C2614 000BE534  7C 17 E2 A6 */	mfspr r0, 0x397
/* 800C2618 000BE538  90 04 01 C0 */	stw r0, 0x1c0(r4)
/* 800C261C 000BE53C  4B FF FD A8 */	b DecrementerExceptionCallback

.section .sbss

.global AlarmQueue
AlarmQueue:
	.skip 0x8
