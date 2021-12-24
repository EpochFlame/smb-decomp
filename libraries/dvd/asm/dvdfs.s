.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __DVDFSInit
__DVDFSInit:
/* 800CB730 000C7650  3C 60 80 00 */	lis r3, 0x80000038@ha
/* 800CB734 000C7654  90 6D A1 D0 */	stw r3, _DVDFS_BootInfo@sda21(r13)
/* 800CB738 000C7658  80 03 00 38 */	lwz r0, 0x80000038@l(r3)
/* 800CB73C 000C765C  90 0D A1 D4 */	stw r0, FstStart@sda21(r13)
/* 800CB740 000C7660  80 6D A1 D4 */	lwz r3, FstStart@sda21(r13)
/* 800CB744 000C7664  28 03 00 00 */	cmplwi r3, 0
/* 800CB748 000C7668  4D 82 00 20 */	beqlr
/* 800CB74C 000C766C  80 03 00 08 */	lwz r0, 8(r3)
/* 800CB750 000C7670  90 0D A1 DC */	stw r0, MaxEntryNum@sda21(r13)
/* 800CB754 000C7674  80 0D A1 DC */	lwz r0, MaxEntryNum@sda21(r13)
/* 800CB758 000C7678  1C 00 00 0C */	mulli r0, r0, 0xc
/* 800CB75C 000C767C  7C 03 02 14 */	add r0, r3, r0
/* 800CB760 000C7680  90 0D A1 D8 */	stw r0, FstStringStart@sda21(r13)
/* 800CB764 000C7684  4E 80 00 20 */	blr

