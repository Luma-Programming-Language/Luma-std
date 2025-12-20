# Module: time

Time and sleep utilities

Provides functions for getting current time, sleeping, and measuring
elapsed time with nanosecond precision using Linux system calls.

# Example
```luma
let start: Timer = time::timer_start();
// ... do work ...
let elapsed: int = time::timer_elapsed_ms(start);
outputln("Took ", elapsed, " milliseconds");
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

## Functions

### pub `usleep`

Sleeps for microseconds

Uses the nanosleep system call for precise sleeping.

# Parameters
* `usec` - Number of microseconds to sleep

# Returns
0 on success, negative error code on failure

# Example
```luma
time::usleep(500000); // Sleep for 0.5 seconds
```

**Signature:**
```luma
pub const usleep -> fn(usec: int) int;
```

### pub `to_millis`

Converts TimeSpec to milliseconds

# Parameters
* `t` - TimeSpec to convert

# Returns
Time in milliseconds

**Signature:**
```luma
pub const to_millis -> fn(t: TimeSpec) int;
```

### pub `to_micros`

Converts TimeSpec to microseconds

# Parameters
* `t` - TimeSpec to convert

# Returns
Time in microseconds

**Signature:**
```luma
pub const to_micros -> fn(t: TimeSpec) int;
```

### pub `to_nanos`

Converts TimeSpec to nanoseconds

# Parameters
* `t` - TimeSpec to convert

# Returns
Time in nanoseconds

**Signature:**
```luma
pub const to_nanos -> fn(t: TimeSpec) int;
```

### pub `clock_gettime`

Gets current time from system clock

# Parameters
* `clk_id` - Clock identifier (use CLOCK_REALTIME)
* `ts` - Pointer to TimeSpec to fill

# Returns
0 on success, negative error code on failure

**Signature:**
```luma
pub const clock_gettime -> fn(clk_id: int, ts: *TimeSpec) int;
```

### pub `now`

Gets current time

# Returns
Current time as TimeSpec

# Example
```luma
let current: TimeSpec = time::now();
```

**Signature:**
```luma
pub const now -> fn() TimeSpec;
```

### pub `timer_start`

Starts a timer

Captures the current time as the start point for elapsed time measurements.

# Returns
Timer initialized with current time

# Example
```luma
let timer: Timer = time::timer_start();
// ... do work ...
let ms: int = time::timer_elapsed_ms(timer);
```

**Signature:**
```luma
pub const timer_start -> fn() Timer;
```

### pub `timespec_sub`

Subtracts two TimeSpec values

Calculates the difference between two time points, handling nanosecond borrowing.

# Parameters
* `a` - Later time
* `b` - Earlier time

# Returns
Duration between the two times

**Signature:**
```luma
pub const timespec_sub -> fn(a: TimeSpec, b: TimeSpec) TimeSpec;
```

### pub `elapsed_ms`

Calculates elapsed time in milliseconds

# Parameters
* `start` - Start time
* `end` - End time

# Returns
Elapsed time in milliseconds

# Example
```luma
let start: TimeSpec = time::now();
// ... do work ...
let end: TimeSpec = time::now();
let ms: int = time::elapsed_ms(start, end);
```

**Signature:**
```luma
pub const elapsed_ms -> fn(start: TimeSpec, end: TimeSpec) int;
```

### pub `timer_elapsed_ms`

Gets elapsed time from a timer in milliseconds

# Parameters
* `t` - Timer started with timer_start()

# Returns
Milliseconds elapsed since timer was started

# Example
```luma
let timer: Timer = time::timer_start();
// ... do work ...
outputln("Elapsed: ", time::timer_elapsed_ms(timer), "ms");
```

**Signature:**
```luma
pub const timer_elapsed_ms -> fn(t: Timer) int;
```

## Variables

### priv `NANOSLEEP`

**Type:** int (constant)

Nanosleep system call number

### priv `CLOCK_GETTIME`

**Type:** int (constant)

Clock_gettime system call number

### priv `CLOCK_REALTIME`

**Type:** int (constant)

Realtime clock ID

