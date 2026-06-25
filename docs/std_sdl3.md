# Module: std_sdl3

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)
- [OS-Specific](#os-specific)

---

## Structures

### `SDL_FRect`

| Field | Type | Description |
|-------|------|-------------|
| `x` | float |  |
| `y` | float |  |
| `w` | float |  |
| `h` | float |  |


## Functions

### `make_rect`

```luma
pub make_rect -> fn(
    x: float,
    y: float,
    w: float,
    h: float
) SDL_FRect
```

### `event_type`

```luma
pub event_type -> fn(
    buf: *char
) int
```

### `key_scancode`

```luma
pub key_scancode -> fn(
    buf: *char
) int
```

### `key_down`

```luma
pub key_down -> fn(
    state: *char,
    scancode: int
) bool
```


## OS-Specific

### `"linux"`

> **FFI library:** `libSDL3.so`
>

### `"macos"`

> **FFI library:** `libSDL3.dylib`
>

### `"linux"`

### `SDL_Init`

```luma
pub SDL_Init -> fn(
    flags: int
) bool
```

### `SDL_Quit`

```luma
pub SDL_Quit -> fn(
) void
```

### `SDL_GetError`

```luma
pub SDL_GetError -> fn(
) *char
```

### `SDL_CreateWindow`

```luma
pub SDL_CreateWindow -> fn(
    title: *char,
    w: int,
    h: int,
    flags: int
) *void
```

### `SDL_DestroyWindow`

```luma
pub SDL_DestroyWindow -> fn(
    window: *void
) void
```

### `SDL_SetWindowPosition`

```luma
pub SDL_SetWindowPosition -> fn(
    window: *void,
    x: int,
    y: int
) int
```

### `SDL_GetWindowSize`

```luma
pub SDL_GetWindowSize -> fn(
    window: *void,
    w: *int,
    h: *int
) void
```

### `SDL_SetWindowTitle`

```luma
pub SDL_SetWindowTitle -> fn(
    window: *void,
    title: *char
) void
```

### `SDL_CreateRenderer`

```luma
pub SDL_CreateRenderer -> fn(
    window: *void,
    name: *char
) *void
```

### `SDL_DestroyRenderer`

```luma
pub SDL_DestroyRenderer -> fn(
    renderer: *void
) void
```

### `SDL_SetRenderVSync`

```luma
pub SDL_SetRenderVSync -> fn(
    renderer: *void,
    vsync: int
) int
```

### `SDL_SetRenderDrawColor`

```luma
pub SDL_SetRenderDrawColor -> fn(
    renderer: *void,
    r: int,
    g: int,
    b: int,
    a: int
) int
```

### `SDL_SetRenderDrawBlendMode`

```luma
pub SDL_SetRenderDrawBlendMode -> fn(
    renderer: *void,
    mode: int
) int
```

### `SDL_RenderClear`

```luma
pub SDL_RenderClear -> fn(
    renderer: *void
) int
```

### `SDL_RenderPresent`

```luma
pub SDL_RenderPresent -> fn(
    renderer: *void
) int
```

### `SDL_RenderFillRect`

```luma
pub SDL_RenderFillRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderRect`

```luma
pub SDL_RenderRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderLine`

```luma
pub SDL_RenderLine -> fn(
    renderer: *void,
    x1: double,
    y1: double,
    x2: double,
    y2: double
) int
```

### `SDL_RenderPoint`

```luma
pub SDL_RenderPoint -> fn(
    renderer: *void,
    x: double,
    y: double
) int
```

### `SDL_PollEvent`

```luma
pub SDL_PollEvent -> fn(
    event: *void
) int
```

### `SDL_GetKeyboardState`

```luma
pub SDL_GetKeyboardState -> fn(
    numkeys: *int
) *bool
```

### `SDL_GetMouseState`

```luma
pub SDL_GetMouseState -> fn(
    x: *double,
    y: *double
) int
```

### `SDL_GetTicks`

```luma
pub SDL_GetTicks -> fn(
) int
```

### `SDL_Delay`

```luma
pub SDL_Delay -> fn(
    ms: int
) void
```


### `"macos"`

### `SDL_Init`

```luma
pub SDL_Init -> fn(
    flags: int
) bool
```

### `SDL_Quit`

```luma
pub SDL_Quit -> fn(
) void
```

### `SDL_GetError`

```luma
pub SDL_GetError -> fn(
) *char
```

### `SDL_CreateWindow`

```luma
pub SDL_CreateWindow -> fn(
    title: *char,
    w: int,
    h: int,
    flags: int
) *void
```

### `SDL_DestroyWindow`

```luma
pub SDL_DestroyWindow -> fn(
    window: *void
) void
```

### `SDL_SetWindowPosition`

```luma
pub SDL_SetWindowPosition -> fn(
    window: *void,
    x: int,
    y: int
) int
```

### `SDL_GetWindowSize`

```luma
pub SDL_GetWindowSize -> fn(
    window: *void,
    w: *int,
    h: *int
) void
```

### `SDL_SetWindowTitle`

```luma
pub SDL_SetWindowTitle -> fn(
    window: *void,
    title: *char
) void
```

### `SDL_CreateRenderer`

```luma
pub SDL_CreateRenderer -> fn(
    window: *void,
    name: *char
) *void
```

### `SDL_DestroyRenderer`

```luma
pub SDL_DestroyRenderer -> fn(
    renderer: *void
) void
```

### `SDL_SetRenderVSync`

```luma
pub SDL_SetRenderVSync -> fn(
    renderer: *void,
    vsync: int
) int
```

### `SDL_SetRenderDrawColor`

```luma
pub SDL_SetRenderDrawColor -> fn(
    renderer: *void,
    r: int,
    g: int,
    b: int,
    a: int
) int
```

### `SDL_SetRenderDrawBlendMode`

```luma
pub SDL_SetRenderDrawBlendMode -> fn(
    renderer: *void,
    mode: int
) int
```

### `SDL_RenderClear`

```luma
pub SDL_RenderClear -> fn(
    renderer: *void
) int
```

### `SDL_RenderPresent`

```luma
pub SDL_RenderPresent -> fn(
    renderer: *void
) int
```

### `SDL_RenderFillRect`

```luma
pub SDL_RenderFillRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderRect`

```luma
pub SDL_RenderRect -> fn(
    renderer: *void,
    rect: *void
) int
```

### `SDL_RenderLine`

```luma
pub SDL_RenderLine -> fn(
    renderer: *void,
    x1: double,
    y1: double,
    x2: double,
    y2: double
) int
```

### `SDL_RenderPoint`

```luma
pub SDL_RenderPoint -> fn(
    renderer: *void,
    x: double,
    y: double
) int
```

### `SDL_PollEvent`

```luma
pub SDL_PollEvent -> fn(
    event: *void
) int
```

### `SDL_GetKeyboardState`

```luma
pub SDL_GetKeyboardState -> fn(
    numkeys: *int
) *char
```

### `SDL_GetMouseState`

```luma
pub SDL_GetMouseState -> fn(
    x: *double,
    y: *double
) int
```

### `SDL_GetTicks`

```luma
pub SDL_GetTicks -> fn(
) int
```

### `SDL_Delay`

```luma
pub SDL_Delay -> fn(
    ms: int
) void
```


