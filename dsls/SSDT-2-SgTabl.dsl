/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-2-SgTabl.aml, Wed Dec 20 01:20:43 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000D80 (3456)
 *     Revision         0x01
 *     Checksum         0x1F
 *     OEM ID           "SgRef"
 *     OEM Table ID     "SgTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20091112 (537465106)
 */
DefinitionBlock ("", "SSDT", 1, "SgRef", "SgTabl", 0x00001000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)
    External (_SB_.PCI0.IGPU._DOD, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD01._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD01._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD02._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD02._BCL, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD02._BCM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.IGPU.DD02._BQC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD02._DCS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD02._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD03._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD03._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD04._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD04._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD05._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD05._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD06._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD06._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD07._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD07._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD08._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DD08._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.DDL2, FieldUnitObj)
    External (_SB_.PCI0.IGPU.DDL3, FieldUnitObj)
    External (_SB_.PCI0.IGPU.DDL4, FieldUnitObj)
    External (_SB_.PCI0.IGPU.DDL5, FieldUnitObj)
    External (_SB_.PCI0.IGPU.DDL6, FieldUnitObj)
    External (_SB_.PCI0.IGPU.DDL7, FieldUnitObj)
    External (_SB_.PCI0.IGPU.DDL8, FieldUnitObj)
    External (_SB_.PCI0.IGPU.DIDL, FieldUnitObj)
    External (_SB_.PCI0.IGPU.HDSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.IGPU.SDDL, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP._ADR, IntObj)
    External (DID1, FieldUnitObj)
    External (DID2, FieldUnitObj)
    External (DID3, FieldUnitObj)
    External (DID4, FieldUnitObj)
    External (DID5, FieldUnitObj)
    External (DID6, FieldUnitObj)
    External (DID7, FieldUnitObj)
    External (DID8, FieldUnitObj)
    External (EECP, FieldUnitObj)
    External (GBAS, FieldUnitObj)
    External (GPRW, MethodObj)    // 2 Arguments
    External (HLRS, FieldUnitObj)
    External (MXD1, FieldUnitObj)
    External (MXD2, FieldUnitObj)
    External (MXD3, FieldUnitObj)
    External (MXD4, FieldUnitObj)
    External (MXD5, FieldUnitObj)
    External (MXD6, FieldUnitObj)
    External (MXD7, FieldUnitObj)
    External (MXD8, FieldUnitObj)
    External (NDID, FieldUnitObj)
    External (PWEN, FieldUnitObj)
    External (PWOK, FieldUnitObj)
    External (SGFL, FieldUnitObj)
    External (SGMD, FieldUnitObj)
    External (XBAS, FieldUnitObj)

    Scope (\_SB.PCI0.IGPU)
    {
        Method (MXVL, 1, Serialized)
        {
            Name (TMP0, Buffer (0x04)
            {
                 0x00                                           
            })
            CreateByteField (TMP0, Zero, DTYP)
            CreateByteField (TMP0, One, DDSP)
            CreateByteField (TMP0, 0x02, DAUX)
            CreateByteField (TMP0, 0x03, DHPD)
            Store (Arg0, DTYP)
            ShiftRight (Arg0, 0x08, DDSP)
            ShiftRight (Arg0, 0x10, DAUX)
            ShiftRight (Arg0, 0x18, DHPD)
            Return (TMP0)
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg0, ToUUID ("7ed873d3-c2d0-4e4f-a854-0f1317b01c2c")))
            {
                If (LEqual (Arg2, Zero))
                {
                    Name (DRET, Buffer (0x04)
                    {
                         0x00                                           
                    })
                    CreateWordField (DRET, Zero, F0SS)
                    CreateByteField (DRET, 0x03, TPVE)
                    Store (One, F0SS)
                    If (LEqual (And (SGMD, 0x0F), One))
                    {
                        Store (0x03, F0SS)
                    }
                    Else
                    {
                        Store (One, F0SS)
                    }

                    If (And (SGMD, 0x80))
                    {
                        Store (0x80, TPVE)
                    }

                    Return (DRET)
                }

                If (LEqual (Arg2, One))
                {
                    Name (MXIF, Package (0x0A)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }, 

                        Package (0x02)
                        {
                            Zero, 
                            Buffer (0x04)
                            {
                                 0x00                                           
                            }
                        }
                    })
                    Store (NDID, Index (MXIF, Zero))
                    Store (DID1, Index (DerefOf (Index (MXIF, One)), Zero))
                    Store (DID2, Index (DerefOf (Index (MXIF, 0x02)), Zero))
                    Store (DID3, Index (DerefOf (Index (MXIF, 0x03)), Zero))
                    Store (DID4, Index (DerefOf (Index (MXIF, 0x04)), Zero))
                    Store (DID5, Index (DerefOf (Index (MXIF, 0x05)), Zero))
                    Store (DID6, Index (DerefOf (Index (MXIF, 0x06)), Zero))
                    Store (DID7, Index (DerefOf (Index (MXIF, 0x07)), Zero))
                    Store (DID8, Index (DerefOf (Index (MXIF, 0x08)), Zero))
                    Store (MXVL (MXD1), Index (DerefOf (Index (MXIF, One)), One))
                    Store (MXVL (MXD2), Index (DerefOf (Index (MXIF, 0x02)), One))
                    Store (MXVL (MXD3), Index (DerefOf (Index (MXIF, 0x03)), One))
                    Store (MXVL (MXD4), Index (DerefOf (Index (MXIF, 0x04)), One))
                    Store (MXVL (MXD5), Index (DerefOf (Index (MXIF, 0x05)), One))
                    Store (MXVL (MXD6), Index (DerefOf (Index (MXIF, 0x06)), One))
                    Store (MXVL (MXD7), Index (DerefOf (Index (MXIF, 0x07)), One))
                    Store (MXVL (MXD8), Index (DerefOf (Index (MXIF, 0x08)), One))
                    If (And (SGFL, One))
                    {
                        Store (0x80010306, Index (DerefOf (Index (MXIF, NDID)), Zero))
                        Store (MXVL (0x0101010E), Index (DerefOf (Index (MXIF, NDID)), One))
                    }

                    Return (MXIF)
                }
            }

            If (CondRefOf (\_SB.PCI0.IGPU.HDSM))
            {
                Return (\_SB.PCI0.IGPU.HDSM (Arg0, Arg1, Arg2, Arg3))
            }

            Return (One)
        }

        Method (IDAB, 0, Serialized)
        {
            If (LEqual (And (SGMD, 0x0F), One))
            {
                If (LEqual (SGFL, One))
                {
                    WIID ()
                }
            }
            Else
            {
                Store (Zero, NDID)
                If (LNotEqual (DIDL, Zero))
                {
                    Store (SDDL (DIDL), DID1)
                }

                If (LNotEqual (DDL2, Zero))
                {
                    Store (SDDL (DDL2), DID2)
                }

                If (LNotEqual (DDL3, Zero))
                {
                    Store (SDDL (DDL3), DID3)
                }

                If (LNotEqual (DDL4, Zero))
                {
                    Store (SDDL (DDL4), DID4)
                }

                If (LNotEqual (DDL5, Zero))
                {
                    Store (SDDL (DDL5), DID5)
                }

                If (LNotEqual (DDL6, Zero))
                {
                    Store (SDDL (DDL6), DID6)
                }

                If (LNotEqual (DDL7, Zero))
                {
                    Store (SDDL (DDL7), DID7)
                }

                If (LNotEqual (DDL8, Zero))
                {
                    Store (SDDL (DDL8), DID8)
                }
            }

            Return (Zero)
        }

        Method (HWID, 0, Serialized)
        {
            Name (TMP9, Package (0x09)
            {
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones
            })
            Store (Or (0x00010000, DID1), Index (TMP9, Zero))
            Store (Or (0x00010000, DID2), Index (TMP9, One))
            Store (Or (0x00010000, DID3), Index (TMP9, 0x02))
            Store (Or (0x00010000, DID4), Index (TMP9, 0x03))
            Store (Or (0x00010000, DID5), Index (TMP9, 0x04))
            Store (Or (0x00010000, DID6), Index (TMP9, 0x05))
            Store (Or (0x00010000, DID7), Index (TMP9, 0x06))
            Store (Or (0x00010000, DID8), Index (TMP9, 0x07))
            Store (Zero, Index (TMP9, 0x08))
            If (And (SGFL, One))
            {
                Store (0x80010306, Index (TMP9, 0x08))
            }

            Return (TMP9)
        }

        Method (WIID, 0, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            If (LEqual (And (DIDL, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID2, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID3, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID4, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID5, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID6, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID7, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID8, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            While (One)
            {
                Store (NDID, _T_0)
                If (LEqual (_T_0, One))
                {
                    Store (0x80010306, DID2)
                    Store (0x02, NDID)
                }
                ElseIf (LEqual (_T_0, 0x02))
                {
                    Store (0x80010306, DID3)
                    Store (0x03, NDID)
                }
                ElseIf (LEqual (_T_0, 0x03))
                {
                    Store (0x80010306, DID4)
                    Store (0x04, NDID)
                }
                ElseIf (LEqual (_T_0, 0x04))
                {
                    Store (0x80010306, DID5)
                    Store (0x05, NDID)
                }
                ElseIf (LEqual (_T_0, 0x05))
                {
                    Store (0x80010306, DID6)
                    Store (0x06, NDID)
                }
                ElseIf (LEqual (_T_0, 0x06))
                {
                    Store (0x80010306, DID7)
                    Store (0x07, NDID)
                }
                ElseIf (LEqual (_T_0, 0x07))
                {
                    Store (0x80010306, DID8)
                    Store (0x08, NDID)
                }
                ElseIf (LEqual (_T_0, 0x08))
                {
                    Store (0x09, NDID)
                }

                Break
            }

            Return (Zero)
        }
    }

    Scope (\_SB.PCI0.PEG0)
    {
        OperationRegion (RPCI, PCI_Config, Zero, 0xF0)
        Field (RPCI, DWordAcc, Lock, Preserve)
        {
            Offset (0xB0), 
            ASPM,   2, 
                ,   2, 
            LNKD,   1
        }

        OperationRegion (RPCX, SystemMemory, \XBAS, 0x8400)
        Field (RPCX, DWordAcc, NoLock, Preserve)
        {
            Offset (0x8214), 
            Offset (0x8216), 
            LNKS,   4
        }

        Device (PEGA)
        {
            Name (_ADR, One)  // _ADR: Address
            OperationRegion (ACAP, PCI_Config, \EECP, 0x14)
            Field (ACAP, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                LCT1,   16
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x09, 0x04))
            }
        }
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Name (ELCT, Zero)
        Name (HVID, Zero)
        Name (HDID, Zero)
        OperationRegion (PCIS, PCI_Config, Zero, 0xF0)
        Field (PCIS, DWordAcc, Lock, Preserve)
        {
            DVID,   16, 
            Offset (0x2C), 
            SVID,   16, 
            SDID,   16, 
            Offset (0x4C), 
            WVID,   16, 
            WDID,   16
        }

        OperationRegion (GPIO, SystemIO, \GBAS, 0x60)
        Field (GPIO, ByteAcc, Lock, Preserve)
        {
            Offset (0x0C), 
            LVL0,   32, 
            Offset (0x38), 
            LVL1,   32, 
            Offset (0x48), 
            LVL2,   32
        }

        OperationRegion (PCAP, PCI_Config, \EECP, 0x14)
        Field (PCAP, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTL,   16
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (Zero, \_SB.PCI0.PEG0.PEGP._ADR)
            //added to turn nvidia/radeon off
            External(\_SB.PCI0.PEG0.PEGP._OFF, MethodObj)
            _OFF()
        }

        Method (SGON, 0, Serialized)
        {
            SGPO (HLRS, One)
            SGPO (PWEN, One)
            Sleep (0x012C)
            SGPO (HLRS, Zero)
            Sleep (0x64)
            Store (Zero, LNKD)
            While (LLess (LNKS, 0x07))
            {
                Sleep (One)
            }

            Store (HVID, WVID)
            Store (HDID, WDID)
            Or (And (ELCT, 0x43), And (LCTL, 0xFFBC), LCTL)
            Or (And (ELCT, 0x43), And (\_SB.PCI0.PEG0.PEGA.LCT1, 0xFFBC), \_SB.PCI0.PEG0.PEGA.LCT1)
            Return (One)
        }

        Method (SGOF, 0, Serialized)
        {
            Store (LCTL, ELCT)
            Store (SVID, HVID)
            Store (SDID, HDID)
            Store (One, LNKD)
            While (LNotEqual (LNKS, Zero))
            {
                Sleep (One)
            }

            SGPO (HLRS, One)
            SGPO (PWEN, Zero)
            Return (Zero)
        }

        Method (SGST, 0, Serialized)
        {
            If (And (SGMD, 0x0F))
            {
                If (LEqual (SGPI (PWOK), One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            If (LNotEqual (DVID, 0xFFFF))
            {
                Return (0x0F)
            }

            Return (Zero)
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (\_SB.PCI0.IGPU._DOD ())
        }

        Device (DD01)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD01._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD01._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }

        Device (DD02)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD02._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Return (\_SB.PCI0.IGPU.DD02._DCS ())
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD02._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                Return (\_SB.PCI0.IGPU.DD02._BCL ())
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                Return (\_SB.PCI0.IGPU.DD02._BQC ())
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                Return (\_SB.PCI0.IGPU.DD02._BCM (Arg0))
            }
        }

        Device (DD03)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD03._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD03._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }

        Device (DD04)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD04._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD04._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }

        Device (DD05)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD05._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD05._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }

        Device (DD06)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD06._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD06._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }

        Device (DD07)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD07._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD07._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }

        Device (DD08)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.IGPU.DD08._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.IGPU.DD08._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }

        Method (SGPI, 1, Serialized)
        {
            ShiftRight (Arg0, 0x07, Local1)
            And (Arg0, 0x7F, Arg0)
            If (LLess (Arg0, 0x20))
            {
                Store (\_SB.PCI0.PEG0.PEGP.LVL0, Local0)
                ShiftRight (Local0, Arg0, Local0)
            }
            ElseIf (LLess (Arg0, 0x40))
            {
                Store (\_SB.PCI0.PEG0.PEGP.LVL1, Local0)
                ShiftRight (Local0, Subtract (Arg0, 0x20), Local0)
            }
            Else
            {
                Store (\_SB.PCI0.PEG0.PEGP.LVL2, Local0)
                ShiftRight (Local0, Subtract (Arg0, 0x40), Local0)
            }

            If (LEqual (Local1, Zero))
            {
                Not (Local0, Local0)
            }

            Return (And (Local0, One))
        }

        Method (SGPO, 2, Serialized)
        {
            ShiftRight (Arg0, 0x07, Local3)
            And (Arg0, 0x7F, Arg0)
            If (LEqual (Local3, Zero))
            {
                And (Not (Arg1), One, Arg1)
            }

            If (LLess (Arg0, 0x20))
            {
                ShiftLeft (Arg1, Arg0, Local0)
                ShiftLeft (One, Arg0, Local1)
                And (\_SB.PCI0.PEG0.PEGP.LVL0, Not (Local1), Local2)
                Or (Local2, Local0, \_SB.PCI0.PEG0.PEGP.LVL0)
            }
            ElseIf (LLess (Arg0, 0x40))
            {
                ShiftLeft (Arg1, Subtract (Arg0, 0x20), Local0)
                ShiftLeft (One, Subtract (Arg0, 0x20), Local1)
                And (\_SB.PCI0.PEG0.PEGP.LVL1, Not (Local1), Local2)
                Or (Local2, Local0, \_SB.PCI0.PEG0.PEGP.LVL1)
            }
            Else
            {
                ShiftLeft (Arg1, Subtract (Arg0, 0x40), Local0)
                ShiftLeft (One, Subtract (Arg0, 0x40), Local1)
                And (\_SB.PCI0.PEG0.PEGP.LVL2, Not (Local1), Local2)
                Or (Local2, Local0, \_SB.PCI0.PEG0.PEGP.LVL2)
            }

            Return (One)
        }
    }
}

