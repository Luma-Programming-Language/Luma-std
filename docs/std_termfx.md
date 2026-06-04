# Module: std_termfx

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


## Functions

### `fg_rgb`

Creates a foreground RGB color escape sequence

Generates an ANSI escape code for 24-bit true color.
Requires terminal support for RGB colors.


```luma
#returns_ownership
pub fg_rgb -> fn(
    r: int,
    g: int,
    b: int
) *char
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

### `bg_rgb`

Creates a background RGB color escape sequence

Generates an ANSI escape code for 24-bit true color background.
Requires terminal support for RGB colors.


```luma
#returns_ownership
pub bg_rgb -> fn(
    r: int,
    g: int,
    b: int
) *char
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

### `move_cursor`

Moves cursor to specific row and column

Creates an ANSI escape sequence to position the cursor.
Coordinates are 1-based (top-left is row=1, col=1).


```luma
#returns_ownership
pub move_cursor -> fn(
    row: int,
    col: int
) *char
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

- **`RESET`** : *char *(constant)* — Reset all terminal formatting to default
- **`BLACK`** : *char *(constant)* — Foreground color: Black
- **`RED`** : *char *(constant)* — Foreground color: Red
- **`GREEN`** : *char *(constant)* — Foreground color: Green
- **`YELLOW`** : *char *(constant)* — Foreground color: Yellow
- **`BLUE`** : *char *(constant)* — Foreground color: Blue
- **`MAGENTA`** : *char *(constant)* — Foreground color: Magenta
- **`CYAN`** : *char *(constant)* — Foreground color: Cyan
- **`WHITE`** : *char *(constant)* — Foreground color: White
- **`BRIGHT_BLACK`** : *char *(constant)* — Bright foreground color: Black (gray)
- **`BRIGHT_RED`** : *char *(constant)* — Bright foreground color: Red
- **`BRIGHT_GREEN`** : *char *(constant)* — Bright foreground color: Green
- **`BRIGHT_YELLOW`** : *char *(constant)* — Bright foreground color: Yellow
- **`BRIGHT_BLUE`** : *char *(constant)* — Bright foreground color: Blue
- **`BRIGHT_MAGENTA`** : *char *(constant)* — Bright foreground color: Magenta
- **`BRIGHT_CYAN`** : *char *(constant)* — Bright foreground color: Cyan
- **`BRIGHT_WHITE`** : *char *(constant)* — Bright foreground color: White
- **`BG_BLACK`** : *char *(constant)* — Background color: Black
- **`BG_RED`** : *char *(constant)* — Background color: Red
- **`BG_GREEN`** : *char *(constant)* — Background color: Green
- **`BG_YELLOW`** : *char *(constant)* — Background color: Yellow
- **`BG_BLUE`** : *char *(constant)* — Background color: Blue
- **`BG_MAGENTA`** : *char *(constant)* — Background color: Magenta
- **`BG_CYAN`** : *char *(constant)* — Background color: Cyan
- **`BG_WHITE`** : *char *(constant)* — Background color: White
- **`BG_BRIGHT_BLACK`** : *char *(constant)* — Bright background color: Black (gray)
- **`BG_BRIGHT_RED`** : *char *(constant)* — Bright background color: Red
- **`BG_BRIGHT_GREEN`** : *char *(constant)* — Bright background color: Green
- **`BG_BRIGHT_YELLOW`** : *char *(constant)* — Bright background color: Yellow
- **`BG_BRIGHT_BLUE`** : *char *(constant)* — Bright background color: Blue
- **`BG_BRIGHT_MAGENTA`** : *char *(constant)* — Bright background color: Magenta
- **`BG_BRIGHT_CYAN`** : *char *(constant)* — Bright background color: Cyan
- **`BG_BRIGHT_WHITE`** : *char *(constant)* — Bright background color: White
- **`BOLD`** : *char *(constant)* — Text style: Bold
- **`DIM`** : *char *(constant)* — Text style: Dim (less bright)
- **`ITALIC`** : *char *(constant)* — Text style: Italic (not always supported)
- **`UNDERLINE`** : *char *(constant)* — Text style: Underline
- **`BLINK`** : *char *(constant)* — Text style: Blink (rarely supported)
- **`INVERT`** : *char *(constant)* — Text style: Invert (swap foreground and background)
- **`HIDDEN`** : *char *(constant)* — Text style: Hidden (invisible text)
- **`STRIKETHROUGH`** : *char *(constant)* — Text style: Strikethrough
- **`CLEAR_SCREEN`** : *char *(constant)* — Clears entire screen
- **`CLEAR_LINE`** : *char *(constant)* — Clears current line
- **`CURSOR_HOME`** : *char *(constant)* — Moves cursor to home position (top-left)
- **`CURSOR_HIDE`** : *char *(constant)* — Hides the cursor
- **`CURSOR_SHOW`** : *char *(constant)* — Shows the cursor
- **`SAVE_CURSOR`** : *char *(constant)* — Saves current cursor position
- **`RESTORE_CURSOR`** : *char *(constant)* — Restores saved cursor position
- **`CLEAR_TO_EOL`** : *char *(constant)* — Clears from cursor to end of line
- **`CLEAR_TO_EOS`** : *char *(constant)* — Clears from cursor to end of screen
