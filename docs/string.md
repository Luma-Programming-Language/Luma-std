# Module: string

String manipulation and conversion utilities

This module provides functions for working with null-terminated C-style strings,
including concatenation, comparison, conversion, and character classification.
All strings are represented as pointers to byte arrays (`*byte`) and must be
null-terminated.

This module is completely self-contained with no external dependencies.

# Memory Management
Functions that create new strings (prefixed with `from_` or returning `#returns_ownership`)
allocate memory that the caller must free. Use `defer { free(str); }` to ensure cleanup.

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### public `Slice`

String slice with pointer and length

**Fields:**

- `ptr`: *char
- `len`: int

**Methods:**

#### `slice_end()`

```luma
slice_end -> fn() *char
```

#### `null_terminated_slice()`

```luma
null_terminated_slice -> fn(s: *char) Slice
```

### public `String`

String with slice and capacity

**Fields:**

- `slice`: Slice
- `cap`: int

**Methods:**

#### `concat_strs()`

```luma
#returns_ownership concat_strs -> fn(start: *Slice, len: int) String
```

#### `as_slice()`

```luma
as_slice -> fn() Slice
```

## Functions

### public `free_string`

**Signature:**
```luma
#takes_ownership pub const free_string -> fn(s: *String) void;
```

### public `strlen`

Returns the length of a null-terminated string

Counts characters until the null terminator is found.

Returns the length of a null-terminated string

Counts characters until the null terminator is found.

# Parameters
* `s` - String to measure

Returns the length of a null-terminated string

Counts characters until the null terminator is found.

# Parameters
* `s` - String to measure

# Returns
Number of characters before null terminator


**Signature:**
```luma
pub const strlen -> fn(s: *char) int;
```

**Parameters:**
* `s` - String to measure

**Returns:**
Number of characters before null terminator

**Example:**
```luma
let len: int = string::strlen("Hello");
// len will be 5
```

### public `from_byte`

Converts a single byte to a string

Creates a 2-byte string containing the character and a null terminator.

Converts a single byte to a string

Creates a 2-byte string containing the character and a null terminator.

# Parameters
* `c` - Character to convert

Converts a single byte to a string

Creates a 2-byte string containing the character and a null terminator.

# Parameters
* `c` - Character to convert

# Returns
Newly allocated string containing the character


**Signature:**
```luma
#returns_ownership pub const from_byte -> fn(c: char) *char;
```

**Parameters:**
* `c` - Character to convert

**Returns:**
Newly allocated string containing the character

**Example:**
```luma
let str: *byte = string::from_byte('A');
defer { free(str); }
output(str); // Prints "A"
```

### public `from_int`

Converts an integer to a string

Handles both positive and negative integers. For zero, returns "0".

Converts an integer to a string

Handles both positive and negative integers. For zero, returns "0".

# Parameters
* `n` - Integer to convert

Converts an integer to a string

Handles both positive and negative integers. For zero, returns "0".

# Parameters
* `n` - Integer to convert

# Returns
Newly allocated string representation of the integer


**Signature:**
```luma
#returns_ownership pub const from_int -> fn(n: int) *char;
```

**Parameters:**
* `n` - Integer to convert

**Returns:**
Newly allocated string representation of the integer

**Example:**
```luma
let str: *byte = string::from_int(-42);
defer { free(str); }
output(str); // Prints "-42"
```

### public `from_float`

Converts a float to a string with specified precision

Separates integer and fractional parts, then combines them with
a decimal point. Precision determines number of decimal places.

Converts a float to a string with specified precision

Separates integer and fractional parts, then combines them with
a decimal point. Precision determines number of decimal places.

# Parameters
* `f` - Float value to convert
* `precision` - Number of decimal places to include

Converts a float to a string with specified precision

Separates integer and fractional parts, then combines them with
a decimal point. Precision determines number of decimal places.

# Parameters
* `f` - Float value to convert
* `precision` - Number of decimal places to include

# Returns
Newly allocated string representation of the float


**Signature:**
```luma
#returns_ownership pub const from_float -> fn(f: float, precision: int) *char;
```

**Parameters:**
* `f` - Float value to convert
* `precision` - Number of decimal places to include

**Returns:**
Newly allocated string representation of the float

**Example:**
```luma
let str: *byte = string::from_float(3.14159, 2);
defer { free(str); }
output(str); // Prints "3.14"
```

### public `int_to_str`

Converts integer to string into a provided buffer

Writes the string representation directly into the provided buffer
instead of allocating new memory.

Converts integer to string into a provided buffer

Writes the string representation directly into the provided buffer
instead of allocating new memory.

# Parameters
* `num` - Integer to convert
* `buf` - Buffer to write string into
* `buf_size` - Size of buffer in bytes

# Example
```luma
let buffer: [byte; 32];
string::int_to_str(12345, &buffer[0], 32);
output(&buffer[0]); // Prints "12345"
```
Converts integer to string into a provided buffer

