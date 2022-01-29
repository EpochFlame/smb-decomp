.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __num2dec
__num2dec:
/* 80103D54 000FFC74  7C 08 02 A6 */	mflr r0
/* 80103D58 000FFC78  90 01 00 04 */	stw r0, 4(r1)
/* 80103D5C 000FFC7C  94 21 FF 98 */	stwu r1, -0x68(r1)
/* 80103D60 000FFC80  DB E1 00 60 */	stfd f31, 0x60(r1)
/* 80103D64 000FFC84  FF E0 08 90 */	fmr f31, f1
/* 80103D68 000FFC88  93 E1 00 5C */	stw r31, 0x5c(r1)
/* 80103D6C 000FFC8C  93 C1 00 58 */	stw r30, 0x58(r1)
/* 80103D70 000FFC90  3B C4 00 00 */	addi r30, r4, 0
/* 80103D74 000FFC94  93 A1 00 54 */	stw r29, 0x54(r1)
/* 80103D78 000FFC98  7C 7D 1B 78 */	mr r29, r3
/* 80103D7C 000FFC9C  A8 03 00 02 */	lha r0, 2(r3)
/* 80103D80 000FFCA0  2C 00 00 10 */	cmpwi r0, 0x10
/* 80103D84 000FFCA4  7C 1F 03 78 */	mr r31, r0
/* 80103D88 000FFCA8  40 81 00 08 */	ble lbl_80103D90
/* 80103D8C 000FFCAC  3B E0 00 10 */	li r31, 0x10
lbl_80103D90:
/* 80103D90 000FFCB0  38 60 00 00 */	li r3, 0
/* 80103D94 000FFCB4  98 7E 00 00 */	stb r3, 0(r30)
/* 80103D98 000FFCB8  38 00 00 01 */	li r0, 1
/* 80103D9C 000FFCBC  B0 7E 00 02 */	sth r3, 2(r30)
/* 80103DA0 000FFCC0  98 1E 00 04 */	stb r0, 4(r30)
/* 80103DA4 000FFCC4  C8 02 C2 80 */	lfd f0, lbl_802F6A80@sda21(r2)
/* 80103DA8 000FFCC8  FC 00 F8 00 */	fcmpu cr0, f0, f31
/* 80103DAC 000FFCCC  40 82 00 10 */	bne lbl_80103DBC
/* 80103DB0 000FFCD0  38 00 00 30 */	li r0, 0x30
/* 80103DB4 000FFCD4  98 1E 00 05 */	stb r0, 5(r30)
/* 80103DB8 000FFCD8  48 00 03 30 */	b lbl_801040E8
lbl_80103DBC:
/* 80103DBC 000FFCDC  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 80103DC0 000FFCE0  3C 00 7F F0 */	lis r0, 0x7ff0
/* 80103DC4 000FFCE4  80 81 00 28 */	lwz r4, 0x28(r1)
/* 80103DC8 000FFCE8  54 83 00 56 */	rlwinm r3, r4, 0, 1, 0xb
/* 80103DCC 000FFCEC  7C 03 00 00 */	cmpw r3, r0
/* 80103DD0 000FFCF0  41 82 00 14 */	beq lbl_80103DE4
/* 80103DD4 000FFCF4  40 80 00 58 */	bge lbl_80103E2C
/* 80103DD8 000FFCF8  2C 03 00 00 */	cmpwi r3, 0
/* 80103DDC 000FFCFC  41 82 00 2C */	beq lbl_80103E08
/* 80103DE0 000FFD00  48 00 00 4C */	b lbl_80103E2C
lbl_80103DE4:
/* 80103DE4 000FFD04  54 80 03 3F */	clrlwi. r0, r4, 0xc
/* 80103DE8 000FFD08  40 82 00 10 */	bne lbl_80103DF8
/* 80103DEC 000FFD0C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80103DF0 000FFD10  2C 00 00 00 */	cmpwi r0, 0
/* 80103DF4 000FFD14  41 82 00 0C */	beq lbl_80103E00
lbl_80103DF8:
/* 80103DF8 000FFD18  38 00 00 01 */	li r0, 1
/* 80103DFC 000FFD1C  48 00 00 34 */	b lbl_80103E30
lbl_80103E00:
/* 80103E00 000FFD20  38 00 00 02 */	li r0, 2
/* 80103E04 000FFD24  48 00 00 2C */	b lbl_80103E30
lbl_80103E08:
/* 80103E08 000FFD28  54 80 03 3F */	clrlwi. r0, r4, 0xc
/* 80103E0C 000FFD2C  40 82 00 10 */	bne lbl_80103E1C
/* 80103E10 000FFD30  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80103E14 000FFD34  2C 00 00 00 */	cmpwi r0, 0
/* 80103E18 000FFD38  41 82 00 0C */	beq lbl_80103E24
lbl_80103E1C:
/* 80103E1C 000FFD3C  38 00 00 05 */	li r0, 5
/* 80103E20 000FFD40  48 00 00 10 */	b lbl_80103E30
lbl_80103E24:
/* 80103E24 000FFD44  38 00 00 03 */	li r0, 3
/* 80103E28 000FFD48  48 00 00 08 */	b lbl_80103E30
lbl_80103E2C:
/* 80103E2C 000FFD4C  38 00 00 04 */	li r0, 4
lbl_80103E30:
/* 80103E30 000FFD50  2C 00 00 02 */	cmpwi r0, 2
/* 80103E34 000FFD54  41 81 00 94 */	bgt lbl_80103EC8
/* 80103E38 000FFD58  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 80103E3C 000FFD5C  3C 00 7F F0 */	lis r0, 0x7ff0
/* 80103E40 000FFD60  80 81 00 20 */	lwz r4, 0x20(r1)
/* 80103E44 000FFD64  54 83 00 56 */	rlwinm r3, r4, 0, 1, 0xb
/* 80103E48 000FFD68  7C 03 00 00 */	cmpw r3, r0
/* 80103E4C 000FFD6C  41 82 00 14 */	beq lbl_80103E60
/* 80103E50 000FFD70  40 80 00 58 */	bge lbl_80103EA8
/* 80103E54 000FFD74  2C 03 00 00 */	cmpwi r3, 0
/* 80103E58 000FFD78  41 82 00 2C */	beq lbl_80103E84
/* 80103E5C 000FFD7C  48 00 00 4C */	b lbl_80103EA8
lbl_80103E60:
/* 80103E60 000FFD80  54 80 03 3F */	clrlwi. r0, r4, 0xc
/* 80103E64 000FFD84  40 82 00 10 */	bne lbl_80103E74
/* 80103E68 000FFD88  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80103E6C 000FFD8C  2C 00 00 00 */	cmpwi r0, 0
/* 80103E70 000FFD90  41 82 00 0C */	beq lbl_80103E7C
lbl_80103E74:
/* 80103E74 000FFD94  38 00 00 01 */	li r0, 1
/* 80103E78 000FFD98  48 00 00 34 */	b lbl_80103EAC
lbl_80103E7C:
/* 80103E7C 000FFD9C  38 00 00 02 */	li r0, 2
/* 80103E80 000FFDA0  48 00 00 2C */	b lbl_80103EAC
lbl_80103E84:
/* 80103E84 000FFDA4  54 80 03 3F */	clrlwi. r0, r4, 0xc
/* 80103E88 000FFDA8  40 82 00 10 */	bne lbl_80103E98
/* 80103E8C 000FFDAC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80103E90 000FFDB0  2C 00 00 00 */	cmpwi r0, 0
/* 80103E94 000FFDB4  41 82 00 0C */	beq lbl_80103EA0
lbl_80103E98:
/* 80103E98 000FFDB8  38 00 00 05 */	li r0, 5
/* 80103E9C 000FFDBC  48 00 00 10 */	b lbl_80103EAC
lbl_80103EA0:
/* 80103EA0 000FFDC0  38 00 00 03 */	li r0, 3
/* 80103EA4 000FFDC4  48 00 00 08 */	b lbl_80103EAC
lbl_80103EA8:
/* 80103EA8 000FFDC8  38 00 00 04 */	li r0, 4
lbl_80103EAC:
/* 80103EAC 000FFDCC  2C 00 00 01 */	cmpwi r0, 1
/* 80103EB0 000FFDD0  40 82 00 0C */	bne lbl_80103EBC
/* 80103EB4 000FFDD4  38 00 00 4E */	li r0, 0x4e
/* 80103EB8 000FFDD8  48 00 00 08 */	b lbl_80103EC0
lbl_80103EBC:
/* 80103EBC 000FFDDC  38 00 00 49 */	li r0, 0x49
lbl_80103EC0:
/* 80103EC0 000FFDE0  98 1E 00 05 */	stb r0, 5(r30)
/* 80103EC4 000FFDE4  48 00 02 24 */	b lbl_801040E8
lbl_80103EC8:
/* 80103EC8 000FFDE8  38 00 00 00 */	li r0, 0
/* 80103ECC 000FFDEC  98 1E 00 04 */	stb r0, 4(r30)
/* 80103ED0 000FFDF0  C8 02 C2 80 */	lfd f0, lbl_802F6A80@sda21(r2)
/* 80103ED4 000FFDF4  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 80103ED8 000FFDF8  40 80 00 10 */	bge lbl_80103EE8
/* 80103EDC 000FFDFC  38 00 00 01 */	li r0, 1
/* 80103EE0 000FFE00  FF E0 F8 50 */	fneg f31, f31
/* 80103EE4 000FFE04  98 1E 00 00 */	stb r0, 0(r30)
lbl_80103EE8:
/* 80103EE8 000FFE08  FC 20 F8 90 */	fmr f1, f31
/* 80103EEC 000FFE0C  38 61 00 30 */	addi r3, r1, 0x30
/* 80103EF0 000FFE10  48 00 47 E5 */	bl frexp
/* 80103EF4 000FFE14  3C 60 00 05 */	lis r3, 0x000497E5@ha
/* 80103EF8 000FFE18  80 81 00 30 */	lwz r4, 0x30(r1)
/* 80103EFC 000FFE1C  38 03 97 E5 */	addi r0, r3, 0x000497E5@l
/* 80103F00 000FFE20  7C 04 01 D6 */	mullw r0, r4, r0
/* 80103F04 000FFE24  3C 60 43 1C */	lis r3, 0x431BDE83@ha
/* 80103F08 000FFE28  38 63 DE 83 */	addi r3, r3, 0x431BDE83@l
/* 80103F0C 000FFE2C  7C 03 00 96 */	mulhw r0, r3, r0
/* 80103F10 000FFE30  7C 00 96 70 */	srawi r0, r0, 0x12
/* 80103F14 000FFE34  54 03 0F FE */	srwi r3, r0, 0x1f
/* 80103F18 000FFE38  7C 80 1A 15 */	add. r4, r0, r3
/* 80103F1C 000FFE3C  3C 60 80 17 */	lis r3, lbl_80171DD8@ha
/* 80103F20 000FFE40  38 03 1D D8 */	addi r0, r3, lbl_80171DD8@l
/* 80103F24 000FFE44  38 64 00 00 */	addi r3, r4, 0
/* 80103F28 000FFE48  7C 05 03 78 */	mr r5, r0
/* 80103F2C 000FFE4C  40 80 00 30 */	bge lbl_80103F5C
/* 80103F30 000FFE50  7C 84 00 D0 */	neg r4, r4
/* 80103F34 000FFE54  48 00 00 1C */	b lbl_80103F50
lbl_80103F38:
/* 80103F38 000FFE58  54 80 07 FF */	clrlwi. r0, r4, 0x1f
/* 80103F3C 000FFE5C  41 82 00 0C */	beq lbl_80103F48
/* 80103F40 000FFE60  C8 05 00 00 */	lfd f0, 0(r5)
/* 80103F44 000FFE64  FF FF 00 32 */	fmul f31, f31, f0
lbl_80103F48:
/* 80103F48 000FFE68  7C 84 0E 70 */	srawi r4, r4, 1
/* 80103F4C 000FFE6C  38 A5 00 08 */	addi r5, r5, 8
lbl_80103F50:
/* 80103F50 000FFE70  2C 04 00 00 */	cmpwi r4, 0
/* 80103F54 000FFE74  40 82 FF E4 */	bne lbl_80103F38
/* 80103F58 000FFE78  48 00 00 34 */	b lbl_80103F8C
lbl_80103F5C:
/* 80103F5C 000FFE7C  40 81 00 30 */	ble lbl_80103F8C
/* 80103F60 000FFE80  C8 22 C2 88 */	lfd f1, lbl_802F6A88@sda21(r2)
/* 80103F64 000FFE84  48 00 00 1C */	b lbl_80103F80
lbl_80103F68:
/* 80103F68 000FFE88  54 80 07 FF */	clrlwi. r0, r4, 0x1f
/* 80103F6C 000FFE8C  41 82 00 0C */	beq lbl_80103F78
/* 80103F70 000FFE90  C8 05 00 00 */	lfd f0, 0(r5)
/* 80103F74 000FFE94  FC 21 00 32 */	fmul f1, f1, f0
lbl_80103F78:
/* 80103F78 000FFE98  7C 84 0E 70 */	srawi r4, r4, 1
/* 80103F7C 000FFE9C  38 A5 00 08 */	addi r5, r5, 8
lbl_80103F80:
/* 80103F80 000FFEA0  2C 04 00 00 */	cmpwi r4, 0
/* 80103F84 000FFEA4  40 82 FF E4 */	bne lbl_80103F68
/* 80103F88 000FFEA8  FF FF 08 24 */	fdiv f31, f31, f1
lbl_80103F8C:
/* 80103F8C 000FFEAC  C8 22 C2 98 */	lfd f1, lbl_802F6A98@sda21(r2)
/* 80103F90 000FFEB0  C8 02 C2 88 */	lfd f0, lbl_802F6A88@sda21(r2)
/* 80103F94 000FFEB4  48 00 00 0C */	b lbl_80103FA0
lbl_80103F98:
/* 80103F98 000FFEB8  FF FF 00 72 */	fmul f31, f31, f1
/* 80103F9C 000FFEBC  38 63 00 01 */	addi r3, r3, 1
lbl_80103FA0:
/* 80103FA0 000FFEC0  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 80103FA4 000FFEC4  4C 41 13 82 */	cror 2, 1, 2
/* 80103FA8 000FFEC8  41 82 FF F0 */	beq lbl_80103F98
/* 80103FAC 000FFECC  C8 22 C2 A0 */	lfd f1, lbl_802F6AA0@sda21(r2)
/* 80103FB0 000FFED0  C8 02 C2 98 */	lfd f0, lbl_802F6A98@sda21(r2)
/* 80103FB4 000FFED4  48 00 00 0C */	b lbl_80103FC0
lbl_80103FB8:
/* 80103FB8 000FFED8  FF FF 00 72 */	fmul f31, f31, f1
/* 80103FBC 000FFEDC  38 63 FF FF */	addi r3, r3, -1
lbl_80103FC0:
/* 80103FC0 000FFEE0  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 80103FC4 000FFEE4  41 80 FF F4 */	blt lbl_80103FB8
/* 80103FC8 000FFEE8  3C A0 66 66 */	lis r5, 0x66666667@ha
/* 80103FCC 000FFEEC  C8 22 C2 90 */	lfd f1, lbl_802F6A90@sda21(r2)
/* 80103FD0 000FFEF0  3C C0 80 17 */	lis r6, lbl_80171E20@ha
/* 80103FD4 000FFEF4  38 9E 00 05 */	addi r4, r30, 5
/* 80103FD8 000FFEF8  38 E5 66 67 */	addi r7, r5, 0x66666667@l
/* 80103FDC 000FFEFC  39 46 1E 20 */	addi r10, r6, lbl_80171E20@l
/* 80103FE0 000FFF00  3D 20 43 30 */	lis r9, 0x4330
/* 80103FE4 000FFF04  48 00 00 AC */	b lbl_80104090
lbl_80103FE8:
/* 80103FE8 000FFF08  2C 1F 00 08 */	cmpwi r31, 8
/* 80103FEC 000FFF0C  39 9F 00 00 */	addi r12, r31, 0
/* 80103FF0 000FFF10  40 81 00 08 */	ble lbl_80103FF8
/* 80103FF4 000FFF14  39 80 00 08 */	li r12, 8
lbl_80103FF8:
/* 80103FF8 000FFF18  88 DE 00 04 */	lbz r6, 4(r30)
/* 80103FFC 000FFF1C  55 80 18 38 */	slwi r0, r12, 3
/* 80104000 000FFF20  7C AA 02 14 */	add r5, r10, r0
/* 80104004 000FFF24  7C 06 62 14 */	add r0, r6, r12
/* 80104008 000FFF28  98 1E 00 04 */	stb r0, 4(r30)
/* 8010400C 000FFF2C  7F EC F8 50 */	subf r31, r12, r31
/* 80104010 000FFF30  7C 6C 18 50 */	subf r3, r12, r3
/* 80104014 000FFF34  C8 05 FF F8 */	lfd f0, -8(r5)
/* 80104018 000FFF38  7C 84 62 14 */	add r4, r4, r12
/* 8010401C 000FFF3C  39 6C 00 01 */	addi r11, r12, 1
/* 80104020 000FFF40  FF FF 00 32 */	fmul f31, f31, f0
/* 80104024 000FFF44  FC 00 F8 1E */	fctiwz f0, f31
/* 80104028 000FFF48  D8 01 00 40 */	stfd f0, 0x40(r1)
/* 8010402C 000FFF4C  80 01 00 44 */	lwz r0, 0x44(r1)
/* 80104030 000FFF50  D8 01 00 48 */	stfd f0, 0x48(r1)
/* 80104034 000FFF54  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80104038 000FFF58  90 01 00 3C */	stw r0, 0x3c(r1)
/* 8010403C 000FFF5C  80 C1 00 4C */	lwz r6, 0x4c(r1)
/* 80104040 000FFF60  91 21 00 38 */	stw r9, 0x38(r1)
/* 80104044 000FFF64  C8 01 00 38 */	lfd f0, 0x38(r1)
/* 80104048 000FFF68  FC 00 08 28 */	fsub f0, f0, f1
/* 8010404C 000FFF6C  FF FF 00 28 */	fsub f31, f31, f0
/* 80104050 000FFF70  48 00 00 34 */	b lbl_80104084
lbl_80104054:
/* 80104054 000FFF74  7D 07 30 96 */	mulhw r8, r7, r6
/* 80104058 000FFF78  7D 00 16 70 */	srawi r0, r8, 2
/* 8010405C 000FFF7C  54 05 0F FE */	srwi r5, r0, 0x1f
/* 80104060 000FFF80  7C 00 2A 14 */	add r0, r0, r5
/* 80104064 000FFF84  1C 00 00 0A */	mulli r0, r0, 0xa
/* 80104068 000FFF88  7C C0 30 50 */	subf r6, r0, r6
/* 8010406C 000FFF8C  7D 00 16 70 */	srawi r0, r8, 2
/* 80104070 000FFF90  38 C6 00 30 */	addi r6, r6, 0x30
/* 80104074 000FFF94  98 C4 FF FF */	stb r6, -1(r4)
/* 80104078 000FFF98  54 05 0F FE */	srwi r5, r0, 0x1f
/* 8010407C 000FFF9C  7C C0 2A 14 */	add r6, r0, r5
/* 80104080 000FFFA0  38 84 FF FF */	addi r4, r4, -1
lbl_80104084:
/* 80104084 000FFFA4  35 6B FF FF */	addic. r11, r11, -1
/* 80104088 000FFFA8  40 82 FF CC */	bne lbl_80104054
/* 8010408C 000FFFAC  7C 84 62 14 */	add r4, r4, r12
lbl_80104090:
/* 80104090 000FFFB0  2C 1F 00 00 */	cmpwi r31, 0
/* 80104094 000FFFB4  40 82 FF 54 */	bne lbl_80103FE8
/* 80104098 000FFFB8  A8 BD 00 02 */	lha r5, 2(r29)
/* 8010409C 000FFFBC  2C 05 00 24 */	cmpwi r5, 0x24
/* 801040A0 000FFFC0  40 81 00 08 */	ble lbl_801040A8
/* 801040A4 000FFFC4  38 A0 00 24 */	li r5, 0x24
lbl_801040A8:
/* 801040A8 000FFFC8  88 1E 00 04 */	lbz r0, 4(r30)
/* 801040AC 000FFFCC  7C A0 28 51 */	subf. r5, r0, r5
/* 801040B0 000FFFD0  40 81 00 30 */	ble lbl_801040E0
/* 801040B4 000FFFD4  38 C5 00 01 */	addi r6, r5, 1
/* 801040B8 000FFFD8  38 00 00 30 */	li r0, 0x30
/* 801040BC 000FFFDC  48 00 00 0C */	b lbl_801040C8
lbl_801040C0:
/* 801040C0 000FFFE0  98 04 00 00 */	stb r0, 0(r4)
/* 801040C4 000FFFE4  38 84 00 01 */	addi r4, r4, 1
lbl_801040C8:
/* 801040C8 000FFFE8  34 C6 FF FF */	addic. r6, r6, -1
/* 801040CC 000FFFEC  40 82 FF F4 */	bne lbl_801040C0
/* 801040D0 000FFFF0  88 1E 00 04 */	lbz r0, 4(r30)
/* 801040D4 000FFFF4  7C 65 18 50 */	subf r3, r5, r3
/* 801040D8 000FFFF8  7C 00 2A 14 */	add r0, r0, r5
/* 801040DC 000FFFFC  98 1E 00 04 */	stb r0, 4(r30)
lbl_801040E0:
/* 801040E0 00100000  7C 60 07 34 */	extsh r0, r3
/* 801040E4 00100004  B0 1E 00 02 */	sth r0, 2(r30)
lbl_801040E8:
/* 801040E8 00100008  80 01 00 6C */	lwz r0, 0x6c(r1)
/* 801040EC 0010000C  CB E1 00 60 */	lfd f31, 0x60(r1)
/* 801040F0 00100010  83 E1 00 5C */	lwz r31, 0x5c(r1)
/* 801040F4 00100014  7C 08 03 A6 */	mtlr r0
/* 801040F8 00100018  83 C1 00 58 */	lwz r30, 0x58(r1)
/* 801040FC 0010001C  83 A1 00 54 */	lwz r29, 0x54(r1)
/* 80104100 00100020  38 21 00 68 */	addi r1, r1, 0x68
/* 80104104 00100024  4E 80 00 20 */	blr

