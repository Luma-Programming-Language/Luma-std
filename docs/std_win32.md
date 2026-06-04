# Module: std_win32

std_win32.lx - Windows Win32 API Interface

PLATFORM: Windows x86_64 only

Provides direct access to kernel32.dll and other core Win32 APIs.
This is the Windows equivalent of std_sys — use @os blocks to select
between std_sys (POSIX) and std_win32 (Windows) in cross-platform code.

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)


## Functions

### `CreateFileA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub CreateFileA -> fn(
    lpFileName: *char,
    dwDesiredAccess: int,
    dwShareMode: int,
    lpSecurityAttributes: *void,
    dwCreationDisposition: int,
    dwFlagsAndAttributes: int,
    hTemplateFile: int
) int
```

### `ReadFile`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub ReadFile -> fn(
    hFile: int,
    lpBuffer: *void,
    nNumberOfBytesToRead: int,
    lpNumberOfBytesRead: *int,
    lpOverlapped: *void
) int
```

### `WriteFile`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub WriteFile -> fn(
    hFile: int,
    lpBuffer: *void,
    nNumberOfBytesToWrite: int,
    lpNumberOfBytesWritten: *int,
    lpOverlapped: *void
) int
```

### `CloseHandle`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub CloseHandle -> fn(
    hObject: int
) int
```

### `GetFileSizeEx`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetFileSizeEx -> fn(
    hFile: int,
    lpFileSize: *int
) int
```

### `SetFilePointerEx`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub SetFilePointerEx -> fn(
    hFile: int,
    liDistanceToMove: int,
    lpNewFilePointer: *int,
    dwMoveMethod: int
) int
```

### `DeleteFileA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub DeleteFileA -> fn(
    lpFileName: *char
) int
```

### `MoveFileA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub MoveFileA -> fn(
    lpExistingFileName: *char,
    lpNewFileName: *char
) int
```

### `CopyFileA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub CopyFileA -> fn(
    lpExistingFileName: *char,
    lpNewFileName: *char,
    bFailIfExists: int
) int
```

### `CreateDirectoryA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub CreateDirectoryA -> fn(
    lpPathName: *char,
    lpSecurityAttributes: *void
) int
```

### `RemoveDirectoryA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub RemoveDirectoryA -> fn(
    lpPathName: *char
) int
```

### `GetCurrentDirectoryA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetCurrentDirectoryA -> fn(
    nBufferLength: int,
    lpBuffer: *char
) int
```

### `SetCurrentDirectoryA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub SetCurrentDirectoryA -> fn(
    lpPathName: *char
) int
```

### `GetStdHandle`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetStdHandle -> fn(
    nStdHandle: int
) int
```

### `SetConsoleOutputCP`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub SetConsoleOutputCP -> fn(
    wCodePageID: int
) int
```

### `ExitProcess`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub ExitProcess -> fn(
    uExitCode: int
) void
```

### `GetCurrentProcessId`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetCurrentProcessId -> fn(
) int
```

### `OpenProcess`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub OpenProcess -> fn(
    dwDesiredAccess: int,
    bInheritHandle: int,
    dwProcessId: int
) int
```

### `TerminateProcess`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub TerminateProcess -> fn(
    hProcess: int,
    uExitCode: int
) int
```

### `GetExitCodeProcess`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetExitCodeProcess -> fn(
    hProcess: int,
    lpExitCode: *int
) int
```

### `CreateProcessA`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub CreateProcessA -> fn(
    lpApplicationName: *char,
    lpCommandLine: *char,
    lpProcessAttributes: *void,
    lpThreadAttributes: *void,
    bInheritHandles: int,
    dwCreationFlags: int,
    lpEnvironment: *void,
    lpCurrentDirectory: *char,
    lpStartupInfo: *void,
    lpProcessInformation: *void
) int
```

### `WaitForSingleObject`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub WaitForSingleObject -> fn(
    hHandle: int,
    dwMilliseconds: int
) int
```

### `VirtualAlloc`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub VirtualAlloc -> fn(
    lpAddress: *void,
    dwSize: int,
    flAllocationType: int,
    flProtect: int
) *void
```

### `VirtualFree`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub VirtualFree -> fn(
    lpAddress: *void,
    dwSize: int,
    dwFreeType: int
) int
```

### `GetProcessHeap`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetProcessHeap -> fn(
) int
```

### `HeapAlloc`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub HeapAlloc -> fn(
    hHeap: int,
    dwFlags: int,
    dwBytes: int
) *void
```

### `HeapFree`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub HeapFree -> fn(
    hHeap: int,
    dwFlags: int,
    lpMem: *void
) int
```

### `GetLastError`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetLastError -> fn(
) int
```

### `SetLastError`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub SetLastError -> fn(
    dwErrCode: int
) void
```

### `GetTickCount64`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetTickCount64 -> fn(
) int
```

### `Sleep`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub Sleep -> fn(
    dwMilliseconds: int
) void
```

### `is_invalid_handle`

Returns true if a handle is invalid.

```luma
pub is_invalid_handle -> fn(
    handle: int
) bool
```

### `win32_failed`

Returns true if a Win32 boolean return value indicates failure (0 = failed).

```luma
pub win32_failed -> fn(
    result: int
) bool
```

### `write_str`

Write a null-terminated string to a handle. Returns bytes written.

```luma
pub write_str -> fn(
    handle: int,
    s: *char
) int
```

### `eprint`

Write a null-terminated string to stderr.

```luma
pub eprint -> fn(
    s: *char
) int
```

### `print_str`

Write a null-terminated string to stdout.

```luma
pub print_str -> fn(
    s: *char
) int
```

### `open_read`

Open a file for reading. Returns a handle or INVALID_HANDLE_VALUE.

```luma
pub open_read -> fn(
    path: *char
) int
```

### `open_write`

Open a file for writing (creates or truncates). Returns a handle or INVALID_HANDLE_VALUE.

```luma
pub open_write -> fn(
    path: *char
) int
```

### `open_rdwr`

Open a file for reading and writing. Returns a handle or INVALID_HANDLE_VALUE.

```luma
pub open_rdwr -> fn(
    path: *char
) int
```

### `file_size`

Get the size of an open file. Returns -1 on error.

```luma
pub file_size -> fn(
    handle: int
) int
```

