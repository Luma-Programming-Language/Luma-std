# Module: sys

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Functions

### pub `exit`

*No documentation available*

**Signature:**
```luma
pub const exit -> fn(code: int) void;
```

### pub `fork`

*No documentation available*

**Signature:**
```luma
pub const fork -> fn() int;
```

### pub `getpid`

*No documentation available*

**Signature:**
```luma
pub const getpid -> fn() int;
```

### pub `getuid`

*No documentation available*

**Signature:**
```luma
pub const getuid -> fn() int;
```

### pub `getgid`

*No documentation available*

**Signature:**
```luma
pub const getgid -> fn() int;
```

### pub `kill`

*No documentation available*

**Signature:**
```luma
pub const kill -> fn(pid: int, sig: int) int;
```

### pub `wait4`

*No documentation available*

**Signature:**
```luma
pub const wait4 -> fn(pid: int, status: *int, options: int, rusage: *void) int;
```

### pub `execve`

*No documentation available*

**Signature:**
```luma
pub const execve -> fn(path: *char, argv: **char, envp: **char) int;
```

### pub `read`

*No documentation available*

**Signature:**
```luma
pub const read -> fn(fd: int, buf: *void, count: int) int;
```

### pub `write`

*No documentation available*

**Signature:**
```luma
pub const write -> fn(fd: int, buf: *void, count: int) int;
```

### pub `open`

*No documentation available*

**Signature:**
```luma
pub const open -> fn(path: *char, flags: int, mode: int) int;
```

### pub `close`

*No documentation available*

**Signature:**
```luma
pub const close -> fn(fd: int) int;
```

### pub `lseek`

*No documentation available*

**Signature:**
```luma
pub const lseek -> fn(fd: int, offset: int, whence: int) int;
```

### pub `pread`

*No documentation available*

**Signature:**
```luma
pub const pread -> fn(fd: int, buf: *void, count: int, offset: int) int;
```

### pub `pwrite`

*No documentation available*

**Signature:**
```luma
pub const pwrite -> fn(fd: int, buf: *void, count: int, offset: int) int;
```

### pub `dup`

*No documentation available*

**Signature:**
```luma
pub const dup -> fn(oldfd: int) int;
```

### pub `dup2`

*No documentation available*

**Signature:**
```luma
pub const dup2 -> fn(oldfd: int, newfd: int) int;
```

### pub `pipe`

*No documentation available*

**Signature:**
```luma
pub const pipe -> fn(pipefd: *int) int;
```

### pub `unlink`

*No documentation available*

**Signature:**
```luma
pub const unlink -> fn(path: *char) int;
```

### pub `mkdir`

*No documentation available*

**Signature:**
```luma
pub const mkdir -> fn(path: *char, mode: int) int;
```

### pub `rmdir`

*No documentation available*

**Signature:**
```luma
pub const rmdir -> fn(path: *char) int;
```

### pub `chdir`

*No documentation available*

**Signature:**
```luma
pub const chdir -> fn(path: *char) int;
```

### pub `getcwd`

*No documentation available*

**Signature:**
```luma
pub const getcwd -> fn(buf: *char, size: int) *char;
```

### pub `brk`

*No documentation available*

**Signature:**
```luma
pub const brk -> fn(addr: *void) int;
```

### pub `mmap`

*No documentation available*

**Signature:**
```luma
pub const mmap -> fn(addr: *void, length: int, prot: int, flags: int, fd: int, offset: int) *void;
```

### pub `munmap`

*No documentation available*

**Signature:**
```luma
pub const munmap -> fn(addr: *void, length: int) int;
```

### pub `is_error`

*No documentation available*

**Signature:**
```luma
pub const is_error -> fn(result: int) bool;
```

### pub `get_errno`

*No documentation available*

**Signature:**
```luma
pub const get_errno -> fn(result: int) int;
```

### pub `write_str`

*No documentation available*

**Signature:**
```luma
pub const write_str -> fn(fd: int, s: *char) int;
```

### pub `eprint`

*No documentation available*

**Signature:**
```luma
pub const eprint -> fn(s: *char) int;
```

