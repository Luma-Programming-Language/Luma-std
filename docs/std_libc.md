# Module: std_libc

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Functions

### public `printf`

**Signature:**
```luma
pub const printf -> fn(fmt: *char, val: *char) int;
```

### public `puts`

**Signature:**
```luma
pub const puts -> fn(s: *char) int;
```

### public `putchar`

**Signature:**
```luma
pub const putchar -> fn(c: int) int;
```

### public `getchar`

**Signature:**
```luma
pub const getchar -> fn() int;
```

### public `fflush`

**Signature:**
```luma
pub const fflush -> fn(stream: *void) int;
```

### public `fopen`

**Signature:**
```luma
pub const fopen -> fn(path: *char, mode: *char) *void;
```

### public `fclose`

**Signature:**
```luma
pub const fclose -> fn(stream: *void) int;
```

### public `fread`

**Signature:**
```luma
pub const fread -> fn(ptr: *void, size: int, count: int, stream: *void) int;
```

### public `fwrite`

**Signature:**
```luma
pub const fwrite -> fn(ptr: *void, size: int, count: int, stream: *void) int;
```

### public `fgets`

**Signature:**
```luma
pub const fgets -> fn(buf: *char, n: int, stream: *void) *char;
```

### public `fputs`

**Signature:**
```luma
pub const fputs -> fn(s: *char, stream: *void) int;
```

### public `feof`

**Signature:**
```luma
pub const feof -> fn(stream: *void) int;
```

### public `ferror`

**Signature:**
```luma
pub const ferror -> fn(stream: *void) int;
```

### public `rewind`

**Signature:**
```luma
pub const rewind -> fn(stream: *void) void;
```

### public `fseek`

**Signature:**
```luma
pub const fseek -> fn(stream: *void, offset: int, whence: int) int;
```

### public `ftell`

**Signature:**
```luma
pub const ftell -> fn(stream: *void) int;
```

### public `remove`

**Signature:**
```luma
pub const remove -> fn(path: *char) int;
```

### public `rename`

**Signature:**
```luma
pub const rename -> fn(old: *char, new: *char) int;
```

### public `tmpfile`

**Signature:**
```luma
pub const tmpfile -> fn() *void;
```

### public `malloc`

**Signature:**
```luma
pub const malloc -> fn(size: int) *void;
```

### public `calloc`

**Signature:**
```luma
pub const calloc -> fn(count: int, size: int) *void;
```

### public `realloc`

**Signature:**
```luma
pub const realloc -> fn(ptr: *void, size: int) *void;
```

### public `_free`

**Signature:**
```luma
pub const _free -> fn(ptr: *void) void;
```

### public `exit`

**Signature:**
```luma
pub const exit -> fn(code: int) void;
```

### public `abort`

**Signature:**
```luma
pub const abort -> fn() void;
```

### public `abs`

**Signature:**
```luma
pub const abs -> fn(n: int) int;
```

### public `atoi`

**Signature:**
```luma
pub const atoi -> fn(s: *char) int;
```

### public `atof`

**Signature:**
```luma
pub const atof -> fn(s: *char) double;
```

### public `atol`

**Signature:**
```luma
pub const atol -> fn(s: *char) int;
```

### public `rand`

**Signature:**
```luma
pub const rand -> fn() int;
```

### public `srand`

**Signature:**
```luma
pub const srand -> fn(seed: int) void;
```

### public `getenv`

**Signature:**
```luma
pub const getenv -> fn(name: *char) *char;
```

### public `_system`

**Signature:**
```luma
pub const _system -> fn(cmd: *char) int;
```

### public `qsort`

**Signature:**
```luma
pub const qsort -> fn(base: *void, count: int, size: int, cmp: *void) void;
```

### public `bsearch`

**Signature:**
```luma
pub const bsearch -> fn(key: *void, base: *void, count: int, size: int, cmp: *void) *void;
```

### public `time`

**Signature:**
```luma
pub const time -> fn(t: *int) int;
```

### public `clock`

**Signature:**
```luma
pub const clock -> fn() int;
```

### public `difftime`

**Signature:**
```luma
pub const difftime -> fn(t1: int, t0: int) double;
```

### public `strlen`

**Signature:**
```luma
pub const strlen -> fn(s: *char) int;
```

### public `strcpy`

**Signature:**
```luma
pub const strcpy -> fn(dst: *char, src: *char) *char;
```

### public `strncpy`

**Signature:**
```luma
pub const strncpy -> fn(dst: *char, src: *char, n: int) *char;
```

### public `strcat`

**Signature:**
```luma
pub const strcat -> fn(dst: *char, src: *char) *char;
```

### public `strncat`

**Signature:**
```luma
pub const strncat -> fn(dst: *char, src: *char, n: int) *char;
```

### public `strcmp`

**Signature:**
```luma
pub const strcmp -> fn(a: *char, b: *char) int;
```

### public `strncmp`

**Signature:**
```luma
pub const strncmp -> fn(a: *char, b: *char, n: int) int;
```

### public `strchr`

**Signature:**
```luma
pub const strchr -> fn(s: *char, c: int) *char;
```

### public `strrchr`

**Signature:**
```luma
pub const strrchr -> fn(s: *char, c: int) *char;
```

### public `strstr`

**Signature:**
```luma
pub const strstr -> fn(haystack: *char, needle: *char) *char;
```

### public `strtok`

**Signature:**
```luma
pub const strtok -> fn(s: *char, delim: *char) *char;
```

### public `memset`

**Signature:**
```luma
pub const memset -> fn(ptr: *void, val: int, n: int) *void;
```

### public `memcpy`

**Signature:**
```luma
pub const memcpy -> fn(dst: *void, src: *void, n: int) *void;
```

### public `memmove`

**Signature:**
```luma
pub const memmove -> fn(dst: *void, src: *void, n: int) *void;
```

### public `memcmp`

**Signature:**
```luma
pub const memcmp -> fn(a: *void, b: *void, n: int) int;
```

### public `sqrt`

**Signature:**
```luma
pub const sqrt -> fn(x: double) double;
```

### public `pow`

**Signature:**
```luma
pub const pow -> fn(base: double, exp: double) double;
```

### public `floor`

**Signature:**
```luma
pub const floor -> fn(x: double) double;
```

### public `ceil`

**Signature:**
```luma
pub const ceil -> fn(x: double) double;
```

### public `fabs`

**Signature:**
```luma
pub const fabs -> fn(x: double) double;
```

### public `fmod`

**Signature:**
```luma
pub const fmod -> fn(x: double, y: double) double;
```

### public `log`

**Signature:**
```luma
pub const log -> fn(x: double) double;
```

### public `log2`

**Signature:**
```luma
pub const log2 -> fn(x: double) double;
```

### public `log10`

**Signature:**
```luma
pub const log10 -> fn(x: double) double;
```

### public `exp`

**Signature:**
```luma
pub const exp -> fn(x: double) double;
```

### public `sin`

**Signature:**
```luma
pub const sin -> fn(x: double) double;
```

### public `cos`

**Signature:**
```luma
pub const cos -> fn(x: double) double;
```

### public `tan`

**Signature:**
```luma
pub const tan -> fn(x: double) double;
```

### public `atan2`

**Signature:**
```luma
pub const atan2 -> fn(y: double, x: double) double;
```