Writes the string representation directly into the provided buffer
instead of allocating new memory.

# Parameters
* `num` - Integer to convert
* `buf` - Buffer to write string into
* `buf_size` - Size of buffer in bytes


**Signature:**
```luma
pub const int_to_str -> fn(num: int, buf: *char, buf_size: int) void;
```

**Parameters:**
* `num` - Integer to convert
* `buf` - Buffer to write string into
* `buf_size` - Size of buffer in bytes

**Example:**
```luma
let buffer: [byte; 32];
string::int_to_str(12345, &buffer[0], 32);
output(&buffer[0]); // Prints "12345"
```

### public `strcmp`

Compares two strings for equality

First checks if lengths differ, then compares contents byte by byte.

Compares two strings for equality

First checks if lengths differ, then compares contents byte by byte.

# Parameters
* `s1` - First string
* `s2` - Second string

Compares two strings for equality

First checks if lengths differ, then compares contents byte by byte.

# Parameters
* `s1` - First string
* `s2` - Second string

# Returns
* `0` if strings are equal
* `-1` if lengths differ
* `1` if contents differ but lengths match


**Signature:**
```luma
pub const strcmp -> fn(s1: *char, s2: *char) int;
```

**Parameters:**
* `s1` - First string
* `s2` - Second string

**Returns:**
* `0` if strings are equal
* `-1` if lengths differ
* `1` if contents differ but lengths match

**Example:**
```luma
if (string::strcmp("hello", "hello") == 0) {
    output("Strings are equal\n");
}
```

### public `s_byte`

Searches for a character in a string

Returns the first occurrence of the character, or null byte if not found.

Searches for a character in a string

Returns the first occurrence of the character, or null byte if not found.

# Parameters
* `s` - String to search
* `c` - Character to find (as int)

Searches for a character in a string

Returns the first occurrence of the character, or null byte if not found.

# Parameters
* `s` - String to search
* `c` - Character to find (as int)

# Returns
The matching character if found, null byte otherwise


**Signature:**
```luma
pub const s_byte -> fn(s: *char, c: int) char;
```

**Parameters:**
* `s` - String to search
* `c` - Character to find (as int)

**Returns:**
The matching character if found, null byte otherwise

**Example:**
```luma
let ch: byte = string::s_byte("Hello", cast<int>('l'));
if (ch != cast<byte>(0)) {
    output("Found 'l'\n");
}
```

### public `copy`

Copies a string from source to destination

Copies characters including the null terminator.

Copies a string from source to destination

Copies characters including the null terminator.

# Parameters
* `dest` - Destination buffer (must be large enough)
* `src` - Source string

Copies a string from source to destination

Copies characters including the null terminator.

# Parameters
* `dest` - Destination buffer (must be large enough)
* `src` - Source string

# Returns
Destination pointer


**Signature:**
```luma
pub const copy -> fn(dest: *char, src: *char) *char;
```

**Parameters:**
* `dest` - Destination buffer (must be large enough)
* `src` - Source string

**Returns:**
Destination pointer

**Example:**
```luma
let buffer: [byte; 100];
string::copy(&buffer[0], "Hello");
```

### public `n_copy`

Copies at most n bytes of a string

Stops at null terminator or after n characters, whichever comes first.

Copies at most n bytes of a string

Stops at null terminator or after n characters, whichever comes first.

# Parameters
* `dest` - Destination buffer
* `src` - Source string
* `n` - Maximum bytes to copy

Copies at most n bytes of a string

Stops at null terminator or after n characters, whichever comes first.

# Parameters
* `dest` - Destination buffer
* `src` - Source string
* `n` - Maximum bytes to copy

# Returns
Destination pointer


**Signature:**
```luma
pub const n_copy -> fn(dest: *char, src: *char, n: int) *char;
```

**Parameters:**
* `dest` - Destination buffer
* `src` - Source string
* `n` - Maximum bytes to copy

**Returns:**
Destination pointer

**Example:**
```luma
let buffer: [byte; 10];
string::n_copy(&buffer[0], "Hello World", 5); // Copies "Hello"
```

### public `cat`

Concatenates two strings into a destination buffer

Writes s1 followed by s2 into dest, with null terminator.

Concatenates two strings into a destination buffer

Writes s1 followed by s2 into dest, with null terminator.

# Parameters
* `dest` - Destination buffer (must be large enough)
* `s1` - First string
* `s2` - Second string

Concatenates two strings into a destination buffer

Writes s1 followed by s2 into dest, with null terminator.

# Parameters
* `dest` - Destination buffer (must be large enough)
* `s1` - First string
* `s2` - Second string

# Returns
Destination pointer


**Signature:**
```luma
pub const cat -> fn(dest: *char, s1: *char, s2: *char) *char;
```

**Parameters:**
* `dest` - Destination buffer (must be large enough)
* `s1` - First string
* `s2` - Second string

**Returns:**
Destination pointer

