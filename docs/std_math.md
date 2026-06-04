# Module: std_math

Mathematical functions and constants

Provides trigonometric functions using lookup table interpolation,
basic arithmetic operations, random number generation, and common
mathematical constants.

# Trigonometry
The sine function uses a 128-entry lookup table with linear interpolation
for efficiency. Other trig functions are derived from sine.

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)


## Functions

### `rand`

Simple linear congruential random number generator

Updates the seed and returns a pseudo-random number.


```luma
pub rand -> fn(
    seed: *int
) int
```

**Parameters:**
* `seed` - Pointer to seed value (will be modified)


**Returns:**
Pseudo-random integer


**Example:**
```luma
let seed: int = 12345;
let r1: int = math::rand(&seed);
let r2: int = math::rand(&seed);
```

### `add`

Adds two integers

```luma
pub add -> fn(
    x: int,
    y: int
) int
```

### `subtract`

Subtracts two integers

```luma
pub subtract -> fn(
    x: int,
    y: int
) int
```

### `multiply`

Multiplies two integers

```luma
pub multiply -> fn(
    x: int,
    y: int
) int
```

### `divide`

Divides two integers with zero check


```luma
pub divide -> fn(
    x: int,
    y: int
) int
```

**Parameters:**
* `x` - Dividend
* `y` - Divisor


**Returns:**
Quotient, or 0 if divisor is zero (with error message)

### `mod`

Modulo operation with zero check


```luma
pub mod -> fn(
    x: int,
    y: int
) int
```

**Parameters:**
* `x` - Dividend
* `y` - Modulus


**Returns:**
Remainder, or 0 if modulus is zero (with error message)

### `fib`

Fibonacci number calculator (tail-recursive)


```luma
pub fib -> fn(
    n: int,
    a: int,
    b: int
) int
```

**Parameters:**
* `n` - Index of Fibonacci number to calculate
* `a` - Accumulator (start with 0)
* `b` - Accumulator (start with 1)


**Returns:**
The nth Fibonacci number


**Example:**
```luma
let fib10: int = math::fib(10, 0, 1); // 55
```

### `power`

Raises base to integer exponent


```luma
pub power -> fn(
    base: double,
    exponent: int
) double
```

**Parameters:**
* `base` - Base value
* `exponent` - Integer exponent


**Returns:**
base^exponent


**Example:**
```luma
let result: double = math::power(2.0, 10); // 1024.0
```

### `max_size`

Returns maximum of two integers

```luma
pub max_size -> fn(
    a: int,
    b: int
) int
```

### `min_size`

Returns minimum of two integers

```luma
pub min_size -> fn(
    a: int,
    b: int
) int
```

### `sin`

Sine function using lookup table interpolation

Uses a 128-entry lookup table with linear interpolation for efficiency.
Normalizes input to [0, 2π) and uses quadrant symmetry.


```luma
pub sin -> fn(
    a: double
) double
```

**Parameters:**
* `a` - Angle in radians


**Returns:**
Sine of the angle (-1.0 to 1.0)


**Example:**
```luma
let s: double = math::sin(math::PI / 2.0); // 1.0
```

### `cos`

Cosine function (derived from sine)


```luma
pub cos -> fn(
    x: double
) double
```

**Parameters:**
* `x` - Angle in radians


**Returns:**
Cosine of the angle

### `tan`

Tangent function


```luma
pub tan -> fn(
    x: double
) double
```

**Parameters:**
* `x` - Angle in radians


**Returns:**
Tangent of the angle

### `sec`

Secant function (1/cos)

```luma
pub sec -> fn(
    x: double
) double
```

### `csc`

Cosecant function (1/sin)

```luma
pub csc -> fn(
    x: double
) double
```

### `cot`

Cotangent function (cos/sin)

```luma
pub cot -> fn(
    x: double
) double
```


## Variables

- **`PI`** : double *(constant)* — Pi constant (π ≈ 3.14159...)
- **`TWO_PI`** : double *(constant)* — Two pi (2π ≈ 6.28318...)
- **`HALF_PI`** : double *(constant)* — Half pi (π/2 ≈ 1.5708...)
- **`DEPTH`** : int *(constant)* — Depth parameter for derivative calculations (unused)
- **`DT`** : double *(constant)* — Time delta for derivative calculations (unused)
- **`SIN_TABLE_COUNT`** : int *(constant)* — Size of sine lookup table
- **`SIN_TABLE`** : [double; 129] *(constant)* — Pre-computed sine lookup table
