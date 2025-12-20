# Module: terminal

Terminal input/output and raw mode control

This module provides functions for reading keyboard input without
line buffering, password input, and terminal mode control. It uses
shell commands (stty) to manipulate terminal settings.

# Raw Mode
Raw mode disables line buffering and echo, allowing character-by-character
input without waiting for Enter. Always call disable_raw_mode() when done
or use defer to ensure cleanup.

# Example
```luma
terminal::enable_raw_mode();
defer { terminal::disable_raw_mode(); }

output("Press any key: ");
let key: byte = terminal::getch_raw();
output("You pressed: ");
string::putbyte(key);
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Functions

### pub `enable_raw_mode`

Enables raw terminal mode for blocking character input

In raw mode:
- Input is read character-by-character (no line buffering)
- Echo is disabled (typed characters don't appear)
- Special keys like Ctrl+C don't generate signals
- Cursor is hidden

This blocks waiting for input. Call disable_raw_mode() when done.

**Signature:**
```luma
pub const enable_raw_mode -> fn() void;
```

### pub `disable_raw_mode`

Disables raw mode and restores normal terminal settings

Restores the terminal to its state before enable_raw_mode() was called.
Shows the cursor and resets colors.

**Signature:**
```luma
pub const disable_raw_mode -> fn() void;
```

### pub `getch_raw`

Reads a single character in raw mode (blocking)

Waits for a key press and returns it immediately without requiring Enter.
Automatically enables raw mode if not already enabled.

# Returns
The character that was pressed

# Example
```luma
terminal::enable_raw_mode();
defer { terminal::disable_raw_mode(); }
let ch: byte = terminal::getch_raw();
```

**Signature:**
```luma
pub const getch_raw -> fn() char;
```

### pub `getch`

Gets a single character without waiting for Enter

Simple character input without modifying terminal settings.

# Returns
The character that was entered

**Signature:**
```luma
pub const getch -> fn() char;
```

### pub `getch_silent`

Gets a single character without echo (silent input)

Temporarily disables echo, reads one character, then restores echo.

# Returns
The character that was pressed (not displayed)

# Example
```luma
output("Enter secret code: ");
let code: byte = terminal::getch_silent();
```

**Signature:**
```luma
pub const getch_silent -> fn() char;
```

### pub `getche`

Gets a single character with echo

Reads one character and displays it.

# Returns
The character that was entered

**Signature:**
```luma
#returns_ownership pub const getche -> fn() char;
```

### pub `kbhit`

Checks if a key is pressed (non-blocking)

Tests for available input without blocking.

# Returns
1 if a key is available, 0 otherwise

# Warning
This consumes the character! Don't use in raw mode.

**Signature:**
```luma
pub const kbhit -> fn() int;
```

### pub `wait_for_key`

Waits for any key press with prompt

Displays a prompt and waits for any key to be pressed.

# Example
```luma
terminal::wait_for_key();
```

**Signature:**
```luma
pub const wait_for_key -> fn() void;
```

### pub `clear_input_buffer`

Clears the input buffer

Reads and discards any pending input.

**Signature:**
```luma
pub const clear_input_buffer -> fn() void;
```

### pub `getpass`

Gets password input with hidden characters

Displays a prompt and reads input without echo, showing asterisks
for each character typed. Handles backspace.

# Parameters
* `prompt` - Prompt to display before reading

# Returns
Newly allocated string containing the password

# Example
```luma
let pass: *byte = terminal::getpass("Enter password: ");
defer { free(pass); }
// ... use password ...
```

**Signature:**
```luma
#returns_ownership pub const getpass -> fn(prompt: *char) *char;
```

### pub `sleep_ms`

Sleeps for milliseconds

More precise than system("sleep"). Uses usleep internally.

# Parameters
* `ms` - Milliseconds to sleep

# Example
```luma
output("Waiting...\n");
terminal::sleep_ms(1000); // Wait 1 second
output("Done!\n");
```

**Signature:**
```luma
pub const sleep_ms -> fn(ms: int) void;
```

### pub `get_terminal_size`

Gets terminal size (stub - writes to temp files)

Writes terminal dimensions to temporary files.
Implementation incomplete - needs file reading.

**Signature:**
```luma
pub const get_terminal_size -> fn() void;
```

### pub `get_line`

Reads a line of input with prompt

Displays a prompt and reads characters until Enter is pressed.

# Parameters
* `prompt` - Prompt to display
* `buffer` - Buffer to store input
* `size` - Size of buffer

# Example
```luma
let buffer: [byte; 100];
terminal::get_line("Enter name: ", &buffer[0], 100);
```

**Signature:**
```luma
pub const get_line -> fn(prompt: *char, buffer: *char, size: int) void;
```

## Variables

### priv `raw_mode_enabled`

**Type:** int (mutable)

Global flag to track raw mode state

