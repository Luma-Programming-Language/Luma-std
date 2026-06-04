# Module: std_thread

POSIX threading bindings for Linux

PLATFORM: Linux x86_64

Wraps libpthread — pthread_t, pthread_mutex_t, and pthread_cond_t
are all treated as int (opaque handles).

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)
- [Linked Libraries](#linked-libraries)


## Functions

### `pthread_create`

```luma
pub pthread_create -> fn(
    tid: *int,
    attr: *void,
    _fn: *void,
    arg: *void
) int
```

### `pthread_join`

```luma
pub pthread_join -> fn(
    tid: int,
    retval: *void
) int
```

### `pthread_detach`

```luma
pub pthread_detach -> fn(
    tid: int
) int
```

### `pthread_self`

```luma
pub pthread_self -> fn(
) int
```

### `pthread_exit`

```luma
pub pthread_exit -> fn(
    retval: *void
) void
```

### `pthread_equal`

```luma
pub pthread_equal -> fn(
    t1: int,
    t2: int
) int
```

### `pthread_cancel`

```luma
pub pthread_cancel -> fn(
    tid: int
) int
```

### `pthread_mutex_init`

```luma
pub pthread_mutex_init -> fn(
    mutex: *int,
    attr: *void
) int
```

### `pthread_mutex_destroy`

```luma
pub pthread_mutex_destroy -> fn(
    mutex: *int
) int
```

### `pthread_mutex_lock`

```luma
pub pthread_mutex_lock -> fn(
    mutex: *int
) int
```

### `pthread_mutex_trylock`

```luma
pub pthread_mutex_trylock -> fn(
    mutex: *int
) int
```

### `pthread_mutex_unlock`

```luma
pub pthread_mutex_unlock -> fn(
    mutex: *int
) int
```

### `pthread_cond_init`

```luma
pub pthread_cond_init -> fn(
    cond: *int,
    attr: *void
) int
```

### `pthread_cond_destroy`

```luma
pub pthread_cond_destroy -> fn(
    cond: *int
) int
```

### `pthread_cond_wait`

```luma
pub pthread_cond_wait -> fn(
    cond: *int,
    mutex: *int
) int
```

### `pthread_cond_signal`

```luma
pub pthread_cond_signal -> fn(
    cond: *int
) int
```

### `pthread_cond_broadcast`

```luma
pub pthread_cond_broadcast -> fn(
    cond: *int
) int
```

### `pthread_rwlock_init`

```luma
pub pthread_rwlock_init -> fn(
    rwlock: *int,
    attr: *void
) int
```

### `pthread_rwlock_destroy`

```luma
pub pthread_rwlock_destroy -> fn(
    rwlock: *int
) int
```

### `pthread_rwlock_rdlock`

```luma
pub pthread_rwlock_rdlock -> fn(
    rwlock: *int
) int
```

### `pthread_rwlock_wrlock`

```luma
pub pthread_rwlock_wrlock -> fn(
    rwlock: *int
) int
```

### `pthread_rwlock_unlock`

```luma
pub pthread_rwlock_unlock -> fn(
    rwlock: *int
) int
```

### `pthread_once`

```luma
pub pthread_once -> fn(
    once: *int,
    _fn: *void
) int
```

### `pthread_barrier_init`

```luma
pub pthread_barrier_init -> fn(
    barrier: *int,
    attr: *void,
    count: int
) int
```

### `pthread_barrier_destroy`

```luma
pub pthread_barrier_destroy -> fn(
    barrier: *int
) int
```

### `pthread_barrier_wait`

```luma
pub pthread_barrier_wait -> fn(
    barrier: *int
) int
```


## Linked Libraries

External native libraries linked by this module.

> **FFI library:** `libpthread.so.0`
>

