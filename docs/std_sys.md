# Module: std_sys

sys.lx - Unix System Call Interface

PLATFORM: Linux x86_64 and macOS x86_64/ARM64 (via @os blocks)

WARNING: This code will NOT work on:
  - Windows (completely different system call mechanism)
  - ARM/ARM64 Linux (different syscall numbers)
  - 32-bit x86 Linux (different syscall numbers and calling convention)

macOS note: macOS wraps syscalls through libSystem. Direct syscall usage
via the syscall instruction is officially unsupported by Apple and may
break across OS updates. The numbers here reflect the BSD-derived kernel
interface (class 2, i.e. number | 0x2000000) as used internally.
For production macOS code, prefer libc wrappers.

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Functions

### public `exit`

PROCESS MANAGEMENT
Terminate the current process with the given exit code.
PROCESS MANAGEMENT
Terminate the current process with the given exit code.
PROCESS MANAGEMENT
Terminate the current process with the given exit code.

**Signature:**
```luma
pub const exit -> fn(code: int) void;
```

### public `fork`

Fork the current process. Returns the child PID in the parent, 0 in the child.
Fork the current process. Returns the child PID in the parent, 0 in the child.
Fork the current process. Returns the child PID in the parent, 0 in the child.

**Signature:**
```luma
pub const fork -> fn() int;
```

### public `getpid`

Return the PID of the calling process.
Return the PID of the calling process.
Return the PID of the calling process.

**Signature:**
```luma
pub const getpid -> fn() int;
```

### public `getuid`

Return the real user ID of the calling process.
Return the real user ID of the calling process.
Return the real user ID of the calling process.

**Signature:**
```luma
pub const getuid -> fn() int;
```

### public `getgid`

Return the real group ID of the calling process.
Return the real group ID of the calling process.
Return the real group ID of the calling process.

**Signature:**
```luma
pub const getgid -> fn() int;
```

### public `kill`

Send signal `sig` to process `pid`.
Send signal `sig` to process `pid`.
Send signal `sig` to process `pid`.

**Signature:**
```luma
pub const kill -> fn(pid: int, sig: int) int;
```

### public `wait4`

Wait for a child process. Stores exit status in `status` if non-null.
Wait for a child process. Stores exit status in `status` if non-null.
Wait for a child process. Stores exit status in `status` if non-null.

**Signature:**
```luma
pub const wait4 -> fn(pid: int, status: *int, options: int, rusage: *void) int;
```

### public `execve`

Replace the current process image with a new one.
Replace the current process image with a new one.
Replace the current process image with a new one.

**Signature:**
```luma
pub const execve -> fn(path: *char, argv: **char, envp: **char) int;
```

### public `read`

FILE OPERATIONS
Read up to `count` bytes from `fd` into `buf`. Returns bytes read or a negative errno.
FILE OPERATIONS
Read up to `count` bytes from `fd` into `buf`. Returns bytes read or a negative errno.
FILE OPERATIONS
Read up to `count` bytes from `fd` into `buf`. Returns bytes read or a negative errno.

**Signature:**
```luma
pub const read -> fn(fd: int, buf: *void, count: int) int;
```

### public `write`

Write up to `count` bytes from `buf` to `fd`. Returns bytes written or a negative errno.
Write up to `count` bytes from `buf` to `fd`. Returns bytes written or a negative errno.
Write up to `count` bytes from `buf` to `fd`. Returns bytes written or a negative errno.

**Signature:**
```luma
pub const write -> fn(fd: int, buf: *void, count: int) int;
```

### public `open`

Open a file at `path` with the given `flags` and `mode`. Returns an fd or a negative errno.
Open a file at `path` with the given `flags` and `mode`. Returns an fd or a negative errno.
Open a file at `path` with the given `flags` and `mode`. Returns an fd or a negative errno.

**Signature:**
```luma
pub const open -> fn(path: *char, flags: int, mode: int) int;
```

### public `close`

Close the file descriptor `fd`.
Close the file descriptor `fd`.
Close the file descriptor `fd`.

**Signature:**
```luma
pub const close -> fn(fd: int) int;
```

### public `lseek`

Reposition the file offset of `fd`. Returns the new offset or a negative errno.
Reposition the file offset of `fd`. Returns the new offset or a negative errno.
Reposition the file offset of `fd`. Returns the new offset or a negative errno.

**Signature:**
```luma
pub const lseek -> fn(fd: int, offset: int, whence: int) int;
```

### public `pread`

Read up to `count` bytes from `fd` at `offset` without changing the file position.
Read up to `count` bytes from `fd` at `offset` without changing the file position.
Read up to `count` bytes from `fd` at `offset` without changing the file position.

**Signature:**
```luma
pub const pread -> fn(fd: int, buf: *void, count: int, offset: int) int;
```

### public `pwrite`

