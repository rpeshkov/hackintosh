/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-3-OptTabl.aml, Wed Dec 20 01:20:43 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000011E1 (4577)
 *     Revision         0x01
 *     Checksum         0x51
 *     OEM ID           "OptRef"
 *     OEM Table ID     "OptTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20091112 (537465106)
 */
DefinitionBlock ("", "SSDT", 1, "OptRef", "OptTabl", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0._DSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.LPCB.H_EC.OPST, FieldUnitObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP.SGOF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGON, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGST, MethodObj)    // 0 Arguments
    External (DID1, FieldUnitObj)
    External (DID2, FieldUnitObj)
    External (DID3, FieldUnitObj)
    External (DID4, FieldUnitObj)
    External (DID5, FieldUnitObj)
    External (DID6, FieldUnitObj)
    External (DID7, FieldUnitObj)
    External (DID8, FieldUnitObj)
    External (EBAS, FieldUnitObj)
    External (ECON, FieldUnitObj)
    External (NVGA, FieldUnitObj)
    External (NVHA, FieldUnitObj)
    External (NXD1, FieldUnitObj)
    External (NXD2, FieldUnitObj)
    External (NXD3, FieldUnitObj)
    External (NXD4, FieldUnitObj)
    External (NXD5, FieldUnitObj)
    External (NXD6, FieldUnitObj)
    External (NXD7, FieldUnitObj)
    External (NXD8, FieldUnitObj)
    External (SOPD, FieldUnitObj)
    External (SSSD, FieldUnitObj)

    Scope (\_SB.PCI0)
    {
        Name (OTM, "OTMACPI 2010-Mar-09 12:08:26")
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        OperationRegion (NVHM, SystemMemory, NVHA, 0x00010400)
        Field (NVHM, AnyAcc, NoLock, Preserve)
        {
            NVSG,   128, 
            NVSZ,   32, 
            NVVR,   32, 
            NVHO,   32, 
            RVBS,   32, 
            RBF1,   262144, 
            RBF2,   262144, 
            MXML,   32, 
            MXM3,   1600
        }

        Name (OPCE, 0x02)
        Name (OPTF, Zero)
        Name (DGPS, Zero)
        Name (_PSC, Zero)  // _PSC: Power State Current
        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            Store (Zero, _PSC)
            If (LNotEqual (DGPS, Zero))
            {
                _ON ()
                Store (Zero, DGPS)
            }
        }

        Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
        {
            Store (One, _PSC)
        }

        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
        {
            If (LEqual (OPCE, 0x03))
            {
                If (LEqual (DGPS, Zero))
                {
                    _OFF ()
                    Store (One, DGPS)
                }

                Store (0x02, OPCE)
            }

            Store (0x03, _PSC)
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LGreater (Local1, 0x1000))
            {
                Store (0x1000, Local1)
            }

            If (LGreater (Local0, 0x00010000))
            {
                Return (Buffer (Local1)
                {
                     0x00                                           
                })
            }

            Multiply (Local1, 0x08, Local3)
            Name (ROM1, Buffer (0x8000)
            {
                 0x00                                           
            })
            Name (ROM2, Buffer (Local1)
            {
                 0x00                                           
            })
            If (LLess (Local0, 0x8000))
            {
                Store (RBF1, ROM1)
            }
            Else
            {
                Subtract (Local0, 0x8000, Local0)
                Store (RBF2, ROM1)
            }

            Multiply (Local0, 0x08, Local2)
            CreateField (ROM1, Local2, Local3, TMPB)
            Store (TMPB, ROM2)
            Return (ROM2)
        }

        Method (HDSM, 4, Serialized)
        {
            Return (0x80000001)
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            CreateByteField (Arg0, 0x03, GUID)
            Return (\_SB.PCI0.GFX0.HDSM (Arg0, Arg1, Arg2, Arg3))
        }

        OperationRegion (BPCI, SystemMemory, EBAS, 0x1000)
        Field (BPCI, ByteAcc, NoLock, Preserve)
        {
            Offset (0x04), 
            PCIC,   32, 
            Offset (0x10), 
            GMM1,   32, 
            GMM2,   32, 
            Offset (0x1C), 
            GMM3,   32, 
            Offset (0x24), 
            GIO1,   32, 
            Offset (0x3C), 
            GIRQ,   32, 
            SID,    32, 
            Offset (0x488), 
                ,   25, 
            NHDM,   1
        }

        Name (BUFF, Buffer (0x20) {})
        CreateDWordField (BUFF, Zero, BUF1)
        CreateDWordField (BUFF, One, BUF2)
        CreateDWordField (BUFF, 0x02, BUF3)
        CreateDWordField (BUFF, 0x03, BUF4)
        CreateDWordField (BUFF, 0x04, BUF5)
        CreateDWordField (BUFF, 0x05, BUF6)
        CreateDWordField (BUFF, 0x06, BUF7)
        CreateDWordField (BUFF, 0x07, BUF8)
        Method (_ON, 0, Serialized)  // _ON_: Power On
        {
            SGON ()
            Store (BUF1, PCIC)
            Store (BUF2, GMM1)
            Store (BUF3, GMM2)
            Store (BUF4, GMM3)
            Store (BUF5, GIO1)
            Store (BUF6, GIRQ)
            Store (BUF7, SID)
            Sleep (0x64)
            Store (Zero, NHDM)
            If (LEqual (\ECON, One))
            {
                Store (One, \_SB.PCI0.LPCB.H_EC.OPST)
            }
        }

        Method (_OFF, 0, Serialized)  // _OFF: Power Off
        {
            Store (PCIC, BUF1)
            Store (GMM1, BUF2)
            Store (GMM2, BUF3)
            Store (GMM3, BUF4)
            Store (GIO1, BUF5)
            Store (GIRQ, BUF6)
            Store (SID, BUF7)
            SGOF ()
            If (LEqual (\ECON, One))
            {
                Store (Zero, \_SB.PCI0.LPCB.H_EC.OPST)
            }
        }
    }

    Scope (\_SB.PCI0.GFX0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (DID1, Index (TLPK, Zero))
            Store (DID2, Index (TLPK, 0x02))
            Store (DID3, Index (TLPK, 0x04))
            Store (DID4, Index (TLPK, 0x06))
            Store (DID5, Index (TLPK, 0x08))
            Store (DID6, Index (TLPK, 0x0A))
            Store (DID7, Index (TLPK, 0x0C))
            Store (DID2, Index (TLPK, 0x0E))
            Store (DID1, Index (TLPK, 0x0F))
            Store (DID2, Index (TLPK, 0x11))
            Store (DID3, Index (TLPK, 0x12))
            Store (DID2, Index (TLPK, 0x14))
            Store (DID4, Index (TLPK, 0x15))
            Store (DID2, Index (TLPK, 0x17))
            Store (DID5, Index (TLPK, 0x18))
            Store (DID2, Index (TLPK, 0x1A))
            Store (DID6, Index (TLPK, 0x1B))
            Store (DID2, Index (TLPK, 0x1D))
            Store (DID7, Index (TLPK, 0x1E))
        }

        OperationRegion (NVIG, SystemMemory, NVGA, 0x0400)
        Field (NVIG, AnyAcc, NoLock, Preserve)
        {
            NISG,   128, 
            NISZ,   32, 
            NIVR,   32, 
            GPSS,   32, 
            GACD,   16, 
            GATD,   16, 
            LDES,   8, 
            DKST,   8, 
            DACE,   8, 
            DHPE,   8, 
            DHPS,   8, 
            SGNC,   8, 
            GPPO,   8, 
            USPM,   8, 
            GPSP,   8, 
            TLSN,   8, 
            DOSF,   8, 
            ELCL,   16
        }

        Name (TLPK, Package (0x20)
        {
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C
        })
        Method (INDL, 0, Serialized)
        {
            Store (Zero, NXD1)
            Store (Zero, NXD2)
            Store (Zero, NXD3)
            Store (Zero, NXD4)
            Store (Zero, NXD5)
            Store (Zero, NXD6)
            Store (Zero, NXD7)
            Store (Zero, NXD8)
        }

        Method (SND1, 1, Serialized)
        {
            If (LEqual (Arg0, DID1))
            {
                Store (One, NXD1)
            }

            If (LEqual (Arg0, DID2))
            {
                Store (One, NXD2)
            }

            If (LEqual (Arg0, DID3))
            {
                Store (One, NXD3)
            }

            If (LEqual (Arg0, DID4))
            {
                Store (One, NXD4)
            }

            If (LEqual (Arg0, DID5))
            {
                Store (One, NXD5)
            }

            If (LEqual (Arg0, DID6))
            {
                Store (One, NXD6)
            }

            If (LEqual (Arg0, DID7))
            {
                Store (One, NXD7)
            }

            If (LEqual (Arg0, DID8))
            {
                Store (One, NXD8)
            }
        }

        Method (SNXD, 1, Serialized)
        {
            INDL ()
            Store (One, Local0)
            Store (Zero, Local1)
            While (LLess (Local0, Arg0))
            {
                If (LEqual (DerefOf (Index (TLPK, Local1)), 0x2C))
                {
                    Increment (Local0)
                }

                Increment (Local1)
            }

            SND1 (DerefOf (Index (TLPK, Local1)))
            Increment (Local1)
            If (LNotEqual (DerefOf (Index (TLPK, Local1)), 0x2C))
            {
                SND1 (DerefOf (Index (TLPK, Local1)))
            }
        }

        Method (CTOI, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            While (One)
            {
                Store (ToInteger (Arg0), _T_0)
                If (LEqual (_T_0, One))
                {
                    Return (One)
                }
                ElseIf (LEqual (_T_0, 0x02))
                {
                    Return (0x02)
                }
                ElseIf (LEqual (_T_0, 0x04))
                {
                    Return (0x03)
                }
                ElseIf (LEqual (_T_0, 0x08))
                {
                    Return (0x04)
                }
                ElseIf (LEqual (_T_0, 0x10))
                {
                    Return (0x05)
                }
                ElseIf (LEqual (_T_0, 0x20))
                {
                    Return (0x06)
                }
                ElseIf (LEqual (_T_0, 0x40))
                {
                    Return (0x07)
                }
                ElseIf (LEqual (_T_0, 0x03))
                {
                    Return (0x08)
                }
                ElseIf (LEqual (_T_0, 0x06))
                {
                    Return (0x09)
                }
                ElseIf (LEqual (_T_0, 0x0A))
                {
                    Return (0x0A)
                }
                ElseIf (LEqual (_T_0, 0x12))
                {
                    Return (0x0B)
                }
                ElseIf (LEqual (_T_0, 0x22))
                {
                    Return (0x0C)
                }
                ElseIf (LEqual (_T_0, 0x42))
                {
                    Return (0x0D)
                }
                Else
                {
                    Return (One)
                }

                Break
            }
        }

        Method (HDSM, 4, Serialized)
        {
            Name (SGCI, Zero)
            Name (NBCI, Zero)
            Name (OPCI, Zero)
            If (LEqual (Arg0, ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0")))
            {
                Store (One, OPCI)
            }

            If (LOr (OPCI, LOr (SGCI, NBCI)))
            {
                If (OPCI)
                {
                    If (LNotEqual (Arg1, 0x0100))
                    {
                        Return (0x80000002)
                    }
                }
                ElseIf (LNotEqual (Arg1, 0x0102))
                {
                    Return (0x80000002)
                }

                If (LEqual (Arg2, Zero))
                {
                    If (SGCI)
                    {
                        Return (Buffer (0x04)
                        {
                             0x7F, 0x00, 0x04, 0x00                         
                        })
                    }
                    ElseIf (NBCI)
                    {
                        Return (Buffer (0x04)
                        {
                             0x73, 0x00, 0x04, 0x00                         
                        })
                    }
                    ElseIf (OPCI)
                    {
                        Return (Buffer (0x04)
                        {
                             0x61, 0x18, 0x03, 0x0C                         
                        })
                    }
                }

                If (LEqual (Arg2, One))
                {
                    Name (TEMP, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TEMP, Zero, STS0)
                    If (SGCI)
                    {
                        Or (STS0, 0x0B0000BF, STS0)
                        Or (STS0, ShiftLeft (SGNC, 0x08, SGNC), STS0)
                    }
                    Else
                    {
                        Or (STS0, Zero, STS0)
                    }

                    Return (TEMP)
                }

                If (LEqual (Arg2, 0x02))
                {
                    Name (TMP1, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP1, Zero, STS1)
                    ToInteger (Arg3, Local0)
                    And (Local0, 0x1F, Local0)
                    If (And (Local0, 0x10))
                    {
                        And (Local0, 0x0F, Local0)
                        Store (Local0, GPSS)
                        Notify (\_SB.PCI0.GFX0, 0xD9)
                        Notify (\_SB.PCI0.WMI1, 0xD9)
                    }
                    Else
                    {
                        And (Local0, 0x0F, Local0)
                        If (LEqual (GPPO, One))
                        {
                            Store (GPSS, Local0)
                            Or (Local0, 0x10, Local0)
                            Store (Zero, GPPO)
                        }
                    }

                    Or (STS1, Local0, STS1)
                    Return (TMP1)
                }

                If (LEqual (Arg2, 0x03))
                {
                    Name (TMP2, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP2, Zero, STS2)
                    ToInteger (Arg3, Local0)
                    And (Local0, 0x03, Local0)
                    If (LEqual (Local0, Zero))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGST ()
                    }

                    If (LEqual (Local0, One))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGON ()
                    }

                    If (LEqual (Local0, 0x02))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGOF ()
                    }

                    If (LEqual (\_SB.PCI0.PEG0.PEGP.SGST (), 0x0F))
                    {
                        Or (STS2, One, STS2)
                    }

                    Return (TMP2)
                }

                If (LEqual (Arg2, 0x04))
                {
                    Name (TMP3, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP3, Zero, STS3)
                    ToInteger (Arg3, Local0)
                    Store (Local0, Local1)
                    ShiftRight (Local0, 0x10, Local0)
                    And (Local0, One, USPM)
                    ShiftRight (Local1, 0x0D, Local1)
                    And (Local1, 0x03, Local1)
                    If (LNotEqual (Local1, GPSP))
                    {
                        If (LEqual (USPM, One))
                        {
                            Store (Local1, GPSP)
                        }
                        Else
                        {
                            Store (GPSP, Local1)
                            Or (STS3, 0x8000, STS3)
                        }
                    }

                    Or (STS3, ShiftLeft (Local1, 0x0D), STS3)
                    Return (TMP3)
                }

                If (LEqual (Arg2, 0x05))
                {
                    Name (TMP4, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP4, Zero, STS4)
                    ToInteger (Arg3, Local0)
                    If (And (Local0, 0x80000000))
                    {
                        Store (And (ShiftRight (Local0, 0x19), 0x1F), TLSN)
                        If (And (Local0, 0x40000000))
                        {
                            Store (One, DOSF)
                        }
                    }

                    If (And (Local0, 0x01000000))
                    {
                        Store (And (ShiftRight (Local0, 0x0C), 0x0FFF), GACD)
                        Store (And (Local0, 0x0FFF), GATD)
                        Store (CTOI (GACD), TLSN)
                        Increment (TLSN)
                        If (LGreater (TLSN, 0x0D))
                        {
                            Store (One, TLSN)
                        }

                        SNXD (TLSN)
                    }

                    Or (STS4, ShiftLeft (DHPE, 0x15), STS4)
                    Or (STS4, ShiftLeft (DHPS, 0x14), STS4)
                    Or (STS4, ShiftLeft (TLSN, 0x08), STS4)
                    Or (STS4, ShiftLeft (DKST, 0x05), STS4)
                    Or (STS4, ShiftLeft (LDES, 0x04), STS4)
                    Or (STS4, DACE, STS4)
                    Store (Zero, LDES)
                    Store (Zero, DHPS)
                    Store (Zero, DHPE)
                    Store (Zero, DACE)
                    Return (TMP4)
                }

                If (LEqual (Arg2, 0x06))
                {
                    Return (TLPK)
                }

                If (LEqual (Arg2, 0x10))
                {
                    CreateWordField (Arg3, 0x02, USRG)
                    Name (OPVK, Buffer (0xE6)
                    {
                        /* 0000 */  0xE4, 0x42, 0x5F, 0x14, 0x36, 0x26, 0x16, 0x37,
                        /* 0008 */  0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00,
                        /* 0010 */  0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35,
                        /* 0018 */  0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75,
                        /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,
                        /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,
                        /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74,
                        /* 0038 */  0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61,
                        /* 0040 */  0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65,
                        /* 0048 */  0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66,
                        /* 0050 */  0x6F, 0x72, 0x20, 0x37, 0x33, 0x36, 0x30, 0x31,
                        /* 0058 */  0x39, 0x5F, 0x4D, 0x49, 0x52, 0x63, 0x20, 0x20,
                        /* 0060 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
                        /* 0068 */  0x2D, 0x20, 0x3C, 0x34, 0x27, 0x21, 0x58, 0x29,
                        /* 0070 */  0x57, 0x27, 0x58, 0x20, 0x27, 0x25, 0x59, 0x5D,
                        /* 0078 */  0x31, 0x29, 0x3A, 0x2A, 0x26, 0x39, 0x59, 0x43,
                        /* 0080 */  0x56, 0x3B, 0x58, 0x56, 0x58, 0x3D, 0x59, 0x4E,
                        /* 0088 */  0x3B, 0x3A, 0x35, 0x44, 0x25, 0x42, 0x5A, 0x48,
                        /* 0090 */  0x55, 0x3A, 0x58, 0x4C, 0x25, 0x48, 0x54, 0x21,
                        /* 0098 */  0x35, 0x4B, 0x4D, 0x37, 0x2C, 0x3C, 0x20, 0x2D,
                        /* 00A0 */  0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67,
                        /* 00A8 */  0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20,
                        /* 00B0 */  0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43,
                        /* 00B8 */  0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69,
                        /* 00C0 */  0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,
                        /* 00C8 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,
                        /* 00D0 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31,
                        /* 00D8 */  0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36,
                        /* 00E0 */  0x39, 0x38, 0x35, 0x28, 0x52, 0x29             
                    })
                    Name (VLVK, Buffer (0xE6)
                    {
                        /* 0000 */  0x7D, 0x52, 0x73, 0xD4, 0x5B, 0x60, 0x86, 0x32,
                        /* 0008 */  0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00,
                        /* 0010 */  0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35,
                        /* 0018 */  0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75,
                        /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,
                        /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,
                        /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74,
                        /* 0038 */  0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61,
                        /* 0040 */  0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65,
                        /* 0048 */  0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66,
                        /* 0050 */  0x6F, 0x72, 0x20, 0x62, 0x75, 0x67, 0x20, 0x37,
                        /* 0058 */  0x36, 0x31, 0x38, 0x38, 0x37, 0x20, 0x20, 0x20,
                        /* 0060 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
                        /* 0068 */  0x2D, 0x20, 0x5E, 0x41, 0x20, 0x2D, 0x47, 0x43,
                        /* 0070 */  0x3D, 0x30, 0x2D, 0x23, 0x45, 0x34, 0x52, 0x28,
                        /* 0078 */  0x46, 0x2F, 0x2F, 0x4A, 0x32, 0x30, 0x5B, 0x31,
                        /* 0080 */  0x32, 0x46, 0x3E, 0x54, 0x55, 0x53, 0x40, 0x51,
                        /* 0088 */  0x36, 0x36, 0x39, 0x34, 0x3F, 0x29, 0x2B, 0x41,
                        /* 0090 */  0x2B, 0x56, 0x4C, 0x51, 0x25, 0x39, 0x33, 0x56,
                        /* 0098 */  0x25, 0x52, 0x44, 0x39, 0x59, 0x2B, 0x20, 0x2D,
                        /* 00A0 */  0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67,
                        /* 00A8 */  0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20,
                        /* 00B0 */  0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43,
                        /* 00B8 */  0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69,
                        /* 00C0 */  0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,
                        /* 00C8 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,
                        /* 00D0 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31,
                        /* 00D8 */  0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36,
                        /* 00E0 */  0x39, 0x38, 0x35, 0x28, 0x52, 0x29             
                    })
                    Name (VGVK, Buffer (0xE6)
                    {
                        /* 0000 */  0x97, 0x0A, 0x47, 0xB9, 0x5F, 0xB8, 0x29, 0x89,
                        /* 0008 */  0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00,
                        /* 0010 */  0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35,
                        /* 0018 */  0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75,
                        /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,
                        /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,
                        /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74,
                        /* 0038 */  0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61,
                        /* 0040 */  0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65,
                        /* 0048 */  0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66,
                        /* 0050 */  0x6F, 0x72, 0x20, 0x76, 0x65, 0x79, 0x72, 0x6F,
                        /* 0058 */  0x6E, 0x20, 0x31, 0x31, 0x36, 0x20, 0x62, 0x75,
                        /* 0060 */  0x67, 0x20, 0x37, 0x36, 0x36, 0x31, 0x37, 0x20,
                        /* 0068 */  0x2D, 0x20, 0x5F, 0x42, 0x21, 0x2A, 0x48, 0x42,
                        /* 0070 */  0x3E, 0x31, 0x2C, 0x2C, 0x46, 0x35, 0x51, 0x29,
                        /* 0078 */  0x49, 0x2E, 0x20, 0x4B, 0x33, 0x31, 0x5C, 0x30,
                        /* 0080 */  0x30, 0x47, 0x21, 0x55, 0x56, 0x5C, 0x47, 0x52,
                        /* 0088 */  0x39, 0x31, 0x38, 0x35, 0x38, 0x28, 0x2C, 0x42,
                        /* 0090 */  0x29, 0x22, 0x4F, 0x52, 0x26, 0x3A, 0x32, 0x57,
                        /* 0098 */  0x24, 0x5D, 0x45, 0x3A, 0x5A, 0x2C, 0x20, 0x2D,
                        /* 00A0 */  0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67,
                        /* 00A8 */  0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20,
                        /* 00B0 */  0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43,
                        /* 00B8 */  0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69,
                        /* 00C0 */  0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,
                        /* 00C8 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,
                        /* 00D0 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31,
                        /* 00D8 */  0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36,
                        /* 00E0 */  0x39, 0x38, 0x35, 0x28, 0x52, 0x29             
                    })
                    Name (JLVK, Buffer (0xE6)
                    {
                        /* 0000 */  0xFB, 0x0B, 0x7F, 0x26, 0xE2, 0xF8, 0x7E, 0xAE,
                        /* 0008 */  0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00,
                        /* 0010 */  0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35,
                        /* 0018 */  0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75,
                        /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,
                        /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,
                        /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74,
                        /* 0038 */  0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61,
                        /* 0040 */  0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65,
                        /* 0048 */  0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66,
                        /* 0050 */  0x6F, 0x72, 0x20, 0x6A, 0x69, 0x6E, 0x6D, 0x61,
                        /* 0058 */  0x6F, 0x20, 0x71, 0x20, 0x62, 0x75, 0x67, 0x20,
                        /* 0060 */  0x37, 0x36, 0x35, 0x30, 0x34, 0x35, 0x20, 0x20,
                        /* 0068 */  0x2D, 0x20, 0x53, 0x46, 0x25, 0x56, 0x4C, 0x46,
                        /* 0070 */  0x22, 0x3D, 0x50, 0x28, 0x42, 0x31, 0x55, 0x2D,
                        /* 0078 */  0x4D, 0x5A, 0x24, 0x30, 0x37, 0x3D, 0x40, 0x34,
                        /* 0080 */  0x34, 0x43, 0x25, 0x51, 0x52, 0x58, 0x4B, 0x56,
                        /* 0088 */  0x3D, 0x4D, 0x3C, 0x39, 0x45, 0x34, 0x50, 0x4E,
                        /* 0090 */  0x36, 0x59, 0x32, 0x5E, 0x22, 0x47, 0x36, 0x5B,
                        /* 0098 */  0x28, 0x29, 0x49, 0x3E, 0x5E, 0x20, 0x20, 0x2D,
                        /* 00A0 */  0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67,
                        /* 00A8 */  0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20,
                        /* 00B0 */  0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43,
                        /* 00B8 */  0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69,
                        /* 00C0 */  0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,
                        /* 00C8 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,
                        /* 00D0 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31,
                        /* 00D8 */  0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36,
                        /* 00E0 */  0x39, 0x38, 0x35, 0x28, 0x52, 0x29             
                    })
                    If (LEqual (USRG, 0x564B))
                    {
                        If (LEqual (SSSD, 0xC0A5))
                        {
                            If (LEqual (SOPD, 0x0DF4))
                            {
                                Return (VGVK)
                            }

                            If (LEqual (SOPD, 0x0DEC))
                            {
                                Return (VLVK)
                            }
                        }

                        If (LEqual (SSSD, 0xC0AE))
                        {
                            If (LEqual (SOPD, 0x0DEC))
                            {
                                Return (JLVK)
                            }
                        }

                        Return (OPVK)
                    }

                    Return (Zero)
                }

                If (LEqual (Arg2, 0x11))
                {
                    Return (Zero)
                }

                If (LEqual (Arg2, 0x12))
                {
                    Return (Package (0x0A)
                    {
                        0xD0, 
                        ToUUID ("921a2f40-0dc4-402d-ac18-b48444ef9ed2"), 
                        0xD9, 
                        ToUUID ("c12ad361-9fa9-4c74-901f-95cb0945cf3e"), 
                        0xDB, 
                        ToUUID ("42848006-8886-490e-8c72-2bdca93a8a09"), 
                        0xEF, 
                        ToUUID ("b3e485d2-3cc1-4b54-8f31-77ba2fdc9ebe"), 
                        0xF0, 
                        ToUUID ("360d6fb6-1d4e-4fa6-b848-1be33dd8ec7b")
                    })
                }

                If (LEqual (Arg2, 0x1A))
                {
                    CreateField (Arg3, 0x18, 0x02, OMPR)
                    CreateField (Arg3, Zero, One, FLCH)
                    If (ToInteger (FLCH))
                    {
                        Store (OMPR, \_SB.PCI0.PEG0.PEGP.OPCE)
                    }

                    Store (Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                         
                        }, Local0)
                    CreateField (Local0, Zero, One, OPEN)
                    CreateField (Local0, 0x03, 0x02, CGCS)
                    CreateField (Local0, 0x06, One, SHPC)
                    CreateField (Local0, 0x18, 0x03, DGPC)
                    CreateField (Local0, 0x1B, 0x02, HDAC)
                    Store (One, OPEN)
                    Store (One, SHPC)
                    Store (One, HDAC)
                    Store (One, DGPC)
                    If (LNotEqual (\_SB.PCI0.PEG0.PEGP.SGST (), Zero))
                    {
                        Store (0x03, CGCS)
                    }

                    Return (Local0)
                }

                If (LEqual (Arg2, 0x1B))
                {
                    Store (Arg3, Local0)
                    CreateField (Local0, Zero, One, OPFL)
                    CreateField (Local0, One, One, OPVL)
                    If (ToInteger (OPVL))
                    {
                        Store (Zero, \_SB.PCI0.PEG0.PEGP.OPTF)
                        If (ToInteger (OPFL))
                        {
                            Store (One, \_SB.PCI0.PEG0.PEGP.OPTF)
                        }
                    }

                    Store (\_SB.PCI0.PEG0.PEGP.OPTF, Local0)
                    Return (Local0)
                }

                Return (0x80000002)
            }

            Return (\_SB.PCI0.PEG0.PEGP.HDSM (Arg0, Arg1, Arg2, Arg3))
        }
    }

    Scope (\_SB.PCI0)
    {
        Device (WMI1)
        {
            Name (_HID, "pnp0c14")  // _HID: Hardware ID
            Name (_UID, "OPT1")  // _UID: Unique ID
            Name (_WDG, Buffer (0x14)
            {
                /* 0000 */  0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E,
                /* 0008 */  0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0,
                /* 0010 */  0x4D, 0x58, 0x01, 0x02                         
            })
            Method (WMMX, 3, NotSerialized)
            {
                CreateDWordField (Arg2, Zero, FUNC)
                If (LEqual (FUNC, 0x534F525F))
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x08))
                    {
                        CreateDWordField (Arg2, 0x04, ARGS)
                        CreateDWordField (Arg2, 0x08, XARG)
                        Return (\_SB.PCI0.PEG0.PEGP._ROM (ARGS, XARG))
                    }
                }

                If (LEqual (FUNC, 0x4D53445F))
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x1C))
                    {
                        CreateField (Arg2, Zero, 0x80, MUID)
                        CreateDWordField (Arg2, 0x10, REVI)
                        CreateDWordField (Arg2, 0x14, SFNC)
                        CreateField (Arg2, 0xE0, 0x20, XRG0)
                        If (CondRefOf (\_SB.PCI0.GFX0._DSM))
                        {
                            Return (\_SB.PCI0.GFX0._DSM (MUID, REVI, SFNC, XRG0))
                        }
                    }
                }

                Return (Zero)
            }
        }
    }
}