.global DVDConvertPathToEntrynum
DVDConvertPathToEntrynum:
/* 800CB768 000C7688  7C 08 02 A6 */	mflr r0
/* 800CB76C 000C768C  90 01 00 04 */	stw r0, 4(r1)
/* 800CB770 000C7690  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 800CB774 000C7694  BE 81 00 18 */	stmw r20, 0x18(r1)
/* 800CB778 000C7698  7C 77 1B 78 */	mr r23, r3
/* 800CB77C 000C769C  3C 60 80 1E */	lis r3, lbl_801E7590@ha
/* 800CB780 000C76A0  3B 37 00 00 */	addi r25, r23, 0
/* 800CB784 000C76A4  3B E3 75 90 */	addi r31, r3, lbl_801E7590@l
/* 800CB788 000C76A8  83 8D A1 E0 */	lwz r28, currentDirectory@sda21(r13)
lbl_800CB78C:
/* 800CB78C 000C76AC  88 17 00 00 */	lbz r0, 0(r23)
/* 800CB790 000C76B0  28 00 00 00 */	cmplwi r0, 0
/* 800CB794 000C76B4  40 82 00 0C */	bne lbl_800CB7A0
/* 800CB798 000C76B8  7F 83 E3 78 */	mr r3, r28
/* 800CB79C 000C76BC  48 00 02 98 */	b lbl_800CBA34
lbl_800CB7A0:
/* 800CB7A0 000C76C0  28 00 00 2F */	cmplwi r0, 0x2f
/* 800CB7A4 000C76C4  40 82 00 10 */	bne lbl_800CB7B4
/* 800CB7A8 000C76C8  3B 80 00 00 */	li r28, 0
/* 800CB7AC 000C76CC  3A F7 00 01 */	addi r23, r23, 1
/* 800CB7B0 000C76D0  4B FF FF DC */	b lbl_800CB78C
lbl_800CB7B4:
/* 800CB7B4 000C76D4  28 00 00 2E */	cmplwi r0, 0x2e
/* 800CB7B8 000C76D8  40 82 00 70 */	bne lbl_800CB828
/* 800CB7BC 000C76DC  88 17 00 01 */	lbz r0, 1(r23)
/* 800CB7C0 000C76E0  28 00 00 2E */	cmplwi r0, 0x2e
/* 800CB7C4 000C76E4  40 82 00 44 */	bne lbl_800CB808
/* 800CB7C8 000C76E8  88 17 00 02 */	lbz r0, 2(r23)
/* 800CB7CC 000C76EC  28 00 00 2F */	cmplwi r0, 0x2f
/* 800CB7D0 000C76F0  40 82 00 1C */	bne lbl_800CB7EC
/* 800CB7D4 000C76F4  1C 7C 00 0C */	mulli r3, r28, 0xc
/* 800CB7D8 000C76F8  80 8D A1 D4 */	lwz r4, FstStart@sda21(r13)
/* 800CB7DC 000C76FC  38 03 00 04 */	addi r0, r3, 4
/* 800CB7E0 000C7700  7F 84 00 2E */	lwzx r28, r4, r0
/* 800CB7E4 000C7704  3A F7 00 03 */	addi r23, r23, 3
/* 800CB7E8 000C7708  4B FF FF A4 */	b lbl_800CB78C
lbl_800CB7EC:
/* 800CB7EC 000C770C  28 00 00 00 */	cmplwi r0, 0
/* 800CB7F0 000C7710  40 82 00 38 */	bne lbl_800CB828
/* 800CB7F4 000C7714  1C 1C 00 0C */	mulli r0, r28, 0xc
/* 800CB7F8 000C7718  80 6D A1 D4 */	lwz r3, FstStart@sda21(r13)
/* 800CB7FC 000C771C  7C 63 02 14 */	add r3, r3, r0
/* 800CB800 000C7720  80 63 00 04 */	lwz r3, 4(r3)
/* 800CB804 000C7724  48 00 02 30 */	b lbl_800CBA34
lbl_800CB808:
/* 800CB808 000C7728  28 00 00 2F */	cmplwi r0, 0x2f
/* 800CB80C 000C772C  40 82 00 0C */	bne lbl_800CB818
/* 800CB810 000C7730  3A F7 00 02 */	addi r23, r23, 2
/* 800CB814 000C7734  4B FF FF 78 */	b lbl_800CB78C
lbl_800CB818:
/* 800CB818 000C7738  28 00 00 00 */	cmplwi r0, 0
/* 800CB81C 000C773C  40 82 00 0C */	bne lbl_800CB828
/* 800CB820 000C7740  7F 83 E3 78 */	mr r3, r28
/* 800CB824 000C7744  48 00 02 10 */	b lbl_800CBA34
lbl_800CB828:
/* 800CB828 000C7748  80 0D A1 E4 */	lwz r0, __DVDLongFileNameFlag@sda21(r13)
/* 800CB82C 000C774C  28 00 00 00 */	cmplwi r0, 0
/* 800CB830 000C7750  40 82 00 A4 */	bne lbl_800CB8D4
/* 800CB834 000C7754  3A 97 00 00 */	addi r20, r23, 0
/* 800CB838 000C7758  38 80 00 00 */	li r4, 0
/* 800CB83C 000C775C  38 60 00 00 */	li r3, 0
/* 800CB840 000C7760  48 00 00 44 */	b lbl_800CB884
lbl_800CB844:
/* 800CB844 000C7764  28 00 00 2E */	cmplwi r0, 0x2e
/* 800CB848 000C7768  40 82 00 2C */	bne lbl_800CB874
/* 800CB84C 000C776C  7C 17 A0 50 */	subf r0, r23, r20
/* 800CB850 000C7770  2C 00 00 08 */	cmpwi r0, 8
/* 800CB854 000C7774  41 81 00 0C */	bgt lbl_800CB860
/* 800CB858 000C7778  2C 04 00 01 */	cmpwi r4, 1
/* 800CB85C 000C777C  40 82 00 0C */	bne lbl_800CB868
lbl_800CB860:
/* 800CB860 000C7780  38 60 00 01 */	li r3, 1
/* 800CB864 000C7784  48 00 00 34 */	b lbl_800CB898
lbl_800CB868:
/* 800CB868 000C7788  3B 14 00 01 */	addi r24, r20, 1
/* 800CB86C 000C778C  38 80 00 01 */	li r4, 1
/* 800CB870 000C7790  48 00 00 10 */	b lbl_800CB880
lbl_800CB874:
/* 800CB874 000C7794  28 00 00 20 */	cmplwi r0, 0x20
/* 800CB878 000C7798  40 82 00 08 */	bne lbl_800CB880
/* 800CB87C 000C779C  38 60 00 01 */	li r3, 1
lbl_800CB880:
/* 800CB880 000C77A0  3A 94 00 01 */	addi r20, r20, 1
lbl_800CB884:
/* 800CB884 000C77A4  88 14 00 00 */	lbz r0, 0(r20)
/* 800CB888 000C77A8  28 00 00 00 */	cmplwi r0, 0
/* 800CB88C 000C77AC  41 82 00 0C */	beq lbl_800CB898
/* 800CB890 000C77B0  28 00 00 2F */	cmplwi r0, 0x2f
/* 800CB894 000C77B4  40 82 FF B0 */	bne lbl_800CB844
lbl_800CB898:
/* 800CB898 000C77B8  2C 04 00 01 */	cmpwi r4, 1
/* 800CB89C 000C77BC  40 82 00 14 */	bne lbl_800CB8B0
/* 800CB8A0 000C77C0  7C 18 A0 50 */	subf r0, r24, r20
/* 800CB8A4 000C77C4  2C 00 00 03 */	cmpwi r0, 3
/* 800CB8A8 000C77C8  40 81 00 08 */	ble lbl_800CB8B0
/* 800CB8AC 000C77CC  38 60 00 01 */	li r3, 1
lbl_800CB8B0:
/* 800CB8B0 000C77D0  2C 03 00 00 */	cmpwi r3, 0
/* 800CB8B4 000C77D4  41 82 00 40 */	beq lbl_800CB8F4
/* 800CB8B8 000C77D8  38 BF 00 00 */	addi r5, r31, 0
/* 800CB8BC 000C77DC  4C C6 31 82 */	crclr 6
/* 800CB8C0 000C77E0  38 D9 00 00 */	addi r6, r25, 0
/* 800CB8C4 000C77E4  38 6D 97 78 */	addi r3, r13, lbl_802F1958@sda21
/* 800CB8C8 000C77E8  38 80 01 75 */	li r4, 0x175
/* 800CB8CC 000C77EC  4B FF 83 D5 */	bl OSPanic
/* 800CB8D0 000C77F0  48 00 00 24 */	b lbl_800CB8F4
lbl_800CB8D4:
/* 800CB8D4 000C77F4  7E F4 BB 78 */	mr r20, r23
/* 800CB8D8 000C77F8  48 00 00 08 */	b lbl_800CB8E0
lbl_800CB8DC:
/* 800CB8DC 000C77FC  3A 94 00 01 */	addi r20, r20, 1
lbl_800CB8E0:
/* 800CB8E0 000C7800  88 14 00 00 */	lbz r0, 0(r20)
/* 800CB8E4 000C7804  28 00 00 00 */	cmplwi r0, 0
/* 800CB8E8 000C7808  41 82 00 0C */	beq lbl_800CB8F4
/* 800CB8EC 000C780C  28 00 00 2F */	cmplwi r0, 0x2f
/* 800CB8F0 000C7810  40 82 FF EC */	bne lbl_800CB8DC
lbl_800CB8F4:
/* 800CB8F4 000C7814  88 14 00 00 */	lbz r0, 0(r20)
/* 800CB8F8 000C7818  28 00 00 00 */	cmplwi r0, 0
/* 800CB8FC 000C781C  40 82 00 0C */	bne lbl_800CB908
/* 800CB900 000C7820  3B C0 00 00 */	li r30, 0
/* 800CB904 000C7824  48 00 00 08 */	b lbl_800CB90C
lbl_800CB908:
/* 800CB908 000C7828  3B C0 00 01 */	li r30, 1
lbl_800CB90C:
/* 800CB90C 000C782C  1F BC 00 0C */	mulli r29, r28, 0xc
/* 800CB910 000C7830  7F 77 A0 50 */	subf r27, r23, r20
/* 800CB914 000C7834  3B 5C 00 01 */	addi r26, r28, 1
/* 800CB918 000C7838  48 00 00 E0 */	b lbl_800CB9F8
lbl_800CB91C:
/* 800CB91C 000C783C  1F 9A 00 0C */	mulli r28, r26, 0xc
/* 800CB920 000C7840  7C 83 E0 2E */	lwzx r4, r3, r28
/* 800CB924 000C7844  54 80 00 0F */	rlwinm. r0, r4, 0, 0, 7
/* 800CB928 000C7848  40 82 00 0C */	bne lbl_800CB934
/* 800CB92C 000C784C  38 00 00 00 */	li r0, 0
/* 800CB930 000C7850  48 00 00 08 */	b lbl_800CB938
lbl_800CB934:
/* 800CB934 000C7854  38 00 00 01 */	li r0, 1
lbl_800CB938:
/* 800CB938 000C7858  2C 00 00 00 */	cmpwi r0, 0
/* 800CB93C 000C785C  40 82 00 0C */	bne lbl_800CB948
/* 800CB940 000C7860  2C 1E 00 01 */	cmpwi r30, 1
/* 800CB944 000C7864  41 82 00 7C */	beq lbl_800CB9C0
lbl_800CB948:
/* 800CB948 000C7868  80 6D A1 D8 */	lwz r3, FstStringStart@sda21(r13)
/* 800CB94C 000C786C  54 80 02 3E */	clrlwi r0, r4, 8
/* 800CB950 000C7870  3A B7 00 00 */	addi r21, r23, 0
/* 800CB954 000C7874  7E 83 02 14 */	add r20, r3, r0
/* 800CB958 000C7878  48 00 00 34 */	b lbl_800CB98C
lbl_800CB95C:
/* 800CB95C 000C787C  88 74 00 00 */	lbz r3, 0(r20)
/* 800CB960 000C7880  3A 94 00 01 */	addi r20, r20, 1
/* 800CB964 000C7884  48 03 8B 55 */	bl tolower
/* 800CB968 000C7888  88 15 00 00 */	lbz r0, 0(r21)
/* 800CB96C 000C788C  3A C3 00 00 */	addi r22, r3, 0
/* 800CB970 000C7890  3A B5 00 01 */	addi r21, r21, 1
/* 800CB974 000C7894  7C 03 03 78 */	mr r3, r0
/* 800CB978 000C7898  48 03 8B 41 */	bl tolower
/* 800CB97C 000C789C  7C 03 B0 00 */	cmpw r3, r22
/* 800CB980 000C78A0  41 82 00 0C */	beq lbl_800CB98C
/* 800CB984 000C78A4  38 00 00 00 */	li r0, 0
/* 800CB988 000C78A8  48 00 00 30 */	b lbl_800CB9B8
lbl_800CB98C:
/* 800CB98C 000C78AC  88 14 00 00 */	lbz r0, 0(r20)
/* 800CB990 000C78B0  28 00 00 00 */	cmplwi r0, 0
/* 800CB994 000C78B4  40 82 FF C8 */	bne lbl_800CB95C
/* 800CB998 000C78B8  88 15 00 00 */	lbz r0, 0(r21)
/* 800CB99C 000C78BC  28 00 00 2F */	cmplwi r0, 0x2f
/* 800CB9A0 000C78C0  41 82 00 0C */	beq lbl_800CB9AC
/* 800CB9A4 000C78C4  28 00 00 00 */	cmplwi r0, 0
/* 800CB9A8 000C78C8  40 82 00 0C */	bne lbl_800CB9B4
lbl_800CB9AC:
/* 800CB9AC 000C78CC  38 00 00 01 */	li r0, 1
/* 800CB9B0 000C78D0  48 00 00 08 */	b lbl_800CB9B8
lbl_800CB9B4:
/* 800CB9B4 000C78D4  38 00 00 00 */	li r0, 0
lbl_800CB9B8:
/* 800CB9B8 000C78D8  2C 00 00 01 */	cmpwi r0, 1
/* 800CB9BC 000C78DC  41 82 00 58 */	beq lbl_800CBA14
lbl_800CB9C0:
/* 800CB9C0 000C78E0  80 0D A1 D4 */	lwz r0, FstStart@sda21(r13)
/* 800CB9C4 000C78E4  7C 60 E2 14 */	add r3, r0, r28
/* 800CB9C8 000C78E8  80 03 00 00 */	lwz r0, 0(r3)
/* 800CB9CC 000C78EC  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CB9D0 000C78F0  40 82 00 0C */	bne lbl_800CB9DC
/* 800CB9D4 000C78F4  38 00 00 00 */	li r0, 0
/* 800CB9D8 000C78F8  48 00 00 08 */	b lbl_800CB9E0
lbl_800CB9DC:
/* 800CB9DC 000C78FC  38 00 00 01 */	li r0, 1
lbl_800CB9E0:
/* 800CB9E0 000C7900  2C 00 00 00 */	cmpwi r0, 0
/* 800CB9E4 000C7904  41 82 00 0C */	beq lbl_800CB9F0
/* 800CB9E8 000C7908  80 03 00 08 */	lwz r0, 8(r3)
/* 800CB9EC 000C790C  48 00 00 08 */	b lbl_800CB9F4
lbl_800CB9F0:
/* 800CB9F0 000C7910  38 1A 00 01 */	addi r0, r26, 1
lbl_800CB9F4:
/* 800CB9F4 000C7914  7C 1A 03 78 */	mr r26, r0
lbl_800CB9F8:
/* 800CB9F8 000C7918  80 6D A1 D4 */	lwz r3, FstStart@sda21(r13)
/* 800CB9FC 000C791C  38 03 00 08 */	addi r0, r3, 8
/* 800CBA00 000C7920  7C 1D 00 2E */	lwzx r0, r29, r0
/* 800CBA04 000C7924  7C 1A 00 40 */	cmplw r26, r0
/* 800CBA08 000C7928  41 80 FF 14 */	blt lbl_800CB91C
/* 800CBA0C 000C792C  38 60 FF FF */	li r3, -1
/* 800CBA10 000C7930  48 00 00 24 */	b lbl_800CBA34
lbl_800CBA14:
/* 800CBA14 000C7934  2C 1E 00 00 */	cmpwi r30, 0
/* 800CBA18 000C7938  40 82 00 0C */	bne lbl_800CBA24
/* 800CBA1C 000C793C  7F 43 D3 78 */	mr r3, r26
/* 800CBA20 000C7940  48 00 00 14 */	b lbl_800CBA34
lbl_800CBA24:
/* 800CBA24 000C7944  7E FB BA 14 */	add r23, r27, r23
/* 800CBA28 000C7948  3B 9A 00 00 */	addi r28, r26, 0
/* 800CBA2C 000C794C  3A F7 00 01 */	addi r23, r23, 1
/* 800CBA30 000C7950  4B FF FD 5C */	b lbl_800CB78C
lbl_800CBA34:
/* 800CBA34 000C7954  BA 81 00 18 */	lmw r20, 0x18(r1)
/* 800CBA38 000C7958  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800CBA3C 000C795C  38 21 00 48 */	addi r1, r1, 0x48
/* 800CBA40 000C7960  7C 08 03 A6 */	mtlr r0
/* 800CBA44 000C7964  4E 80 00 20 */	blr

