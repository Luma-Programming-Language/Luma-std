# Module: std_io

Input/Output operations module

PLATFORM: Linux x86_64, macOS x86_64/ARM64, and Windows x86_64

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)
- [OS-Specific](#os-specific)

---

## Structures

### `FormatArg`

| Field | Type | Description |
|-------|------|-------------|
| `tag` | int |  |
| `str_ptr` | *char |  |
| `int_val` | int |  |
| `byte_val` | char |  |


## Functions

### `local_write`

```luma
pub local_write -> fn(
    fd: int,
    buf: *void,
    count: int
) int
```

### `local_read`

```luma
pub local_read -> fn(
    fd: int,
    buf: *void,
    count: int
) int
```

### `local_open_read`

```luma
pub local_open_read -> fn(
    path: *char
) int
```

### `local_open_create`

```luma
pub local_open_create -> fn(
    path: *char
) int
```

### `local_close`

```luma
pub local_close -> fn(
    fd: int
) int
```

### `local_is_error`

```luma
pub local_is_error -> fn(
    result: int
) bool
```

### `write_binary`

```luma
pub write_binary -> fn(
    path: *char,
    data: *void,
    size: int
) int
```

### `read_binary`

```luma
pub read_binary -> fn(
    path: *char,
    data: *void,
    size: int
) int
```

### `str_arg`

```luma
pub str_arg -> fn(
    arg: *char
) FormatArg
```

### `int_arg`

```luma
pub int_arg -> fn(
    arg: int
) FormatArg
```

### `byte_arg`

```luma
pub byte_arg -> fn(
    arg: char
) FormatArg
```

### `print`

```luma
pub print -> fn(
    s: *char,
    args: [FormatArg; 256]
) int
```

### `print_err`

```luma
pub print_err -> fn(
    s: *char,
    args: [int; 256]
) int
```

### `read_file`

```luma
#returns_ownership
pub read_file -> fn(
    path: *char
) *char
```

### `write_buffer_to_file`

```luma
pub write_buffer_to_file -> fn(
    path: *char,
    buffer: *char
) int
```


## OS-Specific

### `"linux"`

- **`SYS_READ`** : int *(constant)*
- **`SYS_WRITE`** : int *(constant)*
- **`SYS_OPEN`** : int *(constant)*
- **`SYS_CLOSE`** : int *(constant)*
- **`O_RDONLY`** : int *(constant)*
- **`O_RDWR`** : int *(constant)*
- **`STDOUT`** : int *(constant)*
- **`STDERR`** : int *(constant)*

### `"macos"`

- **`SYS_READ`** : int *(constant)*
- **`SYS_WRITE`** : int *(constant)*
- **`SYS_OPEN`** : int *(constant)*
- **`SYS_CLOSE`** : int *(constant)*
- **`O_RDONLY`** : int *(constant)*
- **`O_RDWR`** : int *(constant)*
- **`STDOUT`** : int *(constant)*
- **`STDERR`** : int *(constant)*

### `"windows64"`

- **`GENERIC_READ`** : int *(constant)*
- **`GENERIC_WRITE`** : int *(constant)*
- **`FILE_SHARE_READ`** : int *(constant)*
- **`OPEN_EXISTING`** : int *(constant)*
- **`INVALID_HANDLE_VALUE`** : int *(constant)*
- **`STD_OUTPUT_HANDLE`** : int *(constant)*
- **`STD_ERROR_HANDLE`** : int *(constant)*
- **`STD_INPUT_HANDLE`** : int *(constant)*
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

### `CloseHandle`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub CloseHandle -> fn(
    hObject: int
) int
```

### `GetStdHandle`

```luma
#dll_import("kernel32.dll", callconv: "stdcall")
pub GetStdHandle -> fn(
    nStdHandle: int
) int
```


