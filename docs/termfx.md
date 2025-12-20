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

### pub `fg_rgb`

Creates a foreground RGB color escape sequence

Generates an ANSI escape code for 24-bit true color.
Requires terminal support for RGB colors.

# Parameters
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

# Returns
ANSI escape sequence string for the RGB color

# Example
```luma
let purple: *byte = fx::fg_rgb(128, 0, 128);
defer { free(purple); }
output(purple);
output("Purple text");
output(fx::RESET);
```

**Signature:**
```luma
#returns_ownership pub const fg_rgb -> fn(r: int, g: int, b: int) *char;
```

### pub `bg_rgb`

Creates a background RGB color escape sequence

Generates an ANSI escape code for 24-bit true color background.
Requires terminal support for RGB colors.

# Parameters
* `r` - Red component (0-255)
* `g` - Green component (0-255)
* `b` - Blue component (0-255)

# Returns
ANSI escape sequence string for the RGB background color

# Example
```luma
let bg: *byte = fx::bg_rgb(50, 50, 50);
defer { free(bg); }
output(bg);
output("Text on dark gray background");
output(fx::RESET);
```

**Signature:**
```luma
#returns_ownership pub const bg_rgb -> fn(r: int, g: int, b: int) *char;
```

### pub `move_cursor`

Moves cursor to specific row and column

Creates an ANSI escape sequence to position the cursor.
Coordinates are 1-based (top-left is row=1, col=1).

# Parameters
* `row` - Row number (1-based)
* `col` - Column number (1-based)

# Returns
ANSI escape sequence to move cursor

# Example
```luma
let pos: *byte = fx::move_cursor(10, 20);
defer { free(pos); }
output(pos);
output("Text at row 10, column 20");
```

**Signature:**
```luma
#returns_ownership pub const move_cursor -> fn(row: int, col: int) *char;
```

## Variables

### pub `RESET`

**Type:** *char (constant)

Reset all terminal formatting to default

### pub `BLACK`

**Type:** *char (constant)

Foreground color: Black

### pub `RED`

**Type:** *char (constant)

Foreground color: Red

### pub `GREEN`

**Type:** *char (constant)

Foreground color: Green

### pub `YELLOW`

**Type:** *char (constant)

Foreground color: Yellow

### pub `BLUE`

**Type:** *char (constant)

Foreground color: Blue

### pub `MAGENTA`

**Type:** *char (constant)

Foreground color: Magenta

### pub `CYAN`

**Type:** *char (constant)

Foreground color: Cyan

### pub `WHITE`

**Type:** *char (constant)

Foreground color: White

### pub `BRIGHT_BLACK`

**Type:** *char (constant)

Bright foreground color: Black (gray)

### pub `BRIGHT_RED`

**Type:** *char (constant)

Bright foreground color: Red

### pub `BRIGHT_GREEN`

**Type:** *char (constant)

Bright foreground color: Green

### pub `BRIGHT_YELLOW`

**Type:** *char (constant)

Bright foreground color: Yellow

### pub `BRIGHT_BLUE`

**Type:** *char (constant)

Bright foreground color: Blue

### pub `BRIGHT_MAGENTA`

**Type:** *char (constant)

Bright foreground color: Magenta

### pub `BRIGHT_CYAN`

**Type:** *char (constant)

Bright foreground color: Cyan

### pub `BRIGHT_WHITE`

**Type:** *char (constant)

Bright foreground color: White

### pub `BG_BLACK`

**Type:** *char (constant)

Background color: Black

### pub `BG_RED`

**Type:** *char (constant)

Background color: Red

### pub `BG_GREEN`

**Type:** *char (constant)

Background color: Green

### pub `BG_YELLOW`

**Type:** *char (constant)

Background color: Yellow

### pub `BG_BLUE`

**Type:** *char (constant)

Background color: Blue

### pub `BG_MAGENTA`

**Type:** *char (constant)

Background color: Magenta

### pub `BG_CYAN`

**Type:** *char (constant)

Background color: Cyan

### pub `BG_WHITE`

**Type:** *char (constant)

Background color: White

### pub `BG_BRIGHT_BLACK`

**Type:** *char (constant)

Bright background color: Black (gray)

### pub `BG_BRIGHT_RED`

**Type:** *char (constant)

Bright background color: Red

### pub `BG_BRIGHT_GREEN`

**Type:** *char (constant)

Bright background color: Green

### pub `BG_BRIGHT_YELLOW`

**Type:** *char (constant)

Bright background color: Yellow

### pub `BG_BRIGHT_BLUE`

**Type:** *char (constant)

Bright background color: Blue

### pub `BG_BRIGHT_MAGENTA`

**Type:** *char (constant)

Bright background color: Magenta

### pub `BG_BRIGHT_CYAN`

**Type:** *char (constant)

Bright background color: Cyan

### pub `BG_BRIGHT_WHITE`

**Type:** *char (constant)

Bright background color: White

### pub `BOLD`

**Type:** *char (constant)

Text style: Bold

### pub `DIM`

**Type:** *char (constant)

Text style: Dim (less bright)

### pub `ITALIC`

**Type:** *char (constant)

Text style: Italic (not always supported)

### pub `UNDERLINE`

**Type:** *char (constant)

Text style: Underline

### pub `BLINK`

**Type:** *char (constant)

Text style: Blink (rarely supported)

### pub `INVERT`

**Type:** *char (constant)

Text style: Invert (swap foreground and background)

### pub `HIDDEN`

**Type:** *char (constant)

Text style: Hidden (invisible text)

### pub `STRIKETHROUGH`

**Type:** *char (constant)

Text style: Strikethrough

### pub `CLEAR_SCREEN`

**Type:** *char (constant)

Clears entire screen

### pub `CLEAR_LINE`

**Type:** *char (constant)

Clears current line

### pub `CURSOR_HOME`

**Type:** *char (constant)

Moves cursor to home position (top-left)

### pub `CURSOR_HIDE`

**Type:** *char (constant)

Hides the cursor

### pub `CURSOR_SHOW`

**Type:** *char (constant)

Shows the cursor

### pub `SAVE_CURSOR`

**Type:** *char (constant)

Saves current cursor position

### pub `RESTORE_CURSOR`

**Type:** *char (constant)

Restores saved cursor position

### pub `CLEAR_TO_EOL`

**Type:** *char (constant)

Clears from cursor to end of line

### pub `CLEAR_TO_EOS`

**Type:** *char (constant)

Clears from cursor to end of screen

