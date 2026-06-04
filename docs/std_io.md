# Module: std_io

Input/Output operations module

PLATFORM: Linux x86_64, macOS x86_64/ARM64, and Windows x86_64

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### public `FormatArg`

**Fields:**

- `tag`: int
- `str_ptr`: *char
- `int_val`: int
- `byte_val`: char

## Functions

### public `local_write`

**Signature:**
```luma
pub const local_write -> fn(fd: int, buf: *void, count: int) int;
```

### public `local_read`

**Signature:**
```luma
pub const local_read -> fn(fd: int, buf: *void, count: int) int;
```

### public `local_open_read`

**Signature:**
```luma
pub const local_open_read -> fn(path: *char) int;
```

### public `local_open_create`

**Signature:**
```luma
pub const local_open_create -> fn(path: *char) int;
```

### public `local_close`

**Signature:**
```luma
pub const local_close -> fn(fd: int) int;
```

### public `local_is_error`

**Signature:**
```luma
pub const local_is_error -> fn(result: int) bool;
```

### public `write_binary`

**Signature:**
```luma
pub const write_binary -> fn(path: *char, data: *void, size: int) int;
```

### public `read_binary`

**Signature:**
```luma
pub const read_binary -> fn(path: *char, data: *void, size: int) int;
```

### public `str_arg`

**Signature:**
```luma
pub const str_arg -> fn(arg: *char) FormatArg;
```

### public `int_arg`

**Signature:**
```luma
pub const int_arg -> fn(arg: int) FormatArg;
```

### public `byte_arg`

**Signature:**
```luma
pub const byte_arg -> fn(arg: char) FormatArg;
```

### public `print`

**Signature:**
```luma
pub const print -> fn(s: *char, args: [FormatArg; 256]) int;
```

### public `print_err`

**Signature:**
```luma
pub const print_err -> fn(s: *char, args: [int; 256]) int;
```

### public `read_file`

**Signature:**
```luma
#returns_ownership pub const read_file -> fn(path: *char) *char;
```

### public `write_buffer_to_file`

**Signature:**
```luma
pub const write_buffer_to_file -> fn(path: *char, buffer: *char) int;
```