Write up to `count` bytes to `fd` at `offset` without changing the file position.
Write up to `count` bytes to `fd` at `offset` without changing the file position.
Write up to `count` bytes to `fd` at `offset` without changing the file position.

**Signature:**
```luma
pub const pwrite -> fn(fd: int, buf: *void, count: int, offset: int) int;
```

### public `dup`

Duplicate file descriptor `oldfd`. Returns the new fd or a negative errno.
Duplicate file descriptor `oldfd`. Returns the new fd or a negative errno.
Duplicate file descriptor `oldfd`. Returns the new fd or a negative errno.

**Signature:**
```luma
pub const dup -> fn(oldfd: int) int;
```

### public `dup2`

Duplicate `oldfd` to `newfd`, closing `newfd` first if it is open.
Duplicate `oldfd` to `newfd`, closing `newfd` first if it is open.
Duplicate `oldfd` to `newfd`, closing `newfd` first if it is open.

**Signature:**
```luma
pub const dup2 -> fn(oldfd: int, newfd: int) int;
```

### public `pipe`

Create a pipe. Writes the read and write fds into `pipefd[0]` and `pipefd[1]`.
Create a pipe. Writes the read and write fds into `pipefd[0]` and `pipefd[1]`.
Create a pipe. Writes the read and write fds into `pipefd[0]` and `pipefd[1]`.

**Signature:**
```luma
pub const pipe -> fn(pipefd: *int) int;
```

### public `unlink`

Delete the file at `path`.
Delete the file at `path`.
Delete the file at `path`.

**Signature:**
```luma
pub const unlink -> fn(path: *char) int;
```

### public `mkdir`

DIRECTORY OPERATIONS
Create a directory at `path` with the given `mode`.
DIRECTORY OPERATIONS
Create a directory at `path` with the given `mode`.
DIRECTORY OPERATIONS
Create a directory at `path` with the given `mode`.

**Signature:**
```luma
pub const mkdir -> fn(path: *char, mode: int) int;
```

### public `rmdir`

Remove the empty directory at `path`.
Remove the empty directory at `path`.
Remove the empty directory at `path`.

**Signature:**
```luma
pub const rmdir -> fn(path: *char) int;
```

### public `chdir`

Change the working directory to `path`.
Change the working directory to `path`.
Change the working directory to `path`.

**Signature:**
```luma
pub const chdir -> fn(path: *char) int;
```

### public `getcwd`

Get the current working directory into `buf`. Returns `buf` on success, null on failure.
Get the current working directory into `buf`. Returns `buf` on success, null on failure.
Get the current working directory into `buf`. Returns `buf` on success, null on failure.

**Signature:**
```luma
pub const getcwd -> fn(buf: *char, size: int) *char;
```

### public `brk`

MEMORY MANAGEMENT
Adjust the program break to `addr`. Returns the new break or a negative errno.
MEMORY MANAGEMENT
Adjust the program break to `addr`. Returns the new break or a negative errno.
MEMORY MANAGEMENT
Adjust the program break to `addr`. Returns the new break or a negative errno.

**Signature:**
```luma
pub const brk -> fn(addr: *void) int;
```

### public `mmap`

Map memory. Returns a pointer to the mapped region, or a negative errno cast to *void.
Map memory. Returns a pointer to the mapped region, or a negative errno cast to *void.
Map memory. Returns a pointer to the mapped region, or a negative errno cast to *void.

**Signature:**
```luma
pub const mmap -> fn(addr: *void, length: int, prot: int, flags: int, fd: int, offset: int) *void;
```

### public `munmap`

Unmap a previously mapped region.
Unmap a previously mapped region.
Unmap a previously mapped region.

**Signature:**
```luma
pub const munmap -> fn(addr: *void, length: int) int;
```

### public `is_error`

HELPER FUNCTIONS
Returns true if `result` represents a syscall error (i.e. in the range [-4095, -1]).
HELPER FUNCTIONS
Returns true if `result` represents a syscall error (i.e. in the range [-4095, -1]).
HELPER FUNCTIONS
Returns true if `result` represents a syscall error (i.e. in the range [-4095, -1]).

**Signature:**
```luma
pub const is_error -> fn(result: int) bool;
```

### public `get_errno`

Extract the errno value from a failed syscall result. Returns 0 if not an error.
Extract the errno value from a failed syscall result. Returns 0 if not an error.
Extract the errno value from a failed syscall result. Returns 0 if not an error.

**Signature:**
```luma
pub const get_errno -> fn(result: int) int;
```

### public `write_str`

Write a null-terminated string to `fd`. Returns bytes written or a negative errno.
Write a null-terminated string to `fd`. Returns bytes written or a negative errno.
Write a null-terminated string to `fd`. Returns bytes written or a negative errno.

