# Module: string

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### `String`

A heap-allocated, growable string.

Fields:
  `data` — null-terminated byte buffer
  `len`  — number of characters, excluding the null terminator
  `cap`  — total allocated bytes, including the null terminator slot

Always construct via `string_new`, `string_from`, or `string_with_capacity`.
Never set `data` manually — the struct assumes it owns the buffer.

| Field | Type | Description |
|-------|------|-------------|
| `data` | *char |  |
| `len` | int |  |
| `cap` | int |  |

**Methods:**

#### `empty()`

Returns true if the string contains no characters.

```luma
empty -> fn(
) bool
```

#### `c_str()`

Returns the raw null-terminated pointer. Safe to pass to C-style APIs.

```luma
c_str -> fn(
) *char
```

#### `length()`

Returns the number of characters (excluding null terminator).

```luma
length -> fn(
) int
```

#### `capacity()`

Returns the total allocated capacity (including null terminator slot).

```luma
capacity -> fn(
) int
```

#### `at()`

Returns the byte at `index`, or '\0' if the index is out of bounds.

```luma
at -> fn(
    index: int
) char
```

#### `equals()`

Returns true if this string's contents equal the null-terminated `other`.
Returns false if either pointer is null.

```luma
equals -> fn(
    other: *char
) bool
```

#### `equals_str()`

Returns true if this string equals another `String`.
Returns false if `other` is null.

```luma
equals_str -> fn(
    other: *String
) bool
```

#### `clear()`

Clears the string content without freeing or reallocating the buffer.
After this call `len` is 0 and `data[0]` is '\0'.

```luma
clear -> fn(
) void
```

#### `reserve()`

Ensures the buffer has at least `new_cap` bytes of capacity.
Reallocates and copies existing content if needed.
No-op if `new_cap` is already satisfied.

```luma
#returns_ownership
reserve -> fn(
    new_cap: int
) void
```

#### `append()`

Appends a null-terminated `*byte` string to the end of this string.
Grows the buffer with a doubling strategy if needed.
No-op if `s` is null or empty.

```luma
#returns_ownership
append -> fn(
    s: *char
) void
```

#### `append_str()`

Appends the contents of another `String` to this one.
No-op if `other` is null.

```luma
#returns_ownership
append_str -> fn(
    other: *String
) void
```

#### `append_char()`

Appends a single byte character to this string.
Grows the buffer if needed.

```luma
#returns_ownership
append_char -> fn(
    c: char
) void
```

#### `prepend()`

Inserts a null-terminated `*byte` string at the beginning of this string.
Grows the buffer with a doubling strategy if needed.
No-op if `s` is null or empty.

```luma
#returns_ownership
prepend -> fn(
    s: *char
) void
```

#### `substring()`

Returns a newly allocated `String` containing bytes `[start, end)`.
Clamps `start` to 0 and `end` to `len` if out of range.
Returns an empty null String `{ data: null, len: 0, cap: 0 }` if the
range is empty or inverted. Caller must free the result.

```luma
#returns_ownership
substring -> fn(
    start: int,
    end: int
) String
```

#### `find_char()`

Returns the index of the first occurrence of byte `c`, or -1 if not found.

```luma
find_char -> fn(
    c: char
) int
```

#### `contains_char()`

Returns true if byte `c` appears anywhere in the string.

```luma
contains_char -> fn(
    c: char
) bool
```

#### `starts_with()`

Returns true if this string starts with the null-terminated `prefix`.
Returns false if `prefix` is null or longer than the string.

```luma
starts_with -> fn(
    prefix: *char
) bool
```

#### `ends_with()`

Returns true if this string ends with the null-terminated `suffix`.
Returns false if `suffix` is null or longer than the string.

```luma
ends_with -> fn(
    suffix: *char
) bool
```

#### `find()`

Returns the index of the first occurrence of the null-terminated substring,
or -1 if not found. Returns 0 if `substr` is empty. Returns -1 if null.

```luma
find -> fn(
    substr: *char
) int
```

#### `contains()`

Returns true if the null-terminated `substr` appears anywhere in the string.

```luma
contains -> fn(
    substr: *char
) bool
```

#### `trim_start()`

Removes leading whitespace (space, tab, newline, carriage return) in place.
Shifts remaining content to the front of the buffer; does not reallocate.

```luma
#returns_ownership
trim_start -> fn(
) void
```

#### `trim_end()`

Removes trailing whitespace (space, tab, newline, carriage return) in place.
Writes null terminators as it walks backward; does not reallocate.

```luma
#returns_ownership
trim_end -> fn(
) void
```

#### `trim()`

Removes both leading and trailing whitespace in place.
Equivalent to calling `trim_start()` then `trim_end()`.

```luma
#returns_ownership
trim -> fn(
) void
```

#### `to_upper()`

Converts all ASCII lowercase letters (a-z) to uppercase in place.

```luma
#returns_ownership
to_upper -> fn(
) void
```

#### `to_lower()`

Converts all ASCII uppercase letters (A-Z) to lowercase in place.

```luma
#returns_ownership
to_lower -> fn(
) void
```


## Functions

### `string_new`

Creates a new empty `String` with an initial capacity of 16 bytes.
Caller must free with `string_free`.

```luma
#returns_ownership
pub string_new -> fn(
) String
```

### `string_from`

Creates a `String` by copying a null-terminated `*byte` string.
If `s` is null, returns an empty string via `string_new`.
Caller must free with `string_free`.

```luma
#returns_ownership
pub string_from -> fn(
    s: *char
) String
```

### `string_with_capacity`

Creates an empty `String` pre-allocated to at least `cap` bytes.
Useful when the final size is known in advance to avoid reallocations.
Minimum capacity is 16 if `cap` < 1. Caller must free with `string_free`.

```luma
#returns_ownership
pub string_with_capacity -> fn(
    cap: int
) String
```

### `string_clone`

Creates a deep copy of an existing `String`.
If `s` is null, returns an empty string via `string_new`.
Caller must free the returned string with `string_free`.

```luma
#returns_ownership
pub string_clone -> fn(
    s: *String
) String
```

### `int_to_str`

Converts a non-negative integer to a `String`.
Uses a fixed 12-byte stack buffer for digit extraction then copies to heap.
Only handles non-negative values — negative input produces incorrect output.
Caller must free with `string_free`.


```luma
#returns_ownership
pub int_to_str -> fn(
    n: int
) String
```

**Example:**
```
let s: String = int_to_str(42);
defer { string_free(&s); }
```

### `string_free`

Frees the internal buffer of a `String` and zeroes its fields.
Safe to call on a null pointer (no-op). After this call the `String`
must not be used — its `data` pointer is set to null.

```luma
#takes_ownership
pub string_free -> fn(
    s: *String
) void
```

