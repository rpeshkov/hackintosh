/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-HDMI-HD3000.aml, Fri Dec 22 19:31:06 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000129 (297)
 *     Revision         0x01
 *     Checksum         0x3E
 *     OEM ID           "toleda"
 *     OEM Table ID     "ami6hdm3"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20130725 (538117925)
 */
DefinitionBlock ("", "SSDT", 1, "toleda", "ami6hdm3", 0x00003000)
{
    External (_SB_.PCI0, DeviceObj)    // Warning: Unknown object
    External (_SB_.PCI0.GFX0._ADR, UnknownObj)    // Warning: Unknown object

    Method (XOSI, 1, NotSerialized)
    {
        Return (LEqual (Arg0, "Windows 2009"))
    }

    Scope (\_SB.PCI0)
    {
        Name (GFX0._STA, Zero)  // _STA: Status
        Device (IGPU)
        {
            Name (_ADR, 0x00020000)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (Zero, \_SB.PCI0.GFX0._ADR)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x06)
                {
                    "AAPL,snb-platform-id", 
                    Buffer (0x04)
                    {
                         0x10, 0x00, 0x03, 0x00                         
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x26, 0x01, 0x00, 0x00                         
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }
                })
            }
        }
    }

    Store ("ssdt-ami-6series_desktop_hd3000_hdmi_audio-3_v3.0 github.com/toleda", Debug)
}