.global DVDFastOpen
DVDFastOpen:
/* 800CBA48 000C7968  2C 03 00 00 */	cmpwi r3, 0
/* 800CBA4C 000C796C  41 80 00 38 */	blt lbl_800CBA84
/* 800CBA50 000C7970  80 0D A1 DC */	lwz r0, MaxEntryNum@sda21(r13)
/* 800CBA54 000C7974  7C 03 00 40 */	cmplw r3, r0
/* 800CBA58 000C7978  40 80 00 2C */	bge lbl_800CBA84
/* 800CBA5C 000C797C  1C C3 00 0C */	mulli r6, r3, 0xc
/* 800CBA60 000C7980  80 6D A1 D4 */	lwz r3, FstStart@sda21(r13)
/* 800CBA64 000C7984  7C 03 30 2E */	lwzx r0, r3, r6
/* 800CBA68 000C7988  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CBA6C 000C798C  40 82 00 0C */	bne lbl_800CBA78
/* 800CBA70 000C7990  38 00 00 00 */	li r0, 0
/* 800CBA74 000C7994  48 00 00 08 */	b lbl_800CBA7C
lbl_800CBA78:
/* 800CBA78 000C7998  38 00 00 01 */	li r0, 1
lbl_800CBA7C:
/* 800CBA7C 000C799C  2C 00 00 00 */	cmpwi r0, 0
/* 800CBA80 000C79A0  41 82 00 0C */	beq lbl_800CBA8C
lbl_800CBA84:
/* 800CBA84 000C79A4  38 60 00 00 */	li r3, 0
/* 800CBA88 000C79A8  4E 80 00 20 */	blr
lbl_800CBA8C:
/* 800CBA8C 000C79AC  7C 63 32 14 */	add r3, r3, r6
/* 800CBA90 000C79B0  80 A3 00 04 */	lwz r5, 4(r3)
/* 800CBA94 000C79B4  38 00 00 00 */	li r0, 0
/* 800CBA98 000C79B8  38 60 00 01 */	li r3, 1
/* 800CBA9C 000C79BC  90 A4 00 30 */	stw r5, 0x30(r4)
/* 800CBAA0 000C79C0  80 AD A1 D4 */	lwz r5, FstStart@sda21(r13)
/* 800CBAA4 000C79C4  7C A5 32 14 */	add r5, r5, r6
/* 800CBAA8 000C79C8  80 A5 00 08 */	lwz r5, 8(r5)
/* 800CBAAC 000C79CC  90 A4 00 34 */	stw r5, 0x34(r4)
/* 800CBAB0 000C79D0  90 04 00 38 */	stw r0, 0x38(r4)
/* 800CBAB4 000C79D4  90 04 00 0C */	stw r0, 0xc(r4)
/* 800CBAB8 000C79D8  4E 80 00 20 */	blr

.global DVDOpen
DVDOpen:
/* 800CBABC 000C79DC  7C 08 02 A6 */	mflr r0
/* 800CBAC0 000C79E0  90 01 00 04 */	stw r0, 4(r1)
/* 800CBAC4 000C79E4  94 21 FF 68 */	stwu r1, -0x98(r1)
/* 800CBAC8 000C79E8  93 E1 00 94 */	stw r31, 0x94(r1)
/* 800CBACC 000C79EC  3B E4 00 00 */	addi r31, r4, 0
/* 800CBAD0 000C79F0  93 C1 00 90 */	stw r30, 0x90(r1)
/* 800CBAD4 000C79F4  3B C3 00 00 */	addi r30, r3, 0
/* 800CBAD8 000C79F8  4B FF FC 91 */	bl DVDConvertPathToEntrynum
/* 800CBADC 000C79FC  2C 03 00 00 */	cmpwi r3, 0
/* 800CBAE0 000C7A00  40 80 00 30 */	bge lbl_800CBB10
/* 800CBAE4 000C7A04  38 61 00 10 */	addi r3, r1, 0x10
/* 800CBAE8 000C7A08  38 80 00 80 */	li r4, 0x80
/* 800CBAEC 000C7A0C  48 00 02 1D */	bl DVDGetCurrentDir
/* 800CBAF0 000C7A10  3C 60 80 1E */	lis r3, lbl_801E7658@ha
/* 800CBAF4 000C7A14  4C C6 31 82 */	crclr 6
/* 800CBAF8 000C7A18  38 63 76 58 */	addi r3, r3, lbl_801E7658@l
/* 800CBAFC 000C7A1C  38 9E 00 00 */	addi r4, r30, 0
/* 800CBB00 000C7A20  38 A1 00 10 */	addi r5, r1, 0x10
/* 800CBB04 000C7A24  4B FF 81 1D */	bl OSReport
/* 800CBB08 000C7A28  38 60 00 00 */	li r3, 0
/* 800CBB0C 000C7A2C  48 00 00 60 */	b lbl_800CBB6C
lbl_800CBB10:
/* 800CBB10 000C7A30  1C A3 00 0C */	mulli r5, r3, 0xc
/* 800CBB14 000C7A34  80 6D A1 D4 */	lwz r3, FstStart@sda21(r13)
/* 800CBB18 000C7A38  7C 03 28 2E */	lwzx r0, r3, r5
/* 800CBB1C 000C7A3C  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CBB20 000C7A40  40 82 00 0C */	bne lbl_800CBB2C
/* 800CBB24 000C7A44  38 00 00 00 */	li r0, 0
/* 800CBB28 000C7A48  48 00 00 08 */	b lbl_800CBB30
lbl_800CBB2C:
/* 800CBB2C 000C7A4C  38 00 00 01 */	li r0, 1
lbl_800CBB30:
/* 800CBB30 000C7A50  2C 00 00 00 */	cmpwi r0, 0
/* 800CBB34 000C7A54  41 82 00 0C */	beq lbl_800CBB40
/* 800CBB38 000C7A58  38 60 00 00 */	li r3, 0
/* 800CBB3C 000C7A5C  48 00 00 30 */	b lbl_800CBB6C
lbl_800CBB40:
/* 800CBB40 000C7A60  7C 63 2A 14 */	add r3, r3, r5
/* 800CBB44 000C7A64  80 83 00 04 */	lwz r4, 4(r3)
/* 800CBB48 000C7A68  38 00 00 00 */	li r0, 0
/* 800CBB4C 000C7A6C  38 60 00 01 */	li r3, 1
/* 800CBB50 000C7A70  90 9F 00 30 */	stw r4, 0x30(r31)
/* 800CBB54 000C7A74  80 8D A1 D4 */	lwz r4, FstStart@sda21(r13)
/* 800CBB58 000C7A78  7C 84 2A 14 */	add r4, r4, r5
/* 800CBB5C 000C7A7C  80 84 00 08 */	lwz r4, 8(r4)
/* 800CBB60 000C7A80  90 9F 00 34 */	stw r4, 0x34(r31)
/* 800CBB64 000C7A84  90 1F 00 38 */	stw r0, 0x38(r31)
/* 800CBB68 000C7A88  90 1F 00 0C */	stw r0, 0xc(r31)
lbl_800CBB6C:
/* 800CBB6C 000C7A8C  80 01 00 9C */	lwz r0, 0x9c(r1)
/* 800CBB70 000C7A90  83 E1 00 94 */	lwz r31, 0x94(r1)
/* 800CBB74 000C7A94  83 C1 00 90 */	lwz r30, 0x90(r1)
/* 800CBB78 000C7A98  7C 08 03 A6 */	mtlr r0
/* 800CBB7C 000C7A9C  38 21 00 98 */	addi r1, r1, 0x98
/* 800CBB80 000C7AA0  4E 80 00 20 */	blr

