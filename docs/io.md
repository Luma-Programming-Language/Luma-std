# Module: io

Input/Output operations module

This module provides formatted printing functions and file reading capabilities.
It supports basic format specifiers (%d, %s, %c) for printing different types
and includes a dynamic buffer system for efficient file reading.

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Functions

### public `print_int`

Prints a formatted string with integer arguments to stdout

This function performs simple printf-style formatting, supporting only the %d
format specifier for integers. The format string is scanned character by character,
and %d sequences are replaced with the corresponding integer from the args array.

Prints a formatted string with integer arguments to stdout

This function performs simple printf-style formatting, supporting only the %d
format specifier for integers. The format string is scanned character by character,
and %d sequences are replaced with the corresponding integer from the args array.

# Parameters
* `s` - Format string containing text and %d placeholders
* `args` - Array of up to 256 integers to substitute into the format string

Prints a formatted string with integer arguments to stdout

This function performs simple printf-style formatting, supporting only the %d
format specifier for integers. The format string is scanned character by character,
and %d sequences are replaced with the corresponding integer from the args array.

# Parameters
* `s` - Format string containing text and %d placeholders
* `args` - Array of up to 256 integers to substitute into the format string

# Returns
The number of bytes written to stdout, or an error code if writing fails

# Memory
Allocates a 256-byte temporary buffer which is automatically freed via defer

**Signature:**
```luma
pub const print_int -> fn(s: *char, args: [int; 256]) int;
```

**Parameters:**
* `s` - Format string containing text and %d placeholders
* `args` - Array of up to 256 integers to substitute into the format string

**Returns:**
The number of bytes written to stdout, or an error code if writing fails

### public `print_str`

Prints a formatted string with string arguments to stdout

This function performs simple printf-style formatting, supporting only the %s
format specifier for strings. The format string is scanned character by character,
and %s sequences are replaced with the corresponding string from the args array.

Prints a formatted string with string arguments to stdout

This function performs simple printf-style formatting, supporting only the %s
format specifier for strings. The format string is scanned character by character,
and %s sequences are replaced with the corresponding string from the args array.

# Parameters
* `s` - Format string containing text and %s placeholders
* `args` - Array of up to 256 string pointers to substitute into the format string

Prints a formatted string with string arguments to stdout

This function performs simple printf-style formatting, supporting only the %s
format specifier for strings. The format string is scanned character by character,
and %s sequences are replaced with the corresponding string from the args array.

# Parameters
* `s` - Format string containing text and %s placeholders
* `args` - Array of up to 256 string pointers to substitute into the format string

# Returns
The number of bytes written to stdout, or an error code if writing fails

# Memory
Allocates a 256-byte temporary buffer which is automatically freed via defer

**Signature:**
```luma
pub const print_str -> fn(s: *char, args: [*char; 256]) int;
```

**Parameters:**
* `s` - Format string containing text and %s placeholders
* `args` - Array of up to 256 string pointers to substitute into the format string

**Returns:**
The number of bytes written to stdout, or an error code if writing fails

### public `print_byte`

Prints a formatted string with byte (character) arguments to stdout

This function performs simple printf-style formatting, supporting only the %c
format specifier for individual bytes/characters. The format string is scanned
character by character, and %c sequences are replaced with the corresponding
byte from the args array.

Prints a formatted string with byte (character) arguments to stdout

This function performs simple printf-style formatting, supporting only the %c
format specifier for individual bytes/characters. The format string is scanned
character by character, and %c sequences are replaced with the corresponding
byte from the args array.

# Parameters
* `s` - Format string containing text and %c placeholders
* `args` - Array of up to 256 bytes to substitute into the format string

Prints a formatted string with byte (character) arguments to stdout

This function performs simple printf-style formatting, supporting only the %c
format specifier for individual bytes/characters. The format string is scanned
character by character, and %c sequences are replaced with the corresponding
byte from the args array.

# Parameters
* `s` - Format string containing text and %c placeholders
* `args` - Array of up to 256 bytes to substitute into the format string

# Returns
The number of bytes written to stdout, or an error code if writing fails

# Memory
Allocates a 256-byte temporary buffer which is automatically freed via defer

**Signature:**
```luma
pub const print_byte -> fn(s: *char, args: [char; 256]) int;
```

**Parameters:**
* `s` - Format string containing text and %c placeholders
* `args` - Array of up to 256 bytes to substitute into the format string

**Returns:**
The number of bytes written to stdout, or an error code if writing fails

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

**Signature:**
```luma
pub const write_buffer_to_file -> fn(path: *char, buffer: *char) int;
```

## Variables

### private `INITIAL_BUFFER_SIZE`

**Type:** int (constant)

Initial buffer size for file reading operations (4KB)

### private `BUFFER_GROWTH_FACTOR`

**Type:** int (constant)

Factor by which buffers grow when they need to expand

