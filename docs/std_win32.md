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

---

## Functions

### public `CreateFileA`

**Signature:**
```luma
pub const CreateFileA -> fn(lpFileName: *char, dwDesiredAccess: int, dwShareMode: int, lpSecurityAttributes: *void, dwCreationDisposition: int, dwFlagsAndAttributes: int, hTemplateFile: int) int;
```

### public `ReadFile`

**Signature:**
```luma
pub const ReadFile -> fn(hFile: int, lpBuffer: *void, nNumberOfBytesToRead: int, lpNumberOfBytesRead: *int, lpOverlapped: *void) int;
```

### public `WriteFile`

**Signature:**
```luma
pub const WriteFile -> fn(hFile: int, lpBuffer: *void, nNumberOfBytesToWrite: int, lpNumberOfBytesWritten: *int, lpOverlapped: *void) int;
```

### public `CloseHandle`

**Signature:**
```luma
pub const CloseHandle -> fn(hObject: int) int;
```

### public `GetFileSizeEx`

**Signature:**
```luma
pub const GetFileSizeEx -> fn(hFile: int, lpFileSize: *int) int;
```

### public `SetFilePointerEx`

**Signature:**
```luma
pub const SetFilePointerEx -> fn(hFile: int, liDistanceToMove: int, lpNewFilePointer: *int, dwMoveMethod: int) int;
```

### public `DeleteFileA`

**Signature:**
```luma
pub const DeleteFileA -> fn(lpFileName: *char) int;
```

### public `MoveFileA`

**Signature:**
```luma
pub const MoveFileA -> fn(lpExistingFileName: *char, lpNewFileName: *char) int;
```

### public `CopyFileA`

**Signature:**
```luma
pub const CopyFileA -> fn(lpExistingFileName: *char, lpNewFileName: *char, bFailIfExists: int) int;
```

### public `CreateDirectoryA`

**Signature:**
```luma
pub const CreateDirectoryA -> fn(lpPathName: *char, lpSecurityAttributes: *void) int;
```

### public `RemoveDirectoryA`

**Signature:**
```luma
pub const RemoveDirectoryA -> fn(lpPathName: *char) int;
```

### public `GetCurrentDirectoryA`

**Signature:**
```luma
pub const GetCurrentDirectoryA -> fn(nBufferLength: int, lpBuffer: *char) int;
```

### public `SetCurrentDirectoryA`

**Signature:**
```luma
pub const SetCurrentDirectoryA -> fn(lpPathName: *char) int;
```

### public `GetStdHandle`

**Signature:**
```luma
pub const GetStdHandle -> fn(nStdHandle: int) int;
```

### public `SetConsoleOutputCP`

**Signature:**
```luma
pub const SetConsoleOutputCP -> fn(wCodePageID: int) int;
```

### public `ExitProcess`

**Signature:**
```luma
pub const ExitProcess -> fn(uExitCode: int) void;
```

### public `GetCurrentProcessId`

**Signature:**
```luma
pub const GetCurrentProcessId -> fn() int;
```

### public `OpenProcess`

**Signature:**
```luma
pub const OpenProcess -> fn(dwDesiredAccess: int, bInheritHandle: int, dwProcessId: int) int;
```

### public `TerminateProcess`

**Signature:**
```luma
pub const TerminateProcess -> fn(hProcess: int, uExitCode: int) int;
```

### public `GetExitCodeProcess`

**Signature:**
```luma
pub const GetExitCodeProcess -> fn(hProcess: int, lpExitCode: *int) int;
```

### public `CreateProcessA`

**Signature:**
```luma
pub const CreateProcessA -> fn(lpApplicationName: *char, lpCommandLine: *char, lpProcessAttributes: *void, lpThreadAttributes: *void, bInheritHandles: int, dwCreationFlags: int, lpEnvironment: *void, lpCurrentDirectory: *char, lpStartupInfo: *void, lpProcessInformation: *void) int;
```

### public `WaitForSingleObject`

