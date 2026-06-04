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
- [OS-Specific](#os-specific)


## Functions

### `exit`

PROCESS MANAGEMENT
Terminate the current process with the given exit code.

```luma
pub exit -> fn(
    code: int
) void
```

### `fork`

Fork the current process. Returns the child PID in the parent, 0 in the child.

```luma
pub fork -> fn(
) int
```

### `getpid`

Return the PID of the calling process.

```luma
pub getpid -> fn(
) int
```

### `getuid`

Return the real user ID of the calling process.

```luma
pub getuid -> fn(
) int
```

### `getgid`

Return the real group ID of the calling process.

```luma
pub getgid -> fn(
) int
```

### `kill`

Send signal `sig` to process `pid`.

```luma
pub kill -> fn(
    pid: int,
    sig: int
) int
```

### `wait4`

Wait for a child process. Stores exit status in `status` if non-null.

```luma
pub wait4 -> fn(
    pid: int,
    status: *int,
    options: int,
    rusage: *void
) int
```

### `execve`

Replace the current process image with a new one.

```luma
pub execve -> fn(
    path: *char,
    argv: **char,
    envp: **char
) int
```

### `read`

FILE OPERATIONS
Read up to `count` bytes from `fd` into `buf`. Returns bytes read or a negative errno.

```luma
pub read -> fn(
    fd: int,
    buf: *void,
    count: int
) int
```

### `write`

Write up to `count` bytes from `buf` to `fd`. Returns bytes written or a negative errno.

```luma
pub write -> fn(
    fd: int,
    buf: *void,
    count: int
) int
```

### `open`

Open a file at `path` with the given `flags` and `mode`. Returns an fd or a negative errno.

```luma
pub open -> fn(
    path: *char,
    flags: int,
    mode: int
) int
```

### `close`

Close the file descriptor `fd`.

```luma
pub close -> fn(
    fd: int
) int
```

### `lseek`

Reposition the file offset of `fd`. Returns the new offset or a negative errno.

```luma
pub lseek -> fn(
    fd: int,
    offset: int,
    whence: int
) int
```

### `pread`

Read up to `count` bytes from `fd` at `offset` without changing the file position.

```luma
pub pread -> fn(
    fd: int,
    buf: *void,
    count: int,
    offset: int
) int
```

### `pwrite`

Write up to `count` bytes to `fd` at `offset` without changing the file position.

```luma
pub pwrite -> fn(
    fd: int,
    buf: *void,
    count: int,
    offset: int
) int
```

### `dup`

Duplicate file descriptor `oldfd`. Returns the new fd or a negative errno.

```luma
pub dup -> fn(
    oldfd: int
) int
```

### `dup2`

Duplicate `oldfd` to `newfd`, closing `newfd` first if it is open.

```luma
pub dup2 -> fn(
    oldfd: int,
    newfd: int
) int
```

### `pipe`

Create a pipe. Writes the read and write fds into `pipefd[0]` and `pipefd[1]`.

```luma
pub pipe -> fn(
    pipefd: *int
) int
```

### `unlink`

Delete the file at `path`.

```luma
pub unlink -> fn(
    path: *char
) int
```

### `mkdir`

DIRECTORY OPERATIONS
Create a directory at `path` with the given `mode`.

```luma
pub mkdir -> fn(
    path: *char,
    mode: int
) int
```

### `rmdir`

Remove the empty directory at `path`.

```luma
pub rmdir -> fn(
    path: *char
) int
```

### `chdir`

Change the working directory to `path`.

```luma
pub chdir -> fn(
    path: *char
) int
```

### `getcwd`

Get the current working directory into `buf`. Returns `buf` on success, null on failure.

```luma
pub getcwd -> fn(
    buf: *char,
    size: int
) *char
```

### `brk`

MEMORY MANAGEMENT
Adjust the program break to `addr`. Returns the new break or a negative errno.

```luma
pub brk -> fn(
    addr: *void
) int
```

### `mmap`

Map memory. Returns a pointer to the mapped region, or a negative errno cast to *void.

```luma
pub mmap -> fn(
    addr: *void,
    length: int,
    prot: int,
    flags: int,
    fd: int,
    offset: int
) *void
```

### `munmap`

Unmap a previously mapped region.

```luma
pub munmap -> fn(
    addr: *void,
    length: int
) int
```

### `is_error`

HELPER FUNCTIONS
Returns true if `result` represents a syscall error (i.e. in the range [-4095, -1]).

```luma
pub is_error -> fn(
    result: int
) bool
```

### `get_errno`

Extract the errno value from a failed syscall result. Returns 0 if not an error.

```luma
pub get_errno -> fn(
    result: int
) int
```

### `write_str`

Write a null-terminated string to `fd`. Returns bytes written or a negative errno.

```luma
pub write_str -> fn(
    fd: int,
    s: *char
) int
```

### `eprint`

Write a null-terminated string to stderr.

```luma
pub eprint -> fn(
    s: *char
) int
```


## Variables

- **`O_RDONLY`** : int *(constant)* — FILE FLAGS
- **`O_WRONLY`** : int *(constant)*
- **`O_RDWR`** : int *(constant)*
- **`S_IRWXU`** : int *(constant)* — FILE PERMISSIONS  (POSIX — identical on both platforms)
- **`S_IRUSR`** : int *(constant)*
- **`S_IWUSR`** : int *(constant)*
- **`S_IXUSR`** : int *(constant)*
- **`S_IRWXG`** : int *(constant)*
- **`S_IRGRP`** : int *(constant)*
- **`S_IWGRP`** : int *(constant)*
- **`S_IXGRP`** : int *(constant)*
- **`S_IRWXO`** : int *(constant)*
- **`S_IROTH`** : int *(constant)*
- **`S_IWOTH`** : int *(constant)*
- **`S_IXOTH`** : int *(constant)*
- **`MODE_0644`** : int *(constant)*
- **`MODE_0755`** : int *(constant)*
- **`MODE_0777`** : int *(constant)*
- **`SEEK_SET`** : int *(constant)* — LSEEK WHENCE  (POSIX — identical on both platforms)
- **`SEEK_CUR`** : int *(constant)*
- **`SEEK_END`** : int *(constant)*
- **`STDIN`** : int *(constant)* — STANDARD FILE DESCRIPTORS  (identical everywhere)
- **`STDOUT`** : int *(constant)*
- **`STDERR`** : int *(constant)*
- **`PROT_NONE`** : int *(constant)* — MMAP PROTECTION FLAGS  (POSIX — identical on both platforms)
- **`PROT_READ`** : int *(constant)*
- **`PROT_WRITE`** : int *(constant)*
- **`PROT_EXEC`** : int *(constant)*
- **`MAP_SHARED`** : int *(constant)* — MMAP FLAGS
- **`MAP_PRIVATE`** : int *(constant)*
- **`MAP_FIXED`** : int *(constant)*
- **`SIGHUP`** : int *(constant)* — SIGNALS  (mostly POSIX, but SIGBUS/SIGCHLD positions differ slightly)
- **`SIGINT`** : int *(constant)*
- **`SIGQUIT`** : int *(constant)*
- **`SIGILL`** : int *(constant)*
- **`SIGTRAP`** : int *(constant)*
- **`SIGABRT`** : int *(constant)*
- **`SIGFPE`** : int *(constant)*
- **`SIGKILL`** : int *(constant)*
- **`SIGSEGV`** : int *(constant)*
- **`SIGPIPE`** : int *(constant)*
- **`SIGALRM`** : int *(constant)*
- **`SIGTERM`** : int *(constant)*
- **`WNOHANG`** : int *(constant)* — WAIT FLAGS  (identical on both platforms)
- **`WUNTRACED`** : int *(constant)*
- **`EPERM`** : int *(constant)* — ERRNO VALUES  (POSIX — same numbers on both platforms for these common ones)
- **`ENOENT`** : int *(constant)*
- **`ESRCH`** : int *(constant)*
- **`EINTR`** : int *(constant)*
- **`EIO`** : int *(constant)*
- **`ENXIO`** : int *(constant)*
- **`E2BIG`** : int *(constant)*
- **`EBADF`** : int *(constant)*
- **`ECHILD`** : int *(constant)*
- **`EAGAIN`** : int *(constant)*
- **`ENOMEM`** : int *(constant)*
- **`EACCES`** : int *(constant)*
- **`EFAULT`** : int *(constant)*
- **`EBUSY`** : int *(constant)*
- **`EEXIST`** : int *(constant)*
- **`ENODEV`** : int *(constant)*
- **`ENOTDIR`** : int *(constant)*
- **`EISDIR`** : int *(constant)*
- **`EINVAL`** : int *(constant)*
- **`ENFILE`** : int *(constant)*
- **`EMFILE`** : int *(constant)*
- **`ENOSPC`** : int *(constant)*
- **`EPIPE`** : int *(constant)*

## OS-Specific

### `"linux"`

- **`SYS_READ`** : int *(constant)*
- **`SYS_WRITE`** : int *(constant)*
- **`SYS_OPEN`** : int *(constant)*
- **`SYS_CLOSE`** : int *(constant)*
- **`SYS_STAT`** : int *(constant)*
- **`SYS_FSTAT`** : int *(constant)*
- **`SYS_LSTAT`** : int *(constant)*
- **`SYS_LSEEK`** : int *(constant)*
- **`SYS_MMAP`** : int *(constant)*
- **`SYS_MUNMAP`** : int *(constant)*
- **`SYS_BRK`** : int *(constant)*
- **`SYS_IOCTL`** : int *(constant)*
- **`SYS_PREAD`** : int *(constant)*
- **`SYS_PWRITE`** : int *(constant)*
- **`SYS_PIPE`** : int *(constant)*
- **`SYS_SELECT`** : int *(constant)*
- **`SYS_DUP`** : int *(constant)*
- **`SYS_DUP2`** : int *(constant)*
- **`SYS_GETPID`** : int *(constant)*
- **`SYS_FORK`** : int *(constant)*
- **`SYS_EXECVE`** : int *(constant)*
- **`SYS_EXIT`** : int *(constant)*
- **`SYS_WAIT4`** : int *(constant)*
- **`SYS_KILL`** : int *(constant)*
- **`SYS_FCNTL`** : int *(constant)*
- **`SYS_GETCWD`** : int *(constant)*
- **`SYS_CHDIR`** : int *(constant)*
- **`SYS_MKDIR`** : int *(constant)*
- **`SYS_RMDIR`** : int *(constant)*
- **`SYS_UNLINK`** : int *(constant)*
- **`SYS_GETUID`** : int *(constant)*
- **`SYS_GETGID`** : int *(constant)*
- **`SYS_GETTIMEOFDAY`** : int *(constant)*
- **`SYS_CLOCK_GETTIME`** : int *(constant)*

### `"macos"`

- **`SYS_READ`** : int *(constant)* — macOS BSD syscall table (x86_64)
- **`SYS_WRITE`** : int *(constant)*
- **`SYS_OPEN`** : int *(constant)*
- **`SYS_CLOSE`** : int *(constant)*
- **`SYS_STAT`** : int *(constant)*
- **`SYS_FSTAT`** : int *(constant)*
- **`SYS_LSTAT`** : int *(constant)*
- **`SYS_LSEEK`** : int *(constant)*
- **`SYS_MMAP`** : int *(constant)*
- **`SYS_MUNMAP`** : int *(constant)*
- **`SYS_BRK`** : int *(constant)*
- **`SYS_IOCTL`** : int *(constant)*
- **`SYS_PREAD`** : int *(constant)*
- **`SYS_PWRITE`** : int *(constant)*
- **`SYS_PIPE`** : int *(constant)*
- **`SYS_SELECT`** : int *(constant)*
- **`SYS_DUP`** : int *(constant)*
- **`SYS_DUP2`** : int *(constant)*
- **`SYS_GETPID`** : int *(constant)*
- **`SYS_FORK`** : int *(constant)*
- **`SYS_EXECVE`** : int *(constant)*
- **`SYS_EXIT`** : int *(constant)*
- **`SYS_WAIT4`** : int *(constant)*
- **`SYS_KILL`** : int *(constant)*
- **`SYS_FCNTL`** : int *(constant)*
- **`SYS_GETCWD`** : int *(constant)*
- **`SYS_CHDIR`** : int *(constant)*
- **`SYS_MKDIR`** : int *(constant)*
- **`SYS_RMDIR`** : int *(constant)*
- **`SYS_UNLINK`** : int *(constant)*
- **`SYS_GETUID`** : int *(constant)*
- **`SYS_GETGID`** : int *(constant)*
- **`SYS_GETTIMEOFDAY`** : int *(constant)*
- **`SYS_CLOCK_GETTIME`** : int *(constant)*

### `"linux"`

- **`O_CREAT`** : int *(constant)*
- **`O_EXCL`** : int *(constant)*
- **`O_NOCTTY`** : int *(constant)*
- **`O_TRUNC`** : int *(constant)*
- **`O_APPEND`** : int *(constant)*
- **`O_NONBLOCK`** : int *(constant)*
- **`O_DIRECTORY`** : int *(constant)*
- **`O_CLOEXEC`** : int *(constant)*

### `"macos"`

- **`O_CREAT`** : int *(constant)*
- **`O_EXCL`** : int *(constant)*
- **`O_NOCTTY`** : int *(constant)*
- **`O_TRUNC`** : int *(constant)*
- **`O_APPEND`** : int *(constant)*
- **`O_NONBLOCK`** : int *(constant)*
- **`O_DIRECTORY`** : int *(constant)*
- **`O_CLOEXEC`** : int *(constant)*

### `"linux"`

- **`MAP_ANONYMOUS`** : int *(constant)*
- **`MAP_ANON`** : int *(constant)*

### `"macos"`

- **`MAP_ANONYMOUS`** : int *(constant)*
- **`MAP_ANON`** : int *(constant)*

### `"linux"`

- **`SIGBUS`** : int *(constant)*
- **`SIGCHLD`** : int *(constant)*

### `"macos"`

- **`SIGBUS`** : int *(constant)*
- **`SIGCHLD`** : int *(constant)*

