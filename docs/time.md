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

### public `usleep`

Sleeps for microseconds

Uses the nanosleep system call for precise sleeping.

Sleeps for microseconds

Uses the nanosleep system call for precise sleeping.

# Parameters
* `usec` - Number of microseconds to sleep

Sleeps for microseconds

Uses the nanosleep system call for precise sleeping.

# Parameters
* `usec` - Number of microseconds to sleep

# Returns
0 on success, negative error code on failure


**Signature:**
```luma
pub const usleep -> fn(usec: int) int;
```

**Parameters:**
* `usec` - Number of microseconds to sleep

**Returns:**
0 on success, negative error code on failure

**Example:**
```luma
time::usleep(500000); // Sleep for 0.5 seconds
```

### public `to_millis`

Converts TimeSpec to milliseconds

Converts TimeSpec to milliseconds

# Parameters
* `t` - TimeSpec to convert

Converts TimeSpec to milliseconds

# Parameters
* `t` - TimeSpec to convert

# Returns
Time in milliseconds

**Signature:**
```luma
pub const to_millis -> fn(t: TimeSpec) int;
```

**Parameters:**
* `t` - TimeSpec to convert

**Returns:**
Time in milliseconds

### public `to_micros`

Converts TimeSpec to microseconds

Converts TimeSpec to microseconds

# Parameters
* `t` - TimeSpec to convert

Converts TimeSpec to microseconds

# Parameters
* `t` - TimeSpec to convert

# Returns
Time in microseconds

**Signature:**
```luma
pub const to_micros -> fn(t: TimeSpec) int;
```

**Parameters:**
* `t` - TimeSpec to convert

**Returns:**
Time in microseconds

### public `to_nanos`

Converts TimeSpec to nanoseconds

Converts TimeSpec to nanoseconds

# Parameters
* `t` - TimeSpec to convert

Converts TimeSpec to nanoseconds

# Parameters
* `t` - TimeSpec to convert

# Returns
Time in nanoseconds

**Signature:**
```luma
pub const to_nanos -> fn(t: TimeSpec) int;
```

**Parameters:**
* `t` - TimeSpec to convert

**Returns:**
Time in nanoseconds

### public `clock_gettime`

Gets current time from system clock

Gets current time from system clock

# Parameters
* `clk_id` - Clock identifier (use CLOCK_REALTIME)
* `ts` - Pointer to TimeSpec to fill

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

**Parameters:**
* `clk_id` - Clock identifier (use CLOCK_REALTIME)
* `ts` - Pointer to TimeSpec to fill

**Returns:**
0 on success, negative error code on failure

### public `now`

Gets current time

# Returns
Current time as TimeSpec

# Example
```luma
let current: TimeSpec = time::now();
```
Gets current time

Gets current time

# Returns
Current time as TimeSpec


**Signature:**
```luma
pub const now -> fn() TimeSpec;
```

**Returns:**
Current time as TimeSpec

**Example:**
```luma
let current: TimeSpec = time::now();
```

### public `timer_start`

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
Starts a timer

Captures the current time as the start point for elapsed time measurements.

Starts a timer

Captures the current time as the start point for elapsed time measurements.

# Returns
Timer initialized with current time


**Signature:**
```luma
pub const timer_start -> fn() Timer;
```

**Returns:**
Timer initialized with current time

**Example:**
```luma
let timer: Timer = time::timer_start();
// ... do work ...
let ms: int = time::timer_elapsed_ms(timer);
```

### public `timespec_sub`

Subtracts two TimeSpec values

Calculates the difference between two time points, handling nanosecond borrowing.

Subtracts two TimeSpec values

Calculates the difference between two time points, handling nanosecond borrowing.

# Parameters
* `a` - Later time
* `b` - Earlier time

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

**Parameters:**
* `a` - Later time
* `b` - Earlier time

**Returns:**
Duration between the two times

### public `elapsed_ms`

Calculates elapsed time in milliseconds

Calculates elapsed time in milliseconds

# Parameters
* `start` - Start time
* `end` - End time

Calculates elapsed time in milliseconds

# Parameters
* `start` - Start time
* `end` - End time

# Returns
Elapsed time in milliseconds


**Signature:**
```luma
pub const elapsed_ms -> fn(start: TimeSpec, end: TimeSpec) int;
```

**Parameters:**
* `start` - Start time
* `end` - End time

**Returns:**
Elapsed time in milliseconds

**Example:**
```luma
let start: TimeSpec = time::now();
// ... do work ...
let end: TimeSpec = time::now();
let ms: int = time::elapsed_ms(start, end);
```

### public `timer_elapsed_ms`

Gets elapsed time from a timer in milliseconds

Gets elapsed time from a timer in milliseconds

# Parameters
* `t` - Timer started with timer_start()

Gets elapsed time from a timer in milliseconds

# Parameters
* `t` - Timer started with timer_start()

# Returns
Milliseconds elapsed since timer was started


**Signature:**
```luma
pub const timer_elapsed_ms -> fn(t: Timer) int;
```

**Parameters:**
* `t` - Timer started with timer_start()

**Returns:**
Milliseconds elapsed since timer was started

**Example:**
```luma
let timer: Timer = time::timer_start();
// ... do work ...
outputln("Elapsed: ", time::timer_elapsed_ms(timer), "ms");
```

## Variables

### private `NANOSLEEP`

**Type:** int (constant)

Nanosleep system call number

### private `CLOCK_GETTIME`

**Type:** int (constant)

Clock_gettime system call number

### private `CLOCK_REALTIME`

**Type:** int (constant)

Realtime clock ID