.global DVDClose
DVDClose:
/* 800CBB84 000C7AA4  7C 08 02 A6 */	mflr r0
/* 800CBB88 000C7AA8  90 01 00 04 */	stw r0, 4(r1)
/* 800CBB8C 000C7AAC  94 21 FF F8 */	stwu r1, -8(r1)
/* 800CBB90 000C7AB0  48 00 2A 0D */	bl DVDCancel
/* 800CBB94 000C7AB4  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800CBB98 000C7AB8  38 60 00 01 */	li r3, 1
/* 800CBB9C 000C7ABC  38 21 00 08 */	addi r1, r1, 8
/* 800CBBA0 000C7AC0  7C 08 03 A6 */	mtlr r0
/* 800CBBA4 000C7AC4  4E 80 00 20 */	blr

.global entryToPath
entryToPath:
/* 800CBBA8 000C7AC8  7C 08 02 A6 */	mflr r0
/* 800CBBAC 000C7ACC  28 03 00 00 */	cmplwi r3, 0
/* 800CBBB0 000C7AD0  90 01 00 04 */	stw r0, 4(r1)
/* 800CBBB4 000C7AD4  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800CBBB8 000C7AD8  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800CBBBC 000C7ADC  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800CBBC0 000C7AE0  3B C5 00 00 */	addi r30, r5, 0
/* 800CBBC4 000C7AE4  93 A1 00 24 */	stw r29, 0x24(r1)
/* 800CBBC8 000C7AE8  3B A4 00 00 */	addi r29, r4, 0
/* 800CBBCC 000C7AEC  93 81 00 20 */	stw r28, 0x20(r1)
/* 800CBBD0 000C7AF0  40 82 00 0C */	bne lbl_800CBBDC
/* 800CBBD4 000C7AF4  38 60 00 00 */	li r3, 0
/* 800CBBD8 000C7AF8  48 00 01 10 */	b lbl_800CBCE8
lbl_800CBBDC:
/* 800CBBDC 000C7AFC  80 8D A1 D4 */	lwz r4, FstStart@sda21(r13)
/* 800CBBE0 000C7B00  1C 63 00 0C */	mulli r3, r3, 0xc
/* 800CBBE4 000C7B04  80 CD A1 D8 */	lwz r6, FstStringStart@sda21(r13)
/* 800CBBE8 000C7B08  38 A4 00 04 */	addi r5, r4, 4
/* 800CBBEC 000C7B0C  7C 04 18 2E */	lwzx r0, r4, r3
/* 800CBBF0 000C7B10  7C 65 18 2E */	lwzx r3, r5, r3
/* 800CBBF4 000C7B14  54 00 02 3E */	clrlwi r0, r0, 8
/* 800CBBF8 000C7B18  28 03 00 00 */	cmplwi r3, 0
/* 800CBBFC 000C7B1C  7F E6 02 14 */	add r31, r6, r0
/* 800CBC00 000C7B20  40 82 00 0C */	bne lbl_800CBC0C
/* 800CBC04 000C7B24  38 60 00 00 */	li r3, 0
/* 800CBC08 000C7B28  48 00 00 80 */	b lbl_800CBC88
lbl_800CBC0C:
/* 800CBC0C 000C7B2C  1C 63 00 0C */	mulli r3, r3, 0xc
/* 800CBC10 000C7B30  7C 04 18 2E */	lwzx r0, r4, r3
/* 800CBC14 000C7B34  7F A4 EB 78 */	mr r4, r29
/* 800CBC18 000C7B38  7C 65 18 2E */	lwzx r3, r5, r3
/* 800CBC1C 000C7B3C  38 BE 00 00 */	addi r5, r30, 0
/* 800CBC20 000C7B40  54 00 02 3E */	clrlwi r0, r0, 8
/* 800CBC24 000C7B44  7F 86 02 14 */	add r28, r6, r0
/* 800CBC28 000C7B48  4B FF FF 81 */	bl entryToPath
/* 800CBC2C 000C7B4C  7C 03 F0 40 */	cmplw r3, r30
/* 800CBC30 000C7B50  40 82 00 08 */	bne lbl_800CBC38
/* 800CBC34 000C7B54  48 00 00 54 */	b lbl_800CBC88
lbl_800CBC38:
/* 800CBC38 000C7B58  38 03 00 00 */	addi r0, r3, 0
/* 800CBC3C 000C7B5C  38 63 00 01 */	addi r3, r3, 1
/* 800CBC40 000C7B60  38 80 00 2F */	li r4, 0x2f
/* 800CBC44 000C7B64  7C C3 F0 50 */	subf r6, r3, r30
/* 800CBC48 000C7B68  7C 9D 01 AE */	stbx r4, r29, r0
/* 800CBC4C 000C7B6C  38 86 00 00 */	addi r4, r6, 0
/* 800CBC50 000C7B70  7C BD 1A 14 */	add r5, r29, r3
/* 800CBC54 000C7B74  48 00 00 18 */	b lbl_800CBC6C
lbl_800CBC58:
/* 800CBC58 000C7B78  88 1C 00 00 */	lbz r0, 0(r28)
/* 800CBC5C 000C7B7C  3B 9C 00 01 */	addi r28, r28, 1
/* 800CBC60 000C7B80  38 84 FF FF */	addi r4, r4, -1
/* 800CBC64 000C7B84  98 05 00 00 */	stb r0, 0(r5)
/* 800CBC68 000C7B88  38 A5 00 01 */	addi r5, r5, 1
lbl_800CBC6C:
/* 800CBC6C 000C7B8C  28 04 00 00 */	cmplwi r4, 0
/* 800CBC70 000C7B90  41 82 00 10 */	beq lbl_800CBC80
/* 800CBC74 000C7B94  88 1C 00 00 */	lbz r0, 0(r28)
/* 800CBC78 000C7B98  28 00 00 00 */	cmplwi r0, 0
/* 800CBC7C 000C7B9C  40 82 FF DC */	bne lbl_800CBC58
lbl_800CBC80:
/* 800CBC80 000C7BA0  7C 04 30 50 */	subf r0, r4, r6
/* 800CBC84 000C7BA4  7C 63 02 14 */	add r3, r3, r0
lbl_800CBC88:
/* 800CBC88 000C7BA8  7C 03 F0 40 */	cmplw r3, r30
/* 800CBC8C 000C7BAC  40 82 00 08 */	bne lbl_800CBC94
/* 800CBC90 000C7BB0  48 00 00 58 */	b lbl_800CBCE8
lbl_800CBC94:
/* 800CBC94 000C7BB4  38 03 00 00 */	addi r0, r3, 0
/* 800CBC98 000C7BB8  38 63 00 01 */	addi r3, r3, 1
/* 800CBC9C 000C7BBC  38 80 00 2F */	li r4, 0x2f
/* 800CBCA0 000C7BC0  7C E3 F0 50 */	subf r7, r3, r30
/* 800CBCA4 000C7BC4  7C 9D 01 AE */	stbx r4, r29, r0
/* 800CBCA8 000C7BC8  38 DF 00 00 */	addi r6, r31, 0
/* 800CBCAC 000C7BCC  38 87 00 00 */	addi r4, r7, 0
/* 800CBCB0 000C7BD0  7C BD 1A 14 */	add r5, r29, r3
/* 800CBCB4 000C7BD4  48 00 00 18 */	b lbl_800CBCCC
lbl_800CBCB8:
/* 800CBCB8 000C7BD8  88 06 00 00 */	lbz r0, 0(r6)
/* 800CBCBC 000C7BDC  38 C6 00 01 */	addi r6, r6, 1
/* 800CBCC0 000C7BE0  38 84 FF FF */	addi r4, r4, -1
/* 800CBCC4 000C7BE4  98 05 00 00 */	stb r0, 0(r5)
/* 800CBCC8 000C7BE8  38 A5 00 01 */	addi r5, r5, 1
lbl_800CBCCC:
/* 800CBCCC 000C7BEC  28 04 00 00 */	cmplwi r4, 0
/* 800CBCD0 000C7BF0  41 82 00 10 */	beq lbl_800CBCE0
/* 800CBCD4 000C7BF4  88 06 00 00 */	lbz r0, 0(r6)
/* 800CBCD8 000C7BF8  28 00 00 00 */	cmplwi r0, 0
/* 800CBCDC 000C7BFC  40 82 FF DC */	bne lbl_800CBCB8
lbl_800CBCE0:
/* 800CBCE0 000C7C00  7C 04 38 50 */	subf r0, r4, r7
/* 800CBCE4 000C7C04  7C 63 02 14 */	add r3, r3, r0
lbl_800CBCE8:
/* 800CBCE8 000C7C08  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800CBCEC 000C7C0C  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 800CBCF0 000C7C10  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 800CBCF4 000C7C14  7C 08 03 A6 */	mtlr r0
/* 800CBCF8 000C7C18  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 800CBCFC 000C7C1C  83 81 00 20 */	lwz r28, 0x20(r1)
/* 800CBD00 000C7C20  38 21 00 30 */	addi r1, r1, 0x30
/* 800CBD04 000C7C24  4E 80 00 20 */	blr

