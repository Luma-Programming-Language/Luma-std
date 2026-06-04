# Module: std_libc

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)
- [Linked Libraries](#linked-libraries)


## Functions

### `printf`

```luma
pub printf -> fn(
    fmt: *char,
    val: *char
) int
```

### `puts`

```luma
pub puts -> fn(
    s: *char
) int
```

### `putchar`

```luma
pub putchar -> fn(
    c: int
) int
```

### `getchar`

```luma
pub getchar -> fn(
) int
```

### `fflush`

```luma
pub fflush -> fn(
    stream: *void
) int
```

### `fopen`

```luma
pub fopen -> fn(
    path: *char,
    mode: *char
) *void
```

### `fclose`

```luma
pub fclose -> fn(
    stream: *void
) int
```

### `fread`

```luma
pub fread -> fn(
    ptr: *void,
    size: int,
    count: int,
    stream: *void
) int
```

### `fwrite`

```luma
pub fwrite -> fn(
    ptr: *void,
    size: int,
    count: int,
    stream: *void
) int
```

### `fgets`

```luma
pub fgets -> fn(
    buf: *char,
    n: int,
    stream: *void
) *char
```

### `fputs`

```luma
pub fputs -> fn(
    s: *char,
    stream: *void
) int
```

### `feof`

```luma
pub feof -> fn(
    stream: *void
) int
```

### `ferror`

```luma
pub ferror -> fn(
    stream: *void
) int
```

### `rewind`

```luma
pub rewind -> fn(
    stream: *void
) void
```

### `fseek`

```luma
pub fseek -> fn(
    stream: *void,
    offset: int,
    whence: int
) int
```

### `ftell`

```luma
pub ftell -> fn(
    stream: *void
) int
```

### `remove`

```luma
pub remove -> fn(
    path: *char
) int
```

### `rename`

```luma
pub rename -> fn(
    old: *char,
    new: *char
) int
```

### `tmpfile`

```luma
pub tmpfile -> fn(
) *void
```

### `malloc`

```luma
pub malloc -> fn(
    size: int
) *void
```

### `calloc`

```luma
pub calloc -> fn(
    count: int,
    size: int
) *void
```

### `realloc`

```luma
pub realloc -> fn(
    ptr: *void,
    size: int
) *void
```

### `_free`

```luma
pub _free -> fn(
    ptr: *void
) void
```

### `exit`

```luma
pub exit -> fn(
    code: int
) void
```

### `abort`

```luma
pub abort -> fn(
) void
```

### `abs`

```luma
pub abs -> fn(
    n: int
) int
```

### `atoi`

```luma
pub atoi -> fn(
    s: *char
) int
```

### `atof`

```luma
pub atof -> fn(
    s: *char
) double
```

### `atol`

```luma
pub atol -> fn(
    s: *char
) int
```

### `rand`

```luma
pub rand -> fn(
) int
```

### `srand`

```luma
pub srand -> fn(
    seed: int
) void
```

### `getenv`

```luma
pub getenv -> fn(
    name: *char
) *char
```

### `_system`

```luma
pub _system -> fn(
    cmd: *char
) int
```

### `qsort`

```luma
pub qsort -> fn(
    base: *void,
    count: int,
    size: int,
    cmp: *void
) void
```

### `bsearch`

```luma
pub bsearch -> fn(
    key: *void,
    base: *void,
    count: int,
    size: int,
    cmp: *void
) *void
```

### `time`

```luma
pub time -> fn(
    t: *int
) int
```

### `clock`

```luma
pub clock -> fn(
) int
```

### `difftime`

```luma
pub difftime -> fn(
    t1: int,
    t0: int
) double
```

### `strlen`

```luma
pub strlen -> fn(
    s: *char
) int
```

### `strcpy`

```luma
pub strcpy -> fn(
    dst: *char,
    src: *char
) *char
```

### `strncpy`

```luma
pub strncpy -> fn(
    dst: *char,
    src: *char,
    n: int
) *char
```

### `strcat`

```luma
pub strcat -> fn(
    dst: *char,
    src: *char
) *char
```

### `strncat`

```luma
pub strncat -> fn(
    dst: *char,
    src: *char,
    n: int
) *char
```

### `strcmp`

```luma
pub strcmp -> fn(
    a: *char,
    b: *char
) int
```

### `strncmp`

```luma
pub strncmp -> fn(
    a: *char,
    b: *char,
    n: int
) int
```

### `strchr`

```luma
pub strchr -> fn(
    s: *char,
    c: int
) *char
```

### `strrchr`

```luma
pub strrchr -> fn(
    s: *char,
    c: int
) *char
```

### `strstr`

```luma
pub strstr -> fn(
    haystack: *char,
    needle: *char
) *char
```

### `strtok`

```luma
pub strtok -> fn(
    s: *char,
    delim: *char
) *char
```

### `memset`

```luma
pub memset -> fn(
    ptr: *void,
    val: int,
    n: int
) *void
```

### `memcpy`

```luma
pub memcpy -> fn(
    dst: *void,
    src: *void,
    n: int
) *void
```

### `memmove`

```luma
pub memmove -> fn(
    dst: *void,
    src: *void,
    n: int
) *void
```

### `memcmp`

```luma
pub memcmp -> fn(
    a: *void,
    b: *void,
    n: int
) int
```

### `sqrt`

```luma
#lib_import("libm.so")
pub sqrt -> fn(
    x: double
) double
```

### `pow`

```luma
#lib_import("libm.so")
pub pow -> fn(
    base: double,
    exp: double
) double
```

### `floor`

```luma
#lib_import("libm.so")
pub floor -> fn(
    x: double
) double
```

### `ceil`

```luma
#lib_import("libm.so")
pub ceil -> fn(
    x: double
) double
```

### `fabs`

```luma
#lib_import("libm.so")
pub fabs -> fn(
    x: double
) double
```

### `fmod`

```luma
#lib_import("libm.so")
pub fmod -> fn(
    x: double,
    y: double
) double
```

### `log`

```luma
#lib_import("libm.so")
pub log -> fn(
    x: double
) double
```

### `log2`

```luma
#lib_import("libm.so")
pub log2 -> fn(
    x: double
) double
```

### `log10`

```luma
#lib_import("libm.so")
pub log10 -> fn(
    x: double
) double
```

### `exp`

```luma
#lib_import("libm.so")
pub exp -> fn(
    x: double
) double
```

### `sin`

```luma
#lib_import("libm.so")
pub sin -> fn(
    x: double
) double
```

### `cos`

```luma
#lib_import("libm.so")
pub cos -> fn(
    x: double
) double
```

### `tan`

```luma
#lib_import("libm.so")
pub tan -> fn(
    x: double
) double
```

### `atan2`

```luma
#lib_import("libm.so")
pub atan2 -> fn(
    y: double,
    x: double
) double
```


## Linked Libraries

External native libraries linked by this module.

> **FFI library:** `libc.so.6`
>

