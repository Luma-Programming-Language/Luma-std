# Module: io

Input/Output operations module

This module provides formatted printing functions and file reading capabilities.
It is completely self-contained with no external module dependencies.
All required syscalls and memory operations are implemented locally.

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

Prints a formatted string with mixed-type arguments to stdout

This function performs printf-style formatting, supporting:
* %d - integers
* %s - strings
* %c - bytes/characters
* %f - floats (requires precision, e.g., %.2f)

The number of arguments consumed is determined by the number of format
specifiers in the format string. The args array is bounds-checked to
prevent buffer overruns.

Prints a formatted string with mixed-type arguments to stdout

This function performs printf-style formatting, supporting:
* %d - integers
* %s - strings
* %c - bytes/characters
* %f - floats (requires precision, e.g., %.2f)

The number of arguments consumed is determined by the number of format
specifiers in the format string. The args array is bounds-checked to
prevent buffer overruns.

# Parameters
* `s` - Format string containing text and format placeholders
* `args` - Array of FormatArg structs containing typed arguments

Prints a formatted string with mixed-type arguments to stdout

This function performs printf-style formatting, supporting:
* %d - integers
* %s - strings
* %c - bytes/characters
* %f - floats (requires precision, e.g., %.2f)

The number of arguments consumed is determined by the number of format
specifiers in the format string. The args array is bounds-checked to
prevent buffer overruns.

# Parameters
* `s` - Format string containing text and format placeholders
* `args` - Array of FormatArg structs containing typed arguments

# Returns
The number of bytes written to stdout, or an error code if writing fails


**Signature:**
```luma
pub const print -> fn(s: *char, args: [FormatArg; 256]) int;
```

**Parameters:**
* `s` - Format string containing text and format placeholders
* `args` - Array of FormatArg structs containing typed arguments

**Returns:**
The number of bytes written to stdout, or an error code if writing fails

**Example:**
```luma
let args: [FormatArg; 256];
args[0] = str_arg("Alice");
args[1] = int_arg(30);
args[2] = byte_arg('A');
print("Name: %s, Age: %d, Initial: %c\n", args);
```

### public `print_err`

Prints a formatted error message with integer arguments to stderr

This function is similar to print_int but writes to stderr instead of stdout.
It supports only the %d format specifier for integers and is intended for
error reporting.

Prints a formatted error message with integer arguments to stderr

This function is similar to print_int but writes to stderr instead of stdout.
It supports only the %d format specifier for integers and is intended for
error reporting.

# Parameters
* `s` - Format string containing text and %d placeholders
* `args` - Array of up to 256 integers to substitute into the format string

Prints a formatted error message with integer arguments to stderr

This function is similar to print_int but writes to stderr instead of stdout.
It supports only the %d format specifier for integers and is intended for
error reporting.

# Parameters
* `s` - Format string containing text and %d placeholders
* `args` - Array of up to 256 integers to substitute into the format string

# Returns
The number of bytes written to stderr, or an error code if writing fails

# Memory
Allocates a 256-byte temporary buffer which is automatically freed via defer

**Signature:**
```luma
pub const print_err -> fn(s: *char, args: [int; 256]) int;
```

**Parameters:**
* `s` - Format string containing text and %d placeholders
* `args` - Array of up to 256 integers to substitute into the format string

**Returns:**
The number of bytes written to stderr, or an error code if writing fails

### public `read_file`

Reads the entire contents of a file into a dynamically allocated buffer

This function opens a file, reads its complete contents into memory using a
dynamic buffer that grows as needed, and returns a pointer to the null-terminated
string. The buffer starts at INITIAL_BUFFER_SIZE (4KB) and doubles in size when
full until the entire file is read. After reading, the buffer is shrunk to the
exact size needed to minimize memory usage.

Reads the entire contents of a file into a dynamically allocated buffer

This function opens a file, reads its complete contents into memory using a
dynamic buffer that grows as needed, and returns a pointer to the null-terminated
string. The buffer starts at INITIAL_BUFFER_SIZE (4KB) and doubles in size when
full until the entire file is read. After reading, the buffer is shrunk to the
exact size needed to minimize memory usage.

# Parameters
* `path` - Null-terminated string containing the file path to read

Reads the entire contents of a file into a dynamically allocated buffer

This function opens a file, reads its complete contents into memory using a
dynamic buffer that grows as needed, and returns a pointer to the null-terminated
string. The buffer starts at INITIAL_BUFFER_SIZE (4KB) and doubles in size when
full until the entire file is read. After reading, the buffer is shrunk to the
exact size needed to minimize memory usage.

# Parameters
* `path` - Null-terminated string containing the file path to read

# Returns
A pointer to a newly allocated null-terminated string containing the file contents,
or a null pointer (0) if an error occurs. The caller is responsible for freeing
this memory.

# Memory
The returned buffer is heap-allocated and ownership is transferred to the caller.
The caller MUST free the returned pointer when done. Returns null on allocation
failures or read errors.

# Errors
Returns null pointer and prints error message to stderr if:
* File cannot be opened
* Memory allocation fails
* Read operation fails

**Signature:**
```luma
#returns_ownership pub const read_file -> fn(path: *char) *char;
```

**Parameters:**
* `path` - Null-terminated string containing the file path to read

**Returns:**
A pointer to a newly allocated null-terminated string containing the file contents,
or a null pointer (0) if an error occurs. The caller is responsible for freeing
this memory.

### public `write_buffer_to_file`

Writes a buffer to a file

Opens an existing file and writes the entire buffer contents to it.

Writes a buffer to a file

Opens an existing file and writes the entire buffer contents to it.

# Parameters
* `path` - Path to the file to write to
* `buffer` - Null-terminated string to write

Writes a buffer to a file

Opens an existing file and writes the entire buffer contents to it.

# Parameters
* `path` - Path to the file to write to
* `buffer` - Null-terminated string to write

# Returns
Number of bytes written, or -1 on error

**Signature:**
```luma
pub const write_buffer_to_file -> fn(path: *char, buffer: *char) int;
```

**Parameters:**
* `path` - Path to the file to write to
* `buffer` - Null-terminated string to write

**Returns:**
Number of bytes written, or -1 on error

## Variables

### private `SYS_READ`

**Type:** int (constant)

Syscall numbers (Linux x86_64)

### private `SYS_WRITE`

**Type:** int (constant)

### private `SYS_OPEN`

**Type:** int (constant)

### private `SYS_CLOSE`

**Type:** int (constant)

### private `O_RDONLY`

**Type:** int (constant)

### private `O_RDWR`

**Type:** int (constant)

### private `STDOUT`

**Type:** int (constant)

### private `STDERR`

**Type:** int (constant)

### private `INITIAL_BUFFER_SIZE`

**Type:** int (constant)

Initial buffer size for file reading operations (4KB)

### private `BUFFER_GROWTH_FACTOR`

**Type:** int (constant)

Factor by which buffers grow when they need to expand

### private `ARG_INT`

**Type:** int (constant)

Type tags for format arguments

### private `ARG_STR`

**Type:** int (constant)

### private `ARG_BYTE`

**Type:** int (constant)

### private `ARG_FLOAT`

**Type:** int (constant)

### public `NULL_FORMAT_ARG`

**Type:** FormatArg (constant)

