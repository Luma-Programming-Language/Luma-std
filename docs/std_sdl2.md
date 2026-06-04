# Module: std_sdl2

FFI bindings to SDL2 (Simple DirectMedia Layer) graphics library.

Provides window creation, rendering, input event polling, and timing
functions via raw C FFI calls to libSDL2. Includes helpers for
constructing `SDL_Rect` values with correct C ABI layout.

PLATFORM: Linux x86_64, macOS

# Example
```luma
sdl2::SDL_Init(sdl2::SDL_INIT_VIDEO);
defer sdl2::SDL_Quit();

let win: *void = sdl2::SDL_CreateWindow(
    "Hello", sdl2::SDL_WINDOWPOS_CENTERED, sdl2::SDL_WINDOWPOS_CENTERED,
    800, 600, sdl2::SDL_WINDOW_SHOWN
);
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### public `SDL_Rect`

SDL rectangle type with C ABI-compatible layout

Stores four 32-bit little-endian integers (x, y, w, h) in a
16-byte buffer to match the C `SDL_Rect` layout on x86_64.

**Fields:**

- `data`: [char; 16]

## Functions

### public `make_rect`

Create an SDL_Rect with the given position and size

Create an SDL_Rect with the given position and size

# Parameters
* `x` - X coordinate of the top-left corner
* `y` - Y coordinate of the top-left corner
* `w` - Width of the rectangle
* `h` - Height of the rectangle

Create an SDL_Rect with the given position and size

# Parameters
* `x` - X coordinate of the top-left corner
* `y` - Y coordinate of the top-left corner
* `w` - Width of the rectangle
* `h` - Height of the rectangle

# Returns
A new SDL_Rect with the specified dimensions


**Signature:**
```luma
pub const make_rect -> fn(x: int, y: int, w: int, h: int) SDL_Rect;
```

**Parameters:**
* `x` - X coordinate of the top-left corner
* `y` - Y coordinate of the top-left corner
* `w` - Width of the rectangle
* `h` - Height of the rectangle

**Returns:**
A new SDL_Rect with the specified dimensions

**Example:**
```luma
let rect: SDL_Rect = sdl2::make_rect(10, 10, 200, 100);
sdl2::SDL_RenderFillRect(renderer, &rect);
```

### public `event_type`

Extract the event type from an SDL event buffer

Reads the first 4 bytes of an SDL event as a little-endian 32-bit
integer to determine the event type (e.g., SDL_QUIT, SDL_KEYDOWN).

Extract the event type from an SDL event buffer

Reads the first 4 bytes of an SDL event as a little-endian 32-bit
integer to determine the event type (e.g., SDL_QUIT, SDL_KEYDOWN).

# Parameters
* `buf` - Pointer to the SDL event byte buffer

Extract the event type from an SDL event buffer

Reads the first 4 bytes of an SDL event as a little-endian 32-bit
integer to determine the event type (e.g., SDL_QUIT, SDL_KEYDOWN).

# Parameters
* `buf` - Pointer to the SDL event byte buffer

# Returns
The event type as an integer


**Signature:**
```luma
pub const event_type -> fn(buf: *char) int;
```

**Parameters:**
* `buf` - Pointer to the SDL event byte buffer

**Returns:**
The event type as an integer

**Example:**
```luma
let event: [byte; 64] = cast<[byte; 64]>(0);
while (sdl2::SDL_PollEvent(&event)) {
    let t: int = sdl2::event_type(&event);
    if (t == sdl2::SDL_QUIT) { break; }
}
```

## Variables

### public `SDL_INIT_EVERYTHING`

**Type:** int (constant)

Initialize all SDL subsystems

### public `SDL_INIT_AUDIO`

**Type:** int (constant)

Initialize the audio subsystem

### public `SDL_INIT_VIDEO`

**Type:** int (constant)

Initialize the video subsystem

### public `SDL_INIT_TIMER`

**Type:** int (constant)

Initialize the timer subsystem

### public `SDL_INIT_GAMECONTROLLER`

**Type:** int (constant)

Initialize the game controller subsystem

### public `SDL_INIT_EVENTS`

**Type:** int (constant)

Initialize the events subsystem

### public `SDL_WINDOWPOS_CENTERED`

**Type:** int (constant)

Center the window on the display

### public `SDL_WINDOW_SHOWN`

**Type:** int (constant)

Window should be visible

### public `SDL_RENDERER_ACCELERATED`

**Type:** int (constant)

Use hardware-accelerated rendering

### public `SDL_RENDERER_PRESENTVSYNC`

**Type:** int (constant)

Synchronize render presents with vertical refresh

### public `SDL_QUIT`

**Type:** int (constant)

Window close event type

### public `SDL_KEYDOWN`

**Type:** int (constant)

Key down event type

