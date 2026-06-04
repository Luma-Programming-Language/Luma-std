# Module: std_time

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

### `usleep`

Sleeps for microseconds

Uses the nanosleep system call for precise sleeping.


```luma
pub usleep -> fn(
    usec: int
) int
```

**Parameters:**
* `usec` - Number of microseconds to sleep


**Returns:**
0 on success, negative error code on failure


**Example:**
```luma
time::usleep(500000); // Sleep for 0.5 seconds
```

### `to_millis`

Converts TimeSpec to milliseconds


```luma
pub to_millis -> fn(
    t: TimeSpec
) int
```

**Parameters:**
* `t` - TimeSpec to convert


**Returns:**
Time in milliseconds

### `to_micros`

Converts TimeSpec to microseconds


```luma
pub to_micros -> fn(
    t: TimeSpec
) int
```

**Parameters:**
* `t` - TimeSpec to convert


**Returns:**
Time in microseconds

### `to_nanos`

Converts TimeSpec to nanoseconds


```luma
pub to_nanos -> fn(
    t: TimeSpec
) int
```

**Parameters:**
* `t` - TimeSpec to convert


**Returns:**
Time in nanoseconds

### `clock_gettime`

Gets current time from system clock


```luma
pub clock_gettime -> fn(
    clk_id: int,
    ts: *TimeSpec
) int
```

**Parameters:**
* `clk_id` - Clock identifier (use CLOCK_REALTIME)
* `ts` - Pointer to TimeSpec to fill


**Returns:**
0 on success, negative error code on failure

### `now`

Gets current time


```luma
pub now -> fn(
) TimeSpec
```

**Returns:**
Current time as TimeSpec


**Example:**
```luma
let current: TimeSpec = time::now();
```

### `timer_start`

Starts a timer

Captures the current time as the start point for elapsed time measurements.


```luma
pub timer_start -> fn(
) Timer
```

**Returns:**
Timer initialized with current time


**Example:**
```luma
let timer: Timer = time::timer_start();
// ... do work ...
let ms: int = time::timer_elapsed_ms(timer);
```

### `timespec_sub`

Subtracts two TimeSpec values

Calculates the difference between two time points, handling nanosecond borrowing.


```luma
pub timespec_sub -> fn(
    a: TimeSpec,
    b: TimeSpec
) TimeSpec
```

**Parameters:**
* `a` - Later time
* `b` - Earlier time


**Returns:**
Duration between the two times

### `elapsed_ms`

Calculates elapsed time in milliseconds


```luma
pub elapsed_ms -> fn(
    start: TimeSpec,
    end: TimeSpec
) int
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

### `timer_elapsed_ms`

Gets elapsed time from a timer in milliseconds


```luma
pub timer_elapsed_ms -> fn(
    t: Timer
) int
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

- **`NANOSLEEP`** : int *(constant)* — Nanosleep system call number
- **`CLOCK_GETTIME`** : int *(constant)* — Clock_gettime system call number
- **`CLOCK_REALTIME`** : int *(constant)* — Realtime clock ID
