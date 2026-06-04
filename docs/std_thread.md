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

---

## Functions

### public `pthread_create`

**Signature:**
```luma
pub const pthread_create -> fn(tid: *int, attr: *void, _fn: *void, arg: *void) int;
```

### public `pthread_join`

**Signature:**
```luma
pub const pthread_join -> fn(tid: int, retval: *void) int;
```

### public `pthread_detach`

**Signature:**
```luma
pub const pthread_detach -> fn(tid: int) int;
```

### public `pthread_self`

**Signature:**
```luma
pub const pthread_self -> fn() int;
```

### public `pthread_exit`

**Signature:**
```luma
pub const pthread_exit -> fn(retval: *void) void;
```

### public `pthread_equal`

**Signature:**
```luma
pub const pthread_equal -> fn(t1: int, t2: int) int;
```

### public `pthread_cancel`

**Signature:**
```luma
pub const pthread_cancel -> fn(tid: int) int;
```

### public `pthread_mutex_init`

**Signature:**
```luma
pub const pthread_mutex_init -> fn(mutex: *int, attr: *void) int;
```

### public `pthread_mutex_destroy`

**Signature:**
```luma
pub const pthread_mutex_destroy -> fn(mutex: *int) int;
```

### public `pthread_mutex_lock`

**Signature:**
```luma
pub const pthread_mutex_lock -> fn(mutex: *int) int;
```

### public `pthread_mutex_trylock`

**Signature:**
```luma
pub const pthread_mutex_trylock -> fn(mutex: *int) int;
```

### public `pthread_mutex_unlock`

**Signature:**
```luma
pub const pthread_mutex_unlock -> fn(mutex: *int) int;
```

### public `pthread_cond_init`

**Signature:**
```luma
pub const pthread_cond_init -> fn(cond: *int, attr: *void) int;
```

### public `pthread_cond_destroy`

**Signature:**
```luma
pub const pthread_cond_destroy -> fn(cond: *int) int;
```

### public `pthread_cond_wait`

**Signature:**
```luma
pub const pthread_cond_wait -> fn(cond: *int, mutex: *int) int;
```

### public `pthread_cond_signal`

**Signature:**
```luma
pub const pthread_cond_signal -> fn(cond: *int) int;
```

### public `pthread_cond_broadcast`

**Signature:**
```luma
pub const pthread_cond_broadcast -> fn(cond: *int) int;
```

### public `pthread_rwlock_init`

**Signature:**
```luma
pub const pthread_rwlock_init -> fn(rwlock: *int, attr: *void) int;
```

### public `pthread_rwlock_destroy`

**Signature:**
```luma
pub const pthread_rwlock_destroy -> fn(rwlock: *int) int;
```

### public `pthread_rwlock_rdlock`

**Signature:**
```luma
pub const pthread_rwlock_rdlock -> fn(rwlock: *int) int;
```

### public `pthread_rwlock_wrlock`

**Signature:**
```luma
pub const pthread_rwlock_wrlock -> fn(rwlock: *int) int;
```

### public `pthread_rwlock_unlock`

**Signature:**
```luma
pub const pthread_rwlock_unlock -> fn(rwlock: *int) int;
```

### public `pthread_once`

**Signature:**
```luma
pub const pthread_once -> fn(once: *int, _fn: *void) int;
```

### public `pthread_barrier_init`

**Signature:**
```luma
pub const pthread_barrier_init -> fn(barrier: *int, attr: *void, count: int) int;
```

### public `pthread_barrier_destroy`

**Signature:**
```luma
pub const pthread_barrier_destroy -> fn(barrier: *int) int;
```

### public `pthread_barrier_wait`

**Signature:**
```luma
pub const pthread_barrier_wait -> fn(barrier: *int) int;
```

