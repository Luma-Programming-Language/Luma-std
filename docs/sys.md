# Module: sys

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Functions

### public `exit`

**Signature:**
```luma
pub const exit -> fn(code: int) void;
```

### public `fork`

**Signature:**
```luma
pub const fork -> fn() int;
```

### public `getpid`

**Signature:**
```luma
pub const getpid -> fn() int;
```

### public `getuid`

**Signature:**
```luma
pub const getuid -> fn() int;
```

### public `getgid`

**Signature:**
```luma
pub const getgid -> fn() int;
```

### public `kill`

**Signature:**
```luma
pub const kill -> fn(pid: int, sig: int) int;
```

### public `wait4`

**Signature:**
```luma
pub const wait4 -> fn(pid: int, status: *int, options: int, rusage: *void) int;
```

### public `execve`

**Signature:**
```luma
pub const execve -> fn(path: *char, argv: **char, envp: **char) int;
```

### public `read`

**Signature:**
```luma
pub const read -> fn(fd: int, buf: *void, count: int) int;
```

### public `write`

**Signature:**
```luma
pub const write -> fn(fd: int, buf: *void, count: int) int;
```

### public `open`

**Signature:**
```luma
pub const open -> fn(path: *char, flags: int, mode: int) int;
```

### public `close`

**Signature:**
```luma
pub const close -> fn(fd: int) int;
```

### public `lseek`

**Signature:**
```luma
pub const lseek -> fn(fd: int, offset: int, whence: int) int;
```

### public `pread`

**Signature:**
```luma
pub const pread -> fn(fd: int, buf: *void, count: int, offset: int) int;
```

### public `pwrite`

**Signature:**
```luma
pub const pwrite -> fn(fd: int, buf: *void, count: int, offset: int) int;
```

### public `dup`

**Signature:**
```luma
pub const dup -> fn(oldfd: int) int;
```

### public `dup2`

**Signature:**
```luma
pub const dup2 -> fn(oldfd: int, newfd: int) int;
```

### public `pipe`

**Signature:**
```luma
pub const pipe -> fn(pipefd: *int) int;
```

### public `unlink`

**Signature:**
```luma
pub const unlink -> fn(path: *char) int;
```

### public `mkdir`

**Signature:**
```luma
pub const mkdir -> fn(path: *char, mode: int) int;
```

### public `rmdir`

**Signature:**
```luma
pub const rmdir -> fn(path: *char) int;
```

### public `chdir`

**Signature:**
```luma
pub const chdir -> fn(path: *char) int;
```

### public `getcwd`

**Signature:**
```luma
pub const getcwd -> fn(buf: *char, size: int) *char;
```

### public `brk`

**Signature:**
```luma
pub const brk -> fn(addr: *void) int;
```

### public `mmap`

**Signature:**
```luma
pub const mmap -> fn(addr: *void, length: int, prot: int, flags: int, fd: int, offset: int) *void;
```

### public `munmap`

**Signature:**
```luma
pub const munmap -> fn(addr: *void, length: int) int;
```

### public `is_error`

**Signature:**
```luma
pub const is_error -> fn(result: int) bool;
```

### public `get_errno`

**Signature:**
```luma
pub const get_errno -> fn(result: int) int;
```

### public `write_str`

**Signature:**
```luma
pub const write_str -> fn(fd: int, s: *char) int;
```

### public `eprint`

**Signature:**
```luma
pub const eprint -> fn(s: *char) int;
```

