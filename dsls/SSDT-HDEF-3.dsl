/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-HDEF-3.aml, Fri Dec 22 19:31:06 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000DA (218)
 *     Revision         0x01
 *     Checksum         0x65
 *     OEM ID           "toleda"
 *     OEM Table ID     "amhdef3"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20141107 (538185991)
 */
DefinitionBlock ("", "SSDT", 1, "toleda", "amhdef3", 0x00003000)
{
    External (_SB_.PCI0, DeviceObj)    // Warning: Unknown object

    Scope (\_SB.PCI0)
    {
        Method (HDEF._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }, 

                "layout-id", 
                Buffer (0x04)
                {
                     0x03, 0x00, 0x00, 0x00                         
                }, 

                "PinConfigurations", 
                Buffer (Zero) {}
            })
        }
    }

    Store ("ssdt-ami_6/7/8series_hdef_audio-with_ioreg/hdef-3_v3.0 github.com/toleda", Debug)
}