.global DVDGetCurrentDir
DVDGetCurrentDir:
/* 800CBD08 000C7C28  7C 08 02 A6 */	mflr r0
/* 800CBD0C 000C7C2C  90 01 00 04 */	stw r0, 4(r1)
/* 800CBD10 000C7C30  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800CBD14 000C7C34  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800CBD18 000C7C38  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800CBD1C 000C7C3C  3B C4 00 00 */	addi r30, r4, 0
/* 800CBD20 000C7C40  38 BE 00 00 */	addi r5, r30, 0
/* 800CBD24 000C7C44  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800CBD28 000C7C48  3B A3 00 00 */	addi r29, r3, 0
/* 800CBD2C 000C7C4C  38 9D 00 00 */	addi r4, r29, 0
/* 800CBD30 000C7C50  83 ED A1 E0 */	lwz r31, currentDirectory@sda21(r13)
/* 800CBD34 000C7C54  38 7F 00 00 */	addi r3, r31, 0
/* 800CBD38 000C7C58  4B FF FE 71 */	bl entryToPath
/* 800CBD3C 000C7C5C  7C 03 F0 40 */	cmplw r3, r30
/* 800CBD40 000C7C60  40 82 00 14 */	bne lbl_800CBD54
/* 800CBD44 000C7C64  38 00 00 00 */	li r0, 0
/* 800CBD48 000C7C68  7C 7D F2 14 */	add r3, r29, r30
/* 800CBD4C 000C7C6C  98 03 FF FF */	stb r0, -1(r3)
/* 800CBD50 000C7C70  48 00 00 5C */	b lbl_800CBDAC
lbl_800CBD54:
/* 800CBD54 000C7C74  1C 1F 00 0C */	mulli r0, r31, 0xc
/* 800CBD58 000C7C78  80 8D A1 D4 */	lwz r4, FstStart@sda21(r13)
/* 800CBD5C 000C7C7C  7C 04 00 2E */	lwzx r0, r4, r0
/* 800CBD60 000C7C80  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CBD64 000C7C84  40 82 00 0C */	bne lbl_800CBD70
/* 800CBD68 000C7C88  38 00 00 00 */	li r0, 0
/* 800CBD6C 000C7C8C  48 00 00 08 */	b lbl_800CBD74
lbl_800CBD70:
/* 800CBD70 000C7C90  38 00 00 01 */	li r0, 1
lbl_800CBD74:
/* 800CBD74 000C7C94  2C 00 00 00 */	cmpwi r0, 0
/* 800CBD78 000C7C98  41 82 00 28 */	beq lbl_800CBDA0
/* 800CBD7C 000C7C9C  38 1E FF FF */	addi r0, r30, -1
/* 800CBD80 000C7CA0  7C 03 00 40 */	cmplw r3, r0
/* 800CBD84 000C7CA4  40 82 00 10 */	bne lbl_800CBD94
/* 800CBD88 000C7CA8  38 00 00 00 */	li r0, 0
/* 800CBD8C 000C7CAC  7C 1D 19 AE */	stbx r0, r29, r3
/* 800CBD90 000C7CB0  48 00 00 1C */	b lbl_800CBDAC
lbl_800CBD94:
/* 800CBD94 000C7CB4  38 00 00 2F */	li r0, 0x2f
/* 800CBD98 000C7CB8  7C 1D 19 AE */	stbx r0, r29, r3
/* 800CBD9C 000C7CBC  38 63 00 01 */	addi r3, r3, 1
lbl_800CBDA0:
/* 800CBDA0 000C7CC0  38 00 00 00 */	li r0, 0
/* 800CBDA4 000C7CC4  7C 1D 19 AE */	stbx r0, r29, r3
/* 800CBDA8 000C7CC8  38 00 00 01 */	li r0, 1
lbl_800CBDAC:
/* 800CBDAC 000C7CCC  7C 03 03 78 */	mr r3, r0
/* 800CBDB0 000C7CD0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800CBDB4 000C7CD4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800CBDB8 000C7CD8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800CBDBC 000C7CDC  7C 08 03 A6 */	mtlr r0
/* 800CBDC0 000C7CE0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800CBDC4 000C7CE4  38 21 00 20 */	addi r1, r1, 0x20
/* 800CBDC8 000C7CE8  4E 80 00 20 */	blr

