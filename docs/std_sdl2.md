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
- [OS-Specific](#os-specific)

---

## Structures

### `SDL_Rect`

SDL rectangle type with C ABI-compatible layout

Stores four 32-bit little-endian integers (x, y, w, h) in a
16-byte buffer to match the C `SDL_Rect` layout on x86_64.

| Field | Type | Description |
|-------|------|-------------|
| `data` | [char; 16] |  |


## Functions

### `make_rect`

Create an SDL_Rect with the given position and size


```luma
pub make_rect -> fn(
    x: int,
    y: int,
    w: int,
    h: int
) SDL_Rect
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

### `event_type`

Extract the event type from an SDL event buffer

Reads the first 4 bytes of an SDL event as a little-endian 32-bit
integer to determine the event type (e.g., SDL_QUIT, SDL_KEYDOWN).


```luma
pub event_type -> fn(
    buf: *char
) int
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

- **`SDL_INIT_EVERYTHING`** : int *(constant)* — Initialize all SDL subsystems
- **`SDL_INIT_AUDIO`** : int *(constant)* — Initialize the audio subsystem
- **`SDL_INIT_VIDEO`** : int *(constant)* — Initialize the video subsystem
- **`SDL_INIT_TIMER`** : int *(constant)* — Initialize the timer subsystem
- **`SDL_INIT_GAMECONTROLLER`** : int *(constant)* — Initialize the game controller subsystem
- **`SDL_INIT_EVENTS`** : int *(constant)* — Initialize the events subsystem
- **`SDL_WINDOWPOS_CENTERED`** : int *(constant)* — Center the window on the display
- **`SDL_WINDOW_SHOWN`** : int *(constant)* — Window should be visible
- **`SDL_RENDERER_ACCELERATED`** : int *(constant)* — Use hardware-accelerated rendering
- **`SDL_RENDERER_PRESENTVSYNC`** : int *(constant)* — Synchronize render presents with vertical refresh
- **`SDL_QUIT`** : int *(constant)* — Window close event type
- **`SDL_KEYDOWN`** : int *(constant)* — Key down event type

## OS-Specific

### `"linux"`

> **FFI library:** `libSDL2.so`
>

### `"macos"`

> **FFI library:** `libSDL2.dylib`
>

### `"linux"`

### `SDL_Init`

Initialize SDL subsystems

```luma
pub SDL_Init -> fn(
    flags: int
) int
```

### `SDL_Quit`

Shut down SDL

```luma
pub SDL_Quit -> fn(
) void
```

### `SDL_GetError`

Get the last SDL error message

```luma
pub SDL_GetError -> fn(
) *char
```

### `SDL_CreateWindow`

Create a window

```luma
pub SDL_CreateWindow -> fn(
    title: *char,
    x: int,
    y: int,
    w: int,
    h: int,
    flags: int
) *void
```

### `SDL_DestroyWindow`

Destroy a window

```luma
pub SDL_DestroyWindow -> fn(
    window: *void
) void
```

### `SDL_CreateRenderer`

Create a 2D renderer for a window

```luma
pub SDL_CreateRenderer -> fn(
    window: *void,
    index: int,
    flags: int
) *void
```

### `SDL_DestroyRenderer`

Destroy a renderer

```luma
pub SDL_DestroyRenderer -> fn(
    renderer: *void
) void
```

### `SDL_SetRenderDrawColor`

Set the color used for drawing operations

```luma
pub SDL_SetRenderDrawColor -> fn(
    renderer: *void,
    r: int,
    g: int,
    b: int,
    a: int
) int
```

### `SDL_RenderClear`

Clear the current rendering target with the draw color

```luma
pub SDL_RenderClear -> fn(
    renderer: *void
) int
```

### `SDL_RenderPresent`

Present the rendered frame on screen

```luma
pub SDL_RenderPresent -> fn(
    renderer: *void
) void
```

### `SDL_RenderFillRect`

Fill a rectangle on the rendering target

```luma
pub SDL_RenderFillRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderDrawRect`

Draw a rectangle outline on the rendering target

```luma
pub SDL_RenderDrawRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderDrawLine`

Draw a line on the rendering target

```luma
pub SDL_RenderDrawLine -> fn(
    renderer: *void,
    x1: int,
    y1: int,
    x2: int,
    y2: int
) int
```

### `SDL_RenderDrawPoint`

Draw a point on the rendering target

```luma
pub SDL_RenderDrawPoint -> fn(
    renderer: *void,
    x: int,
    y: int
) int
```

### `SDL_PollEvent`

Poll for currently pending events

```luma
pub SDL_PollEvent -> fn(
    event: *void
) int
```

### `SDL_Delay`

Wait a specified number of milliseconds

```luma
pub SDL_Delay -> fn(
    ms: int
) void
```

### `SDL_GetTicks`

Get the number of milliseconds since SDL initialization

```luma
pub SDL_GetTicks -> fn(
) int
```


### `"macos"`

### `SDL_Init`

Initialize SDL subsystems

```luma
pub SDL_Init -> fn(
    flags: int
) int
```

### `SDL_Quit`

Shut down SDL

```luma
pub SDL_Quit -> fn(
) void
```

### `SDL_GetError`

Get the last SDL error message

```luma
pub SDL_GetError -> fn(
) *char
```

### `SDL_CreateWindow`

Create a window

```luma
pub SDL_CreateWindow -> fn(
    title: *char,
    x: int,
    y: int,
    w: int,
    h: int,
    flags: int
) *void
```

### `SDL_DestroyWindow`

Destroy a window

```luma
pub SDL_DestroyWindow -> fn(
    window: *void
) void
```

### `SDL_CreateRenderer`

Create a 2D renderer for a window

```luma
pub SDL_CreateRenderer -> fn(
    window: *void,
    index: int,
    flags: int
) *void
```

### `SDL_DestroyRenderer`

Destroy a renderer

```luma
pub SDL_DestroyRenderer -> fn(
    renderer: *void
) void
```

### `SDL_SetRenderDrawColor`

Set the color used for drawing operations

```luma
pub SDL_SetRenderDrawColor -> fn(
    renderer: *void,
    r: int,
    g: int,
    b: int,
    a: int
) int
```

### `SDL_RenderClear`

Clear the current rendering target with the draw color

```luma
pub SDL_RenderClear -> fn(
    renderer: *void
) int
```

### `SDL_RenderPresent`

Present the rendered frame on screen

```luma
pub SDL_RenderPresent -> fn(
    renderer: *void
) void
```

### `SDL_RenderFillRect`

Fill a rectangle on the rendering target

```luma
pub SDL_RenderFillRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderDrawRect`

Draw a rectangle outline on the rendering target

```luma
pub SDL_RenderDrawRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderDrawLine`

Draw a line on the rendering target

```luma
pub SDL_RenderDrawLine -> fn(
    renderer: *void,
    x1: int,
    y1: int,
    x2: int,
    y2: int
) int
```

### `SDL_RenderDrawPoint`

Draw a point on the rendering target

```luma
pub SDL_RenderDrawPoint -> fn(
    renderer: *void,
    x: int,
    y: int
) int
```

### `SDL_PollEvent`

Poll for currently pending events

```luma
pub SDL_PollEvent -> fn(
    event: *void
) int
```

### `SDL_Delay`

Wait a specified number of milliseconds

```luma
pub SDL_Delay -> fn(
    ms: int
) void
```

### `SDL_GetTicks`

Get the number of milliseconds since SDL initialization

```luma
pub SDL_GetTicks -> fn(
) int
```


