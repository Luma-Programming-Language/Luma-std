# Module: std_args

Command-line argument parsing and iteration.

Provides utilities for working with command-line arguments (argc/argv).
The Args struct offers array-like access to arguments, while ArgsIter
provides sequential iteration. Arguments are indexed from 0, where
index 0 is typically the program name.

# Example
```luma
const main -> fn (argc: int, argv: **byte) int {
    let args: Args = args::init_args(argc, argv);
    
    if (args.contains("--help")) {
        output("Usage: program [options]\n");
        return 0;
    }
    
    let filename: *byte = args.get(1);
    return 0;
}
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### `ArgsIter`

Iterator for traversing command-line arguments.

Provides methods to peek at, consume, and skip arguments sequentially.
Maintains an internal position that advances with each next() call.


| Field | Type | Description |
|-------|------|-------------|
| `data` | **char |  |
| `remaining` | int | Current position in argument array |

**Methods:**

#### `peek()`

Arguments remaining to iterate
Returns the next argument without consuming it.

Useful for lookahead when parsing arguments that may have
associated values.

@return Pointer to next argument, or null if no more arguments


```luma
peek -> fn(
) *char
```

**Example:**
```luma
let next: *byte = iter.peek();
if (next != cast<*byte>(0) && next[0] != '-') {
    // Next arg is a value, not a flag
    process_value(iter.next());
}
```

#### `next()`

Advances to and returns the next argument.

Consumes the argument and moves the iterator forward.

@return Pointer to next argument, or null if no more arguments


```luma
next -> fn(
) *char
```

**Example:**
```luma
loop {
    let arg: *byte = iter.next();
    if (arg == cast<*byte>(0)) break;
    output(arg);
    output("\n");
}
```

#### `skip()`

Skips n arguments without returning them.

Advances the iterator by n positions or until exhausted,
whichever comes first.

@param n Number of arguments to skip


```luma
skip -> fn(
    n: int
) void
```

**Example:**
```luma
iter.skip(1);  // Skip program name
// Now iter points to first user argument
```

### `Args`

Command-line arguments container.

Wraps argc/argv from main() and provides convenient methods for
accessing and querying arguments. Index 0 is the program name,
subsequent indices are user-provided arguments.


| Field | Type | Description |
|-------|------|-------------|
| `data` | **char |  |
| `count` | int | Array of argument strings |

**Methods:**

#### `len()`

Total number of arguments
Returns the total number of arguments.

@return Argument count including program name at index 0


```luma
len -> fn(
) int
```

**Example:**
```luma
if (args.len() < 2) {
    output("Usage: program <filename>\n");
    return 1;
}
```

#### `is_empty()`

Checks if there are no arguments.

@return -1 (true) if count is 0, 0 (false) otherwise


```luma
is_empty -> fn(
) int
```

**Example:**
```luma
if (args.is_empty()) {
    output("No arguments\n");
}
```

#### `get()`

Retrieves the argument at a specific index.

Returns empty string if index is out of bounds. Does not
modify the Args struct.

@param index Zero-based position of argument
@return Pointer to argument string, or "" if out of bounds


```luma
get -> fn(
    index: int
) *char
```

**Example:**
```luma
let filename: *byte = args.get(1);
if (strcmp(filename, "") != 0) {
    process_file(filename);
}
```

#### `contains()`

Checks if a specific argument exists.

Performs exact string matching against all arguments.

@param val Argument string to search for
@return 1 if found, 0 otherwise


```luma
contains -> fn(
    val: *char
) int
```

**Example:**
```luma
if (args.contains("--verbose")) {
    enable_verbose_mode();
}

if (args.contains("--help") || args.contains("-h")) {
    show_help();
}
```

#### `tail()`

Returns a new Args excluding the first argument.

Creates a new Args struct containing all arguments except
the first (typically the program name). Useful for processing
only user-provided arguments.

@return New Args with count-1 arguments, or empty Args if count <= 1


```luma
tail -> fn(
) Args
```

**Example:**
```luma
let user_args: Args = args.tail();
loop [i: int = 0](i < user_args.len()) : (++i) {
    process_arg(user_args.get(i));
}
```

#### `iter()`

Creates an iterator for the arguments.

Returns an iterator positioned at the first argument.

@return ArgsIter initialized to traverse all arguments


```luma
iter -> fn(
) ArgsIter
```

**Example:**
```luma
let iter: ArgsIter = args.iter();
iter.skip(1);  // Skip program name
loop {
    let arg: *byte = iter.next();
    if (arg == cast<*byte>(0)) break;
    process_arg(arg);
}
```


## Functions

### `init_args`

Initializes Args struct from main() parameters.

Wraps the standard main() argc/argv parameters into an Args struct.
This should be the first call in main() when argument processing is needed.

@param argc Argument count from main()
@param argv Argument vector from main()
@return Initialized Args struct


```luma
pub init_args -> fn(
    argc: int,
    argv: **char
) Args
```

**Example:**
```luma
const main -> fn (argc: int, argv: **byte) int {
    let args: Args = args::init_args(argc, argv);
    
    if (args.contains("--version")) {
        output("Version 1.0.0\n");
        return 0;
    }
    
    return 0;
}
```