.global DVDChangeDir
DVDChangeDir:
/* 800CBDCC 000C7CEC  7C 08 02 A6 */	mflr r0
/* 800CBDD0 000C7CF0  90 01 00 04 */	stw r0, 4(r1)
/* 800CBDD4 000C7CF4  94 21 FF F8 */	stwu r1, -8(r1)
/* 800CBDD8 000C7CF8  4B FF F9 91 */	bl DVDConvertPathToEntrynum
/* 800CBDDC 000C7CFC  2C 03 00 00 */	cmpwi r3, 0
/* 800CBDE0 000C7D00  41 80 00 2C */	blt lbl_800CBE0C
/* 800CBDE4 000C7D04  1C 03 00 0C */	mulli r0, r3, 0xc
/* 800CBDE8 000C7D08  80 8D A1 D4 */	lwz r4, FstStart@sda21(r13)
/* 800CBDEC 000C7D0C  7C 04 00 2E */	lwzx r0, r4, r0
/* 800CBDF0 000C7D10  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CBDF4 000C7D14  40 82 00 0C */	bne lbl_800CBE00
/* 800CBDF8 000C7D18  38 00 00 00 */	li r0, 0
/* 800CBDFC 000C7D1C  48 00 00 08 */	b lbl_800CBE04
lbl_800CBE00:
/* 800CBE00 000C7D20  38 00 00 01 */	li r0, 1
lbl_800CBE04:
/* 800CBE04 000C7D24  2C 00 00 00 */	cmpwi r0, 0
/* 800CBE08 000C7D28  40 82 00 0C */	bne lbl_800CBE14
lbl_800CBE0C:
/* 800CBE0C 000C7D2C  38 60 00 00 */	li r3, 0
/* 800CBE10 000C7D30  48 00 00 0C */	b lbl_800CBE1C
lbl_800CBE14:
/* 800CBE14 000C7D34  90 6D A1 E0 */	stw r3, currentDirectory@sda21(r13)
/* 800CBE18 000C7D38  38 60 00 01 */	li r3, 1
lbl_800CBE1C:
/* 800CBE1C 000C7D3C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800CBE20 000C7D40  38 21 00 08 */	addi r1, r1, 8
/* 800CBE24 000C7D44  7C 08 03 A6 */	mtlr r0
/* 800CBE28 000C7D48  4E 80 00 20 */	blr

.global DVDReadAsyncPrio
DVDReadAsyncPrio:
/* 800CBE2C 000C7D4C  7C 08 02 A6 */	mflr r0
/* 800CBE30 000C7D50  90 01 00 04 */	stw r0, 4(r1)
/* 800CBE34 000C7D54  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800CBE38 000C7D58  BF 41 00 20 */	stmw r26, 0x20(r1)
/* 800CBE3C 000C7D5C  7C DD 33 79 */	or. r29, r6, r6
/* 800CBE40 000C7D60  3B 43 00 00 */	addi r26, r3, 0
/* 800CBE44 000C7D64  3B 64 00 00 */	addi r27, r4, 0
/* 800CBE48 000C7D68  3B 85 00 00 */	addi r28, r5, 0
/* 800CBE4C 000C7D6C  3B C7 00 00 */	addi r30, r7, 0
/* 800CBE50 000C7D70  3B E8 00 00 */	addi r31, r8, 0
/* 800CBE54 000C7D74  41 80 00 10 */	blt lbl_800CBE64
/* 800CBE58 000C7D78  80 1A 00 34 */	lwz r0, 0x34(r26)
/* 800CBE5C 000C7D7C  7C 1D 00 40 */	cmplw r29, r0
/* 800CBE60 000C7D80  41 80 00 1C */	blt lbl_800CBE7C
lbl_800CBE64:
/* 800CBE64 000C7D84  3C 60 80 1E */	lis r3, lbl_801E7690@ha
/* 800CBE68 000C7D88  4C C6 31 82 */	crclr 6
/* 800CBE6C 000C7D8C  38 A3 76 90 */	addi r5, r3, lbl_801E7690@l
/* 800CBE70 000C7D90  38 6D 97 78 */	addi r3, r13, lbl_802F1958@sda21
/* 800CBE74 000C7D94  38 80 02 DF */	li r4, 0x2df
/* 800CBE78 000C7D98  4B FF 7E 29 */	bl OSPanic
lbl_800CBE7C:
/* 800CBE7C 000C7D9C  7C 9D E2 15 */	add. r4, r29, r28
/* 800CBE80 000C7DA0  41 80 00 14 */	blt lbl_800CBE94
/* 800CBE84 000C7DA4  80 7A 00 34 */	lwz r3, 0x34(r26)
/* 800CBE88 000C7DA8  38 03 00 20 */	addi r0, r3, 0x20
/* 800CBE8C 000C7DAC  7C 04 00 40 */	cmplw r4, r0
/* 800CBE90 000C7DB0  41 80 00 1C */	blt lbl_800CBEAC
lbl_800CBE94:
/* 800CBE94 000C7DB4  3C 60 80 1E */	lis r3, lbl_801E7690@ha
/* 800CBE98 000C7DB8  4C C6 31 82 */	crclr 6
/* 800CBE9C 000C7DBC  38 A3 76 90 */	addi r5, r3, lbl_801E7690@l
/* 800CBEA0 000C7DC0  38 6D 97 78 */	addi r3, r13, lbl_802F1958@sda21
/* 800CBEA4 000C7DC4  38 80 02 E5 */	li r4, 0x2e5
/* 800CBEA8 000C7DC8  4B FF 7D F9 */	bl OSPanic
lbl_800CBEAC:
/* 800CBEAC 000C7DCC  93 DA 00 38 */	stw r30, 0x38(r26)
/* 800CBEB0 000C7DD0  3C 60 80 0D */	lis r3, cbForReadAsync@ha
/* 800CBEB4 000C7DD4  38 E3 BE EC */	addi r7, r3, cbForReadAsync@l
/* 800CBEB8 000C7DD8  80 1A 00 30 */	lwz r0, 0x30(r26)
/* 800CBEBC 000C7DDC  38 7A 00 00 */	addi r3, r26, 0
/* 800CBEC0 000C7DE0  38 9B 00 00 */	addi r4, r27, 0
/* 800CBEC4 000C7DE4  38 BC 00 00 */	addi r5, r28, 0
/* 800CBEC8 000C7DE8  39 1F 00 00 */	addi r8, r31, 0
/* 800CBECC 000C7DEC  7C C0 EA 14 */	add r6, r0, r29
/* 800CBED0 000C7DF0  48 00 1D 39 */	bl DVDReadAbsAsyncPrio
/* 800CBED4 000C7DF4  BB 41 00 20 */	lmw r26, 0x20(r1)
/* 800CBED8 000C7DF8  38 60 00 01 */	li r3, 1
/* 800CBEDC 000C7DFC  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800CBEE0 000C7E00  38 21 00 38 */	addi r1, r1, 0x38
/* 800CBEE4 000C7E04  7C 08 03 A6 */	mtlr r0
/* 800CBEE8 000C7E08  4E 80 00 20 */	blr

.global cbForReadAsync
cbForReadAsync:
/* 800CBEEC 000C7E0C  7C 08 02 A6 */	mflr r0
/* 800CBEF0 000C7E10  90 01 00 04 */	stw r0, 4(r1)
/* 800CBEF4 000C7E14  94 21 FF F8 */	stwu r1, -8(r1)
/* 800CBEF8 000C7E18  81 84 00 38 */	lwz r12, 0x38(r4)
/* 800CBEFC 000C7E1C  28 0C 00 00 */	cmplwi r12, 0
/* 800CBF00 000C7E20  41 82 00 0C */	beq lbl_800CBF0C
/* 800CBF04 000C7E24  7D 88 03 A6 */	mtlr r12
/* 800CBF08 000C7E28  4E 80 00 21 */	blrl
lbl_800CBF0C:
/* 800CBF0C 000C7E2C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800CBF10 000C7E30  38 21 00 08 */	addi r1, r1, 8
/* 800CBF14 000C7E34  7C 08 03 A6 */	mtlr r0
/* 800CBF18 000C7E38  4E 80 00 20 */	blr