**Signature:**
```luma
pub const write_str -> fn(fd: int, s: *char) int;
```

### public `eprint`

Write a null-terminated string to stderr.
Write a null-terminated string to stderr.
Write a null-terminated string to stderr.

**Signature:**
```luma
pub const eprint -> fn(s: *char) int;
```

## Variables

### public `O_RDONLY`

**Type:** int (constant)

FILE FLAGS
O_ flags are mostly identical between Linux and macOS with a few exceptions.
These three are the same everywhere

### public `O_WRONLY`

**Type:** int (constant)

### public `O_RDWR`

**Type:** int (constant)

### public `S_IRWXU`

**Type:** int (constant)

FILE PERMISSIONS  (POSIX — identical on both platforms)

### public `S_IRUSR`

**Type:** int (constant)

### public `S_IWUSR`

**Type:** int (constant)

### public `S_IXUSR`

**Type:** int (constant)

### public `S_IRWXG`

**Type:** int (constant)

### public `S_IRGRP`

**Type:** int (constant)

### public `S_IWGRP`

**Type:** int (constant)

### public `S_IXGRP`

**Type:** int (constant)

### public `S_IRWXO`

**Type:** int (constant)

### public `S_IROTH`

**Type:** int (constant)

### public `S_IWOTH`

**Type:** int (constant)

### public `S_IXOTH`

**Type:** int (constant)

### public `MODE_0644`

**Type:** int (constant)

### public `MODE_0755`

**Type:** int (constant)

### public `MODE_0777`

**Type:** int (constant)

### public `SEEK_SET`

**Type:** int (constant)

LSEEK WHENCE  (POSIX — identical on both platforms)

### public `SEEK_CUR`

**Type:** int (constant)

### public `SEEK_END`

**Type:** int (constant)

### public `STDIN`

**Type:** int (constant)

STANDARD FILE DESCRIPTORS  (identical everywhere)

### public `STDOUT`

**Type:** int (constant)

### public `STDERR`

**Type:** int (constant)

### public `PROT_NONE`

**Type:** int (constant)

MMAP PROTECTION FLAGS  (POSIX — identical on both platforms)

### public `PROT_READ`

**Type:** int (constant)

### public `PROT_WRITE`

**Type:** int (constant)

### public `PROT_EXEC`

**Type:** int (constant)

### public `MAP_SHARED`

**Type:** int (constant)

MMAP FLAGS
MAP_ANONYMOUS differs: Linux uses 32, macOS uses 4096.

### public `MAP_PRIVATE`

**Type:** int (constant)

### public `MAP_FIXED`

**Type:** int (constant)

### public `SIGHUP`

**Type:** int (constant)

SIGNALS  (mostly POSIX, but SIGBUS/SIGCHLD positions differ slightly)

### public `SIGINT`

**Type:** int (constant)

### public `SIGQUIT`

**Type:** int (constant)

### public `SIGILL`

**Type:** int (constant)

### public `SIGTRAP`

**Type:** int (constant)

### public `SIGABRT`

**Type:** int (constant)

### public `SIGFPE`

**Type:** int (constant)

### public `SIGKILL`

**Type:** int (constant)

### public `SIGSEGV`

**Type:** int (constant)

### public `SIGPIPE`

**Type:** int (constant)

### public `SIGALRM`

**Type:** int (constant)

### public `SIGTERM`

**Type:** int (constant)

### public `WNOHANG`

**Type:** int (constant)

WAIT FLAGS  (identical on both platforms)

### public `WUNTRACED`

**Type:** int (constant)

### public `EPERM`

**Type:** int (constant)

ERRNO VALUES  (POSIX — same numbers on both platforms for these common ones)

### public `ENOENT`

**Type:** int (constant)

### public `ESRCH`

**Type:** int (constant)

### public `EINTR`

**Type:** int (constant)

### public `EIO`

**Type:** int (constant)

### public `ENXIO`

**Type:** int (constant)

### public `E2BIG`

**Type:** int (constant)

### public `EBADF`

**Type:** int (constant)

### public `ECHILD`

**Type:** int (constant)

### public `EAGAIN`

**Type:** int (constant)

### public `ENOMEM`

**Type:** int (constant)

### public `EACCES`

**Type:** int (constant)

### public `EFAULT`

**Type:** int (constant)

### public `EBUSY`

**Type:** int (constant)

### public `EEXIST`

**Type:** int (constant)

### public `ENODEV`

**Type:** int (constant)

### public `ENOTDIR`

**Type:** int (constant)

### public `EISDIR`

**Type:** int (constant)

### public `EINVAL`

**Type:** int (constant)

### public `ENFILE`

**Type:** int (constant)

### public `EMFILE`

**Type:** int (constant)

### public `ENOSPC`

**Type:** int (constant)

### public `EPIPE`

**Type:** int (constant)