**Signature:**
```luma
pub const WaitForSingleObject -> fn(hHandle: int, dwMilliseconds: int) int;
```

### public `VirtualAlloc`

**Signature:**
```luma
pub const VirtualAlloc -> fn(lpAddress: *void, dwSize: int, flAllocationType: int, flProtect: int) *void;
```

### public `VirtualFree`

**Signature:**
```luma
pub const VirtualFree -> fn(lpAddress: *void, dwSize: int, dwFreeType: int) int;
```

### public `GetProcessHeap`

**Signature:**
```luma
pub const GetProcessHeap -> fn() int;
```

### public `HeapAlloc`

**Signature:**
```luma
pub const HeapAlloc -> fn(hHeap: int, dwFlags: int, dwBytes: int) *void;
```

### public `HeapFree`

**Signature:**
```luma
pub const HeapFree -> fn(hHeap: int, dwFlags: int, lpMem: *void) int;
```

### public `GetLastError`

**Signature:**
```luma
pub const GetLastError -> fn() int;
```

### public `SetLastError`

**Signature:**
```luma
pub const SetLastError -> fn(dwErrCode: int) void;
```

### public `GetTickCount64`

**Signature:**
```luma
pub const GetTickCount64 -> fn() int;
```

### public `Sleep`

**Signature:**
```luma
pub const Sleep -> fn(dwMilliseconds: int) void;
```

### public `is_invalid_handle`

Returns true if a handle is invalid.
Returns true if a handle is invalid.
Returns true if a handle is invalid.

**Signature:**
```luma
pub const is_invalid_handle -> fn(handle: int) bool;
```

### public `win32_failed`

Returns true if a Win32 boolean return value indicates failure (0 = failed).
Returns true if a Win32 boolean return value indicates failure (0 = failed).
Returns true if a Win32 boolean return value indicates failure (0 = failed).

**Signature:**
```luma
pub const win32_failed -> fn(result: int) bool;
```

### public `write_str`

Write a null-terminated string to a handle. Returns bytes written.
Write a null-terminated string to a handle. Returns bytes written.
Write a null-terminated string to a handle. Returns bytes written.

**Signature:**
```luma
pub const write_str -> fn(handle: int, s: *char) int;
```

### public `eprint`

Write a null-terminated string to stderr.
Write a null-terminated string to stderr.
Write a null-terminated string to stderr.

**Signature:**
```luma
pub const eprint -> fn(s: *char) int;
```

### public `print_str`

Write a null-terminated string to stdout.
Write a null-terminated string to stdout.
Write a null-terminated string to stdout.

**Signature:**
```luma
pub const print_str -> fn(s: *char) int;
```

### public `open_read`

Open a file for reading. Returns a handle or INVALID_HANDLE_VALUE.
Open a file for reading. Returns a handle or INVALID_HANDLE_VALUE.
Open a file for reading. Returns a handle or INVALID_HANDLE_VALUE.

**Signature:**
```luma
pub const open_read -> fn(path: *char) int;
```

### public `open_write`

Open a file for writing (creates or truncates). Returns a handle or INVALID_HANDLE_VALUE.
Open a file for writing (creates or truncates). Returns a handle or INVALID_HANDLE_VALUE.
Open a file for writing (creates or truncates). Returns a handle or INVALID_HANDLE_VALUE.

**Signature:**
```luma
pub const open_write -> fn(path: *char) int;
```

### public `open_rdwr`

Open a file for reading and writing. Returns a handle or INVALID_HANDLE_VALUE.
Open a file for reading and writing. Returns a handle or INVALID_HANDLE_VALUE.
Open a file for reading and writing. Returns a handle or INVALID_HANDLE_VALUE.

**Signature:**
```luma
pub const open_rdwr -> fn(path: *char) int;
```

### public `file_size`

Get the size of an open file. Returns -1 on error.
Get the size of an open file. Returns -1 on error.
Get the size of an open file. Returns -1 on error.

**Signature:**
```luma
pub const file_size -> fn(handle: int) int;
```