.global DVDOpenDir
DVDOpenDir:
/* 800CBF1C 000C7E3C  7C 08 02 A6 */	mflr r0
/* 800CBF20 000C7E40  90 01 00 04 */	stw r0, 4(r1)
/* 800CBF24 000C7E44  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800CBF28 000C7E48  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800CBF2C 000C7E4C  7C 9F 23 78 */	mr r31, r4
/* 800CBF30 000C7E50  4B FF F8 39 */	bl DVDConvertPathToEntrynum
/* 800CBF34 000C7E54  2C 03 00 00 */	cmpwi r3, 0
/* 800CBF38 000C7E58  41 80 00 2C */	blt lbl_800CBF64
/* 800CBF3C 000C7E5C  1C A3 00 0C */	mulli r5, r3, 0xc
/* 800CBF40 000C7E60  80 8D A1 D4 */	lwz r4, FstStart@sda21(r13)
/* 800CBF44 000C7E64  7C 04 28 2E */	lwzx r0, r4, r5
/* 800CBF48 000C7E68  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CBF4C 000C7E6C  40 82 00 0C */	bne lbl_800CBF58
/* 800CBF50 000C7E70  38 00 00 00 */	li r0, 0
/* 800CBF54 000C7E74  48 00 00 08 */	b lbl_800CBF5C
lbl_800CBF58:
/* 800CBF58 000C7E78  38 00 00 01 */	li r0, 1
lbl_800CBF5C:
/* 800CBF5C 000C7E7C  2C 00 00 00 */	cmpwi r0, 0
/* 800CBF60 000C7E80  40 82 00 0C */	bne lbl_800CBF6C
lbl_800CBF64:
/* 800CBF64 000C7E84  38 60 00 00 */	li r3, 0
/* 800CBF68 000C7E88  48 00 00 24 */	b lbl_800CBF8C
lbl_800CBF6C:
/* 800CBF6C 000C7E8C  90 7F 00 00 */	stw r3, 0(r31)
/* 800CBF70 000C7E90  38 03 00 01 */	addi r0, r3, 1
/* 800CBF74 000C7E94  38 60 00 01 */	li r3, 1
/* 800CBF78 000C7E98  90 1F 00 04 */	stw r0, 4(r31)
/* 800CBF7C 000C7E9C  80 0D A1 D4 */	lwz r0, FstStart@sda21(r13)
/* 800CBF80 000C7EA0  7C 80 2A 14 */	add r4, r0, r5
/* 800CBF84 000C7EA4  80 04 00 08 */	lwz r0, 8(r4)
/* 800CBF88 000C7EA8  90 1F 00 08 */	stw r0, 8(r31)
lbl_800CBF8C:
/* 800CBF8C 000C7EAC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800CBF90 000C7EB0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800CBF94 000C7EB4  38 21 00 18 */	addi r1, r1, 0x18
/* 800CBF98 000C7EB8  7C 08 03 A6 */	mtlr r0
/* 800CBF9C 000C7EBC  4E 80 00 20 */	blr

.global DVDReadDir
DVDReadDir:
/* 800CBFA0 000C7EC0  80 E3 00 04 */	lwz r7, 4(r3)
/* 800CBFA4 000C7EC4  80 03 00 00 */	lwz r0, 0(r3)
/* 800CBFA8 000C7EC8  7C 07 00 40 */	cmplw r7, r0
/* 800CBFAC 000C7ECC  40 81 00 10 */	ble lbl_800CBFBC
/* 800CBFB0 000C7ED0  80 03 00 08 */	lwz r0, 8(r3)
/* 800CBFB4 000C7ED4  7C 00 38 40 */	cmplw r0, r7
/* 800CBFB8 000C7ED8  41 81 00 0C */	bgt lbl_800CBFC4
lbl_800CBFBC:
/* 800CBFBC 000C7EDC  38 60 00 00 */	li r3, 0
/* 800CBFC0 000C7EE0  4E 80 00 20 */	blr
lbl_800CBFC4:
/* 800CBFC4 000C7EE4  90 E4 00 00 */	stw r7, 0(r4)
/* 800CBFC8 000C7EE8  1D 07 00 0C */	mulli r8, r7, 0xc
/* 800CBFCC 000C7EEC  80 AD A1 D4 */	lwz r5, FstStart@sda21(r13)
/* 800CBFD0 000C7EF0  7C 05 40 2E */	lwzx r0, r5, r8
/* 800CBFD4 000C7EF4  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CBFD8 000C7EF8  40 82 00 0C */	bne lbl_800CBFE4
/* 800CBFDC 000C7EFC  38 00 00 00 */	li r0, 0
/* 800CBFE0 000C7F00  48 00 00 08 */	b lbl_800CBFE8
lbl_800CBFE4:
/* 800CBFE4 000C7F04  38 00 00 01 */	li r0, 1
lbl_800CBFE8:
/* 800CBFE8 000C7F08  90 04 00 04 */	stw r0, 4(r4)
/* 800CBFEC 000C7F0C  80 AD A1 D4 */	lwz r5, FstStart@sda21(r13)
/* 800CBFF0 000C7F10  80 CD A1 D8 */	lwz r6, FstStringStart@sda21(r13)
/* 800CBFF4 000C7F14  7C 05 40 2E */	lwzx r0, r5, r8
/* 800CBFF8 000C7F18  54 00 02 3E */	clrlwi r0, r0, 8
/* 800CBFFC 000C7F1C  7C 06 02 14 */	add r0, r6, r0
/* 800CC000 000C7F20  90 04 00 08 */	stw r0, 8(r4)
/* 800CC004 000C7F24  80 8D A1 D4 */	lwz r4, FstStart@sda21(r13)
/* 800CC008 000C7F28  7C 04 40 2E */	lwzx r0, r4, r8
/* 800CC00C 000C7F2C  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800CC010 000C7F30  40 82 00 0C */	bne lbl_800CC01C
/* 800CC014 000C7F34  38 00 00 00 */	li r0, 0
/* 800CC018 000C7F38  48 00 00 08 */	b lbl_800CC020
lbl_800CC01C:
/* 800CC01C 000C7F3C  38 00 00 01 */	li r0, 1
lbl_800CC020:
/* 800CC020 000C7F40  2C 00 00 00 */	cmpwi r0, 0
/* 800CC024 000C7F44  41 82 00 10 */	beq lbl_800CC034
/* 800CC028 000C7F48  7C 84 42 14 */	add r4, r4, r8
/* 800CC02C 000C7F4C  80 04 00 08 */	lwz r0, 8(r4)
/* 800CC030 000C7F50  48 00 00 08 */	b lbl_800CC038
lbl_800CC034:
/* 800CC034 000C7F54  38 07 00 01 */	addi r0, r7, 1
lbl_800CC038:
/* 800CC038 000C7F58  90 03 00 04 */	stw r0, 4(r3)
/* 800CC03C 000C7F5C  38 60 00 01 */	li r3, 1
/* 800CC040 000C7F60  4E 80 00 20 */	blr

.global DVDCloseDir
DVDCloseDir:
/* 800CC044 000C7F64  38 60 00 01 */	li r3, 1
/* 800CC048 000C7F68  4E 80 00 20 */	blr