.section .rodata

.global lbl_80171DD8
lbl_80171DD8:
	# ROM: 0x16EDD8
	.4byte 0x40240000
	.4byte 0
	.4byte 0x40590000
	.4byte 0
	.4byte 0x40C38800
	.4byte 0
	.4byte 0x4197D784
	.4byte 0
	.4byte 0x4341C379
	.4byte 0x37E08000
	.4byte 0x4693B8B5
	.4byte 0xB5056E17
	.4byte 0x4D384F03
	.4byte 0xE93FF9F5
	.4byte 0x5A827748
	.4byte 0xF9301D32
	.4byte 0x75154FDD
	.4byte 0x7F73BF3C

.global lbl_80171E20
lbl_80171E20:
	# ROM: 0x16EE20
	.4byte 0x40240000
	.4byte 0
	.4byte 0x40590000
	.4byte 0
	.4byte 0x408F4000
	.4byte 0
	.4byte 0x40C38800
	.4byte 0
	.4byte 0x40F86A00
	.4byte 0
	.4byte 0x412E8480
	.4byte 0
	.4byte 0x416312D0
	.4byte 0
	.4byte 0x4197D784
	.4byte 0

.section .sdata2

.global lbl_802F6A80
lbl_802F6A80:
	# ROM: 0x1F04A0
	.4byte 0
	.4byte 0

.global lbl_802F6A88
lbl_802F6A88:
	# ROM: 0x1F04A8
	.4byte 0x3FF00000
	.4byte 0

.global lbl_802F6A90
lbl_802F6A90:
	# ROM: 0x1F04B0
	.4byte 0x43300000
	.4byte 0x80000000

.global lbl_802F6A98
lbl_802F6A98:
	# ROM: 0x1F04B8
	.4byte 0x3FB99999
	.4byte 0x9999999A

.global lbl_802F6AA0
lbl_802F6AA0:
	# ROM: 0x1F04C0
	.4byte 0x40240000
	.4byte 0
