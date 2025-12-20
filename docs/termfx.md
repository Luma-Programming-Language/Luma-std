# Module: termfx

Terminal color and formatting escape codes

This module provides ANSI escape sequences for terminal colors, text styles,
and cursor control. These codes work on most Unix terminals and modern
terminal emulators that support ANSI escape sequences.

# Usage
Simply output the desired escape sequence before your text, then use RESET
to return to default formatting.

# Example
```luma
output(fx::RED);
output("This is red text");
output(fx::RESET);
output("\n");

output(fx::BG_BLUE);
output(fx::BRIGHT_WHITE);
output("White text on blue background");
output(fx::RESET);
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Functions

### public `fg_rgb`

Creates a foreground RGB color escape sequence

Generates an ANSI escape code for 24-bit true color.
Requires terminal support for RGB colors.

Creates a foreground RGB color escape sequence

Generates an ANSI escape code for 24-bit true color.
Requires terminal support for RGB colors.

# Parameters
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

Creates a foreground RGB color escape sequence

Generates an ANSI escape code for 24-bit true color.
Requires terminal support for RGB colors.

# Parameters
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

# Returns
ANSI escape sequence string for the RGB color


**Signature:**
```luma
#returns_ownership pub const fg_rgb -> fn(r: int, g: int, b: int) *char;
```

**Parameters:**
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

**Returns:**
ANSI escape sequence string for the RGB color

**Example:**
```luma
let purple: *byte = fx::fg_rgb(128, 0, 128);
defer { free(purple); }
output(purple);
output("Purple text");
output(fx::RESET);
```

### public `bg_rgb`

Creates a background RGB color escape sequence

Generates an ANSI escape code for 24-bit true color background.
Requires terminal support for RGB colors.

Creates a background RGB color escape sequence

Generates an ANSI escape code for 24-bit true color background.
Requires terminal support for RGB colors.

# Parameters
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

Creates a background RGB color escape sequence

Generates an ANSI escape code for 24-bit true color background.
Requires terminal support for RGB colors.

# Parameters
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

# Returns
ANSI escape sequence string for the RGB background color


**Signature:**
```luma
#returns_ownership pub const bg_rgb -> fn(r: int, g: int, b: int) *char;
```

**Parameters:**
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

**Returns:**
ANSI escape sequence string for the RGB background color

**Example:**
```luma
let bg: *byte = fx::bg_rgb(50, 50, 50);
defer { free(bg); }
output(bg);
output("Text on dark gray background");
output(fx::RESET);
```

### public `move_cursor`

Moves cursor to specific row and column

Creates an ANSI escape sequence to position the cursor.
Coordinates are 1-based (top-left is row=1, col=1).

Moves cursor to specific row and column

Creates an ANSI escape sequence to position the cursor.
Coordinates are 1-based (top-left is row=1, col=1).

# Parameters
* `row` - Row number (1-based)
* `col` - Column number (1-based)

Moves cursor to specific row and column

Creates an ANSI escape sequence to position the cursor.
Coordinates are 1-based (top-left is row=1, col=1).

# Parameters
* `row` - Row number (1-based)
* `col` - Column number (1-based)

# Returns
ANSI escape sequence to move cursor


**Signature:**
```luma
#returns_ownership pub const move_cursor -> fn(row: int, col: int) *char;
```

**Parameters:**
* `row` - Row number (1-based)
* `col` - Column number (1-based)

**Returns:**
ANSI escape sequence to move cursor

**Example:**
```luma
let pos: *byte = fx::move_cursor(10, 20);
defer { free(pos); }
output(pos);
output("Text at row 10, column 20");
```

## Variables

### public `RESET`

**Type:** *char (constant)

Reset all terminal formatting to default

### public `BLACK`

**Type:** *char (constant)

Foreground color: Black

### public `RED`

**Type:** *char (constant)

Foreground color: Red

### public `GREEN`

**Type:** *char (constant)

Foreground color: Green

### public `YELLOW`

**Type:** *char (constant)

Foreground color: Yellow

### public `BLUE`

**Type:** *char (constant)

Foreground color: Blue

### public `MAGENTA`

**Type:** *char (constant)

Foreground color: Magenta

### public `CYAN`

**Type:** *char (constant)

Foreground color: Cyan

### public `WHITE`

**Type:** *char (constant)

Foreground color: White

### public `BRIGHT_BLACK`

**Type:** *char (constant)

Bright foreground color: Black (gray)

### public `BRIGHT_RED`

**Type:** *char (constant)

Bright foreground color: Red

### public `BRIGHT_GREEN`

**Type:** *char (constant)

Bright foreground color: Green

### public `BRIGHT_YELLOW`

**Type:** *char (constant)

Bright foreground color: Yellow

### public `BRIGHT_BLUE`

**Type:** *char (constant)

Bright foreground color: Blue

### public `BRIGHT_MAGENTA`

**Type:** *char (constant)

Bright foreground color: Magenta

### public `BRIGHT_CYAN`

**Type:** *char (constant)

Bright foreground color: Cyan

### public `BRIGHT_WHITE`

**Type:** *char (constant)

Bright foreground color: White

### public `BG_BLACK`

**Type:** *char (constant)

Background color: Black

### public `BG_RED`

**Type:** *char (constant)

Background color: Red

### public `BG_GREEN`

**Type:** *char (constant)

Background color: Green

### public `BG_YELLOW`

**Type:** *char (constant)

Background color: Yellow

### public `BG_BLUE`

**Type:** *char (constant)

Background color: Blue

### public `BG_MAGENTA`

**Type:** *char (constant)

Background color: Magenta

### public `BG_CYAN`

**Type:** *char (constant)

Background color: Cyan

### public `BG_WHITE`

**Type:** *char (constant)

Background color: White

### public `BG_BRIGHT_BLACK`

**Type:** *char (constant)

Bright background color: Black (gray)

### public `BG_BRIGHT_RED`

**Type:** *char (constant)

Bright background color: Red

### public `BG_BRIGHT_GREEN`

**Type:** *char (constant)

Bright background color: Green

### public `BG_BRIGHT_YELLOW`

**Type:** *char (constant)

Bright background color: Yellow

### public `BG_BRIGHT_BLUE`

**Type:** *char (constant)

Bright background color: Blue

### public `BG_BRIGHT_MAGENTA`

**Type:** *char (constant)

Bright background color: Magenta

### public `BG_BRIGHT_CYAN`

**Type:** *char (constant)

Bright background color: Cyan

### public `BG_BRIGHT_WHITE`

**Type:** *char (constant)

Bright background color: White

### public `BOLD`

**Type:** *char (constant)

Text style: Bold

### public `DIM`

**Type:** *char (constant)

Text style: Dim (less bright)

### public `ITALIC`

**Type:** *char (constant)

Text style: Italic (not always supported)

### public `UNDERLINE`

**Type:** *char (constant)

Text style: Underline

### public `BLINK`

**Type:** *char (constant)

Text style: Blink (rarely supported)

### public `INVERT`

**Type:** *char (constant)

Text style: Invert (swap foreground and background)

### public `HIDDEN`

**Type:** *char (constant)

Text style: Hidden (invisible text)

### public `STRIKETHROUGH`

**Type:** *char (constant)

Text style: Strikethrough

### public `CLEAR_SCREEN`

**Type:** *char (constant)

Clears entire screen

### public `CLEAR_LINE`

**Type:** *char (constant)

Clears current line

### public `CURSOR_HOME`

**Type:** *char (constant)

Moves cursor to home position (top-left)

### public `CURSOR_HIDE`

**Type:** *char (constant)

Hides the cursor

### public `CURSOR_SHOW`

**Type:** *char (constant)

Shows the cursor

### public `SAVE_CURSOR`

**Type:** *char (constant)

Saves current cursor position

### public `RESTORE_CURSOR`

**Type:** *char (constant)

Restores saved cursor position

### public `CLEAR_TO_EOL`

**Type:** *char (constant)

Clears from cursor to end of line

### public `CLEAR_TO_EOS`

**Type:** *char (constant)

Clears from cursor to end of screen