.global DVDPrepareStreamAsync
DVDPrepareStreamAsync:
/* 800CC04C 000C7F6C  7C 08 02 A6 */	mflr r0
/* 800CC050 000C7F70  90 01 00 04 */	stw r0, 4(r1)
/* 800CC054 000C7F74  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800CC058 000C7F78  BF 61 00 24 */	stmw r27, 0x24(r1)
/* 800CC05C 000C7F7C  3B A5 00 00 */	addi r29, r5, 0
/* 800CC060 000C7F80  7C 7B 1B 78 */	mr r27, r3
/* 800CC064 000C7F84  3B 84 00 00 */	addi r28, r4, 0
/* 800CC068 000C7F88  3B C6 00 00 */	addi r30, r6, 0
/* 800CC06C 000C7F8C  80 E3 00 30 */	lwz r7, 0x30(r3)
/* 800CC070 000C7F90  3C 60 80 1E */	lis r3, lbl_801E7590@ha
/* 800CC074 000C7F94  3B E3 75 90 */	addi r31, r3, lbl_801E7590@l
/* 800CC078 000C7F98  7C 07 EA 14 */	add r0, r7, r29
/* 800CC07C 000C7F9C  54 00 04 7F */	clrlwi. r0, r0, 0x11
/* 800CC080 000C7FA0  41 82 00 20 */	beq lbl_800CC0A0
/* 800CC084 000C7FA4  38 C7 00 00 */	addi r6, r7, 0
/* 800CC088 000C7FA8  4C C6 31 82 */	crclr 6
/* 800CC08C 000C7FAC  38 FD 00 00 */	addi r7, r29, 0
/* 800CC090 000C7FB0  38 BF 01 8C */	addi r5, r31, 0x18c
/* 800CC094 000C7FB4  38 6D 97 78 */	addi r3, r13, lbl_802F1958@sda21
/* 800CC098 000C7FB8  38 80 04 7E */	li r4, 0x47e
/* 800CC09C 000C7FBC  4B FF 7C 05 */	bl OSPanic
lbl_800CC0A0:
/* 800CC0A0 000C7FC0  28 1C 00 00 */	cmplwi r28, 0
/* 800CC0A4 000C7FC4  40 82 00 0C */	bne lbl_800CC0B0
/* 800CC0A8 000C7FC8  80 1B 00 34 */	lwz r0, 0x34(r27)
/* 800CC0AC 000C7FCC  7F 9D 00 50 */	subf r28, r29, r0
lbl_800CC0B0:
/* 800CC0B0 000C7FD0  57 80 04 7F */	clrlwi. r0, r28, 0x11
/* 800CC0B4 000C7FD4  41 82 00 1C */	beq lbl_800CC0D0
/* 800CC0B8 000C7FD8  38 DC 00 00 */	addi r6, r28, 0
/* 800CC0BC 000C7FDC  4C C6 31 82 */	crclr 6
/* 800CC0C0 000C7FE0  38 BF 01 F4 */	addi r5, r31, 0x1f4
/* 800CC0C4 000C7FE4  38 6D 97 78 */	addi r3, r13, lbl_802F1958@sda21
/* 800CC0C8 000C7FE8  38 80 04 88 */	li r4, 0x488
/* 800CC0CC 000C7FEC  4B FF 7B D5 */	bl OSPanic
lbl_800CC0D0:
/* 800CC0D0 000C7FF0  80 7B 00 34 */	lwz r3, 0x34(r27)
/* 800CC0D4 000C7FF4  7C 1D 18 40 */	cmplw r29, r3
/* 800CC0D8 000C7FF8  40 80 00 10 */	bge lbl_800CC0E8
/* 800CC0DC 000C7FFC  7C 1D E2 14 */	add r0, r29, r28
/* 800CC0E0 000C8000  7C 00 18 40 */	cmplw r0, r3
/* 800CC0E4 000C8004  40 81 00 20 */	ble lbl_800CC104
lbl_800CC0E8:
/* 800CC0E8 000C8008  38 DD 00 00 */	addi r6, r29, 0
/* 800CC0EC 000C800C  4C C6 31 82 */	crclr 6
/* 800CC0F0 000C8010  38 FC 00 00 */	addi r7, r28, 0
/* 800CC0F4 000C8014  38 BF 02 4C */	addi r5, r31, 0x24c
/* 800CC0F8 000C8018  38 6D 97 78 */	addi r3, r13, lbl_802F1958@sda21
/* 800CC0FC 000C801C  38 80 04 90 */	li r4, 0x490
/* 800CC100 000C8020  4B FF 7B A1 */	bl OSPanic
lbl_800CC104:
/* 800CC104 000C8024  93 DB 00 38 */	stw r30, 0x38(r27)
/* 800CC108 000C8028  3C 60 80 0D */	lis r3, cbForPrepareStreamAsync@ha
/* 800CC10C 000C802C  38 C3 C1 38 */	addi r6, r3, cbForPrepareStreamAsync@l
/* 800CC110 000C8030  80 1B 00 30 */	lwz r0, 0x30(r27)
/* 800CC114 000C8034  38 7B 00 00 */	addi r3, r27, 0
/* 800CC118 000C8038  38 9C 00 00 */	addi r4, r28, 0
/* 800CC11C 000C803C  7C A0 EA 14 */	add r5, r0, r29
/* 800CC120 000C8040  48 00 1D 69 */	bl DVDPrepareStreamAbsAsync
/* 800CC124 000C8044  BB 61 00 24 */	lmw r27, 0x24(r1)
/* 800CC128 000C8048  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800CC12C 000C804C  38 21 00 38 */	addi r1, r1, 0x38
/* 800CC130 000C8050  7C 08 03 A6 */	mtlr r0
/* 800CC134 000C8054  4E 80 00 20 */	blr

.global cbForPrepareStreamAsync
cbForPrepareStreamAsync:
/* 800CC138 000C8058  7C 08 02 A6 */	mflr r0
/* 800CC13C 000C805C  90 01 00 04 */	stw r0, 4(r1)
/* 800CC140 000C8060  94 21 FF F8 */	stwu r1, -8(r1)
/* 800CC144 000C8064  81 84 00 38 */	lwz r12, 0x38(r4)
/* 800CC148 000C8068  28 0C 00 00 */	cmplwi r12, 0
/* 800CC14C 000C806C  41 82 00 0C */	beq lbl_800CC158
/* 800CC150 000C8070  7D 88 03 A6 */	mtlr r12
/* 800CC154 000C8074  4E 80 00 21 */	blrl
lbl_800CC158:
/* 800CC158 000C8078  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800CC15C 000C807C  38 21 00 08 */	addi r1, r1, 8
/* 800CC160 000C8080  7C 08 03 A6 */	mtlr r0
/* 800CC164 000C8084  4E 80 00 20 */	blr

.section .data

.global lbl_801E7590
lbl_801E7590:
	# ROM: 0x1E4590
glabel string_DVDConvertEntrynumToPath_possibly_DVDOpen_or_DVDChangeDir_or_DVDOpenDir___specified_directory_or_file___s__doesn_t_match_standard_8_3_format__This_is_a_temporary_restriction_and_will_be_removed_soon_n
	.asciz "DVDConvertEntrynumToPath(possibly DVDOpen or DVDChangeDir or DVDOpenDir): specified directory or file (%s) doesn't match standard 8.3 format. This is a temporary restriction and will be removed soon\n"

.global lbl_801E7658
lbl_801E7658:
	# ROM: 0x1E4658
glabel string_Warning__DVDOpen____file___s__was_not_found_under__s__n
	.asciz "Warning: DVDOpen(): file '%s' was not found under %s.\n"
	.balign 4

.global lbl_801E7690
lbl_801E7690:
	# ROM: 0x1E4690
glabel string_DVDReadAsync____specified_area_is_out_of_the_file__
	.asciz "DVDReadAsync(): specified area is out of the file  "
glabel string_DVDRead____specified_area_is_out_of_the_file__
	.asciz "DVDRead(): specified area is out of the file  "
	.balign 4
glabel string_DVDSeek____offset_is_out_of_the_file__
	.asciz "DVDSeek(): offset is out of the file  "
	.balign 4
glabel string_DVDPrepareStreamAsync____Specified_start_address__filestart_0x_x____offset_0x_x___is_not_32KB_aligned
	.asciz "DVDPrepareStreamAsync(): Specified start address (filestart(0x%x) + offset(0x%x)) is not 32KB aligned"
	.balign 4
glabel string_DVDPrepareStreamAsync____Specified_length__0x_x__is_not_a_multiple_of_32768_32_1024_
	.asciz "DVDPrepareStreamAsync(): Specified length (0x%x) is not a multiple of 32768(32*1024)"
	.balign 4
glabel string_DVDPrepareStreamAsync____The_area_specified__offset_0x_x___length_0x_x___is_out_of_the_file
	.asciz "DVDPrepareStreamAsync(): The area specified (offset(0x%x), length(0x%x)) is out of the file"
glabel string_DVDPrepareStream____Specified_start_address__filestart_0x_x____offset_0x_x___is_not_32KB_aligned
	.asciz "DVDPrepareStream(): Specified start address (filestart(0x%x) + offset(0x%x)) is not 32KB aligned"
	.balign 4
glabel string_DVDPrepareStream____Specified_length__0x_x__is_not_a_multiple_of_32768_32_1024_
	.asciz "DVDPrepareStream(): Specified length (0x%x) is not a multiple of 32768(32*1024)"
glabel string_DVDPrepareStream____The_area_specified__offset_0x_x___length_0x_x___is_out_of_the_file
	.asciz "DVDPrepareStream(): The area specified (offset(0x%x), length(0x%x)) is out of the file"
	.balign 4
	.4byte 0
