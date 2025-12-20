# Module: math

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

---

## Functions

### public `rand`

Simple linear congruential random number generator

Updates the seed and returns a pseudo-random number.

Simple linear congruential random number generator

Updates the seed and returns a pseudo-random number.

# Parameters
* `seed` - Pointer to seed value (will be modified)

Simple linear congruential random number generator

Updates the seed and returns a pseudo-random number.

# Parameters
* `seed` - Pointer to seed value (will be modified)

# Returns
Pseudo-random integer


**Signature:**
```luma
pub const rand -> fn(seed: *int) int;
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

### public `add`

Adds two integers
Adds two integers
Adds two integers

**Signature:**
```luma
pub const add -> fn(x: int, y: int) int;
```

### public `subtract`

Subtracts two integers
Subtracts two integers
Subtracts two integers

**Signature:**
```luma
pub const subtract -> fn(x: int, y: int) int;
```

### public `multiply`

Multiplies two integers
Multiplies two integers
Multiplies two integers

**Signature:**
```luma
pub const multiply -> fn(x: int, y: int) int;
```

### public `divide`

Divides two integers with zero check

Divides two integers with zero check

# Parameters
* `x` - Dividend
* `y` - Divisor

Divides two integers with zero check

# Parameters
* `x` - Dividend
* `y` - Divisor

# Returns
Quotient, or 0 if divisor is zero (with error message)

**Signature:**
```luma
pub const divide -> fn(x: int, y: int) int;
```

**Parameters:**
* `x` - Dividend
* `y` - Divisor

**Returns:**
Quotient, or 0 if divisor is zero (with error message)

### public `mod`

Modulo operation with zero check

Modulo operation with zero check

# Parameters
* `x` - Dividend
* `y` - Modulus

Modulo operation with zero check

# Parameters
* `x` - Dividend
* `y` - Modulus

# Returns
Remainder, or 0 if modulus is zero (with error message)

**Signature:**
```luma
pub const mod -> fn(x: int, y: int) int;
```

**Parameters:**
* `x` - Dividend
* `y` - Modulus

**Returns:**
Remainder, or 0 if modulus is zero (with error message)

### public `fib`

Fibonacci number calculator (tail-recursive)

Fibonacci number calculator (tail-recursive)

# Parameters
* `n` - Index of Fibonacci number to calculate
* `a` - Accumulator (start with 0)
* `b` - Accumulator (start with 1)

Fibonacci number calculator (tail-recursive)

# Parameters
* `n` - Index of Fibonacci number to calculate
* `a` - Accumulator (start with 0)
* `b` - Accumulator (start with 1)

# Returns
The nth Fibonacci number


**Signature:**
```luma
pub const fib -> fn(n: int, a: int, b: int) int;
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

### public `power`

Raises base to integer exponent

Raises base to integer exponent

# Parameters
* `base` - Base value
* `exponent` - Integer exponent

Raises base to integer exponent

# Parameters
* `base` - Base value
* `exponent` - Integer exponent

# Returns
base^exponent


**Signature:**
```luma
pub const power -> fn(base: double, exponent: int) double;
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

### public `max_size`

Returns maximum of two integers
Returns maximum of two integers
Returns maximum of two integers

**Signature:**
```luma
pub const max_size -> fn(a: int, b: int) int;
```

### public `min_size`

Returns minimum of two integers
Returns minimum of two integers
Returns minimum of two integers

**Signature:**
```luma
pub const min_size -> fn(a: int, b: int) int;
```

### public `sin`

Sine function using lookup table interpolation

Uses a 128-entry lookup table with linear interpolation for efficiency.
Normalizes input to [0, 2π) and uses quadrant symmetry.

Sine function using lookup table interpolation

Uses a 128-entry lookup table with linear interpolation for efficiency.
Normalizes input to [0, 2π) and uses quadrant symmetry.

# Parameters
* `a` - Angle in radians

Sine function using lookup table interpolation

Uses a 128-entry lookup table with linear interpolation for efficiency.
Normalizes input to [0, 2π) and uses quadrant symmetry.

# Parameters
* `a` - Angle in radians

# Returns
Sine of the angle (-1.0 to 1.0)


**Signature:**
```luma
pub const sin -> fn(a: double) double;
```

**Parameters:**
* `a` - Angle in radians

**Returns:**
Sine of the angle (-1.0 to 1.0)

**Example:**
```luma
let s: double = math::sin(math::PI / 2.0); // 1.0
```

### public `cos`

Cosine function (derived from sine)

Cosine function (derived from sine)

# Parameters
* `x` - Angle in radians

Cosine function (derived from sine)

# Parameters
* `x` - Angle in radians

# Returns
Cosine of the angle

**Signature:**
```luma
pub const cos -> fn(x: double) double;
```

**Parameters:**
* `x` - Angle in radians

**Returns:**
Cosine of the angle

### public `tan`

Tangent function

Tangent function

# Parameters
* `x` - Angle in radians

Tangent function

# Parameters
* `x` - Angle in radians

# Returns
Tangent of the angle

**Signature:**
```luma
pub const tan -> fn(x: double) double;
```

**Parameters:**
* `x` - Angle in radians

**Returns:**
Tangent of the angle

### public `sec`

Secant function (1/cos)
Secant function (1/cos)
Secant function (1/cos)

**Signature:**
```luma
pub const sec -> fn(x: double) double;
```

### public `csc`

Cosecant function (1/sin)
Cosecant function (1/sin)
Cosecant function (1/sin)

**Signature:**
```luma
pub const csc -> fn(x: double) double;
```

### public `cot`

Cotangent function (cos/sin)
Cotangent function (cos/sin)
Cotangent function (cos/sin)

**Signature:**
```luma
pub const cot -> fn(x: double) double;
```

## Variables

### public `PI`

**Type:** double (constant)

Pi constant (π ≈ 3.14159...)

### public `TWO_PI`

**Type:** double (constant)

Two pi (2π ≈ 6.28318...)

### public `HALF_PI`

**Type:** double (constant)

Half pi (π/2 ≈ 1.5708...)

### public `DEPTH`

**Type:** int (constant)

Depth parameter for derivative calculations (unused)

### public `DT`

**Type:** double (constant)

Time delta for derivative calculations (unused)

### public `SIN_TABLE_COUNT`

**Type:** int (constant)

Size of sine lookup table

### public `SIN_TABLE`

**Type:** [double; 129] (constant)

Pre-computed sine lookup table

Contains 129 values (0 to π/2) for sine interpolation.