**Example:**
```luma
let buffer: [byte; 100];
string::cat(&buffer[0], "Hello ", "World");
output(&buffer[0]); // Prints "Hello World"
```

### public `putbyte`

Outputs a single character to the terminal

Handles special characters with proper shell escaping using system commands.
Special handling for newline, tab, quotes, backslash, etc.

Outputs a single character to the terminal

Handles special characters with proper shell escaping using system commands.
Special handling for newline, tab, quotes, backslash, etc.

# Parameters
* `c` - Character to output

Outputs a single character to the terminal

Handles special characters with proper shell escaping using system commands.
Special handling for newline, tab, quotes, backslash, etc.

# Parameters
* `c` - Character to output

# Returns
The character as an int


**Signature:**
```luma
pub const putbyte -> fn(c: char) int;
```

**Parameters:**
* `c` - Character to output

**Returns:**
The character as an int

**Example:**
```luma
string::putbyte('A');
string::putbyte('\n');
```

### public `is_digit`

Checks if a character is a digit (0-9)

Checks if a character is a digit (0-9)

# Parameters
* `ch` - Character to test

Checks if a character is a digit (0-9)

# Parameters
* `ch` - Character to test

# Returns
true if character is '0' through '9', false otherwise


**Signature:**
```luma
pub const is_digit -> fn(ch: char) bool;
```

**Parameters:**
* `ch` - Character to test

**Returns:**
true if character is '0' through '9', false otherwise

**Example:**
```luma
if (string::is_digit('5')) {
    output("It's a digit!\n");
}
```

### public `is_alpha`

Checks if a character is alphabetic or underscore

Accepts uppercase letters (A-Z), lowercase letters (a-z),
underscore (_), and at sign (@).

Checks if a character is alphabetic or underscore

Accepts uppercase letters (A-Z), lowercase letters (a-z),
underscore (_), and at sign (@).

# Parameters
* `ch` - Character to test

Checks if a character is alphabetic or underscore

Accepts uppercase letters (A-Z), lowercase letters (a-z),
underscore (_), and at sign (@).

# Parameters
* `ch` - Character to test

# Returns
true if alphabetic or underscore/at, false otherwise


**Signature:**
```luma
pub const is_alpha -> fn(ch: char) bool;
```

**Parameters:**
* `ch` - Character to test

**Returns:**
true if alphabetic or underscore/at, false otherwise

**Example:**
```luma
if (string::is_alpha('_')) {
    output("Valid identifier character\n");
}
```

### public `is_alnum`

Checks if a character is alphanumeric

Returns true if character is a letter, digit, underscore, or at sign.

Checks if a character is alphanumeric

Returns true if character is a letter, digit, underscore, or at sign.

# Parameters
* `ch` - Character to test

Checks if a character is alphanumeric

Returns true if character is a letter, digit, underscore, or at sign.

# Parameters
* `ch` - Character to test

# Returns
true if alphanumeric, false otherwise


**Signature:**
```luma
pub const is_alnum -> fn(ch: char) bool;
```

**Parameters:**
* `ch` - Character to test

**Returns:**
true if alphanumeric, false otherwise

**Example:**
```luma
if (string::is_alnum('A')) {
    output("Valid identifier character\n");
}
```

### public `atio`

Converts ASCII string to integer

Parses digits from the string until a non-digit character is encountered.
Does not handle negative numbers or leading whitespace.

Converts ASCII string to integer

Parses digits from the string until a non-digit character is encountered.
Does not handle negative numbers or leading whitespace.

# Parameters
* `value` - String to parse

Converts ASCII string to integer

Parses digits from the string until a non-digit character is encountered.
Does not handle negative numbers or leading whitespace.

# Parameters
* `value` - String to parse

# Returns
Parsed integer value


**Signature:**
```luma
pub const atio -> fn(value: *char) int;
```

**Parameters:**
* `value` - String to parse

**Returns:**
Parsed integer value

**Example:**
```luma
let num: int = string::atio("12345");
// num will be 12345
```

### public `string_add`

Adds two large integers represented as strings

Performs arbitrary-precision addition digit by digit with carry propagation.
Both input strings must contain only digits.

Adds two large integers represented as strings

Performs arbitrary-precision addition digit by digit with carry propagation.
Both input strings must contain only digits.

# Parameters
* `num1` - First number as string
* `num2` - Second number as string

Adds two large integers represented as strings

Performs arbitrary-precision addition digit by digit with carry propagation.
Both input strings must contain only digits.

# Parameters
* `num1` - First number as string
* `num2` - Second number as string

# Returns
Sum as newly allocated string


**Signature:**
```luma
#returns_ownership pub const string_add -> fn(num1: *char, num2: *char) *char;
```

**Parameters:**
* `num1` - First number as string
* `num2` - Second number as string

**Returns:**
Sum as newly allocated string

**Example:**
```luma
let result: *byte = string::string_add("999", "1");
defer { free(result); }
output(result); // Prints "1000"
```

