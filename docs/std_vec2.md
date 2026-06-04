# Module: std_vec2

2D vector mathematics with common geometric operations.

Provides a `Vec2` struct with methods for arithmetic, products,
length/normalization, distance, interpolation, and geometry
operations (angle, reflection, clamping).

# Example
```luma
let a: Vec2 = Vec2 { x: 3.0, y: 4.0 };
let b: Vec2 = Vec2 { x: 1.0, y: 2.0 };
let sum: Vec2 = a.add(b);
let len: double = a.length();   // 5.0
let dot: double = a.dot(b);     // 11.0
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### public `Vec2`

A 2D vector with x and y components

**Fields:**

- `x`: double — X component
- `y`: double — Y component

**Methods:**

#### `zero()`

Zero vector (0, 0)

```luma
zero -> fn() Vec2
```

#### `one()`

Unit vector (1, 1)

```luma
one -> fn() Vec2
```

#### `right()`

Right unit vector (1, 0)

```luma
right -> fn() Vec2
```

#### `down()`

Down unit vector (0, 1)

```luma
down -> fn() Vec2
```

#### `add()`

Add another vector component-wise

```luma
add -> fn(other: Vec2) Vec2
```

#### `sub()`

Subtract another vector component-wise

```luma
sub -> fn(other: Vec2) Vec2
```

#### `scale()`

Scale the vector by a scalar

```luma
scale -> fn(s: double) Vec2
```

#### `div()`

Divide the vector by a scalar

```luma
div -> fn(s: double) Vec2
```

#### `negate()`

Negate the vector component-wise

```luma
negate -> fn() Vec2
```

#### `dot()`

Dot product with another vector

```luma
dot -> fn(other: Vec2) double
```

#### `cross()`

2D cross product (scalar result)

```luma
cross -> fn(other: Vec2) double
```

#### `length_sq()`

Squared length (avoids sqrt)

```luma
length_sq -> fn() double
```

#### `length()`

Euclidean length

```luma
length -> fn() double
```

#### `normalize()`

Return a unit-length vector (safe for zero vectors)

```luma
normalize -> fn() Vec2
```

#### `distance_sq()`

Squared distance to another vector (avoids sqrt)

```luma
distance_sq -> fn(other: Vec2) double
```

#### `distance()`

Euclidean distance to another vector

```luma
distance -> fn(other: Vec2) double
```

#### `lerp()`

Linearly interpolate toward another vector

```luma
lerp -> fn(other: Vec2, t: double) Vec2
```

#### `angle()`

Angle of the vector in radians (atan2)

```luma
angle -> fn() double
```

#### `perpendicular()`

Perpendicular vector rotated 90° counter-clockwise

```luma
perpendicular -> fn() Vec2
```

#### `reflect()`

Reflect the vector off a surface with the given normal

```luma
reflect -> fn(normal: Vec2) Vec2
```

#### `clamp_length()`

Clamp the vector length to a maximum value

```luma
clamp_length -> fn(max: double) Vec2
```

#### `abs()`

Component-wise absolute values

```luma
abs -> fn() Vec2
```

#### `min()`

Component-wise minimum with another vector

```luma
min -> fn(other: Vec2) Vec2
```

#### `max()`

Component-wise maximum with another vector

```luma
max -> fn(other: Vec2) Vec2
```

#### `is_zero()`

Check if the vector is the zero vector

```luma
is_zero -> fn() bool
```

## Functions

### public `new_vec`

Create a new Vec2 from x and y components

Create a new Vec2 from x and y components

# Parameters
* `x` - X component
* `y` - Y component

Create a new Vec2 from x and y components

# Parameters
* `x` - X component
* `y` - Y component

# Returns
A new Vec2


**Signature:**
```luma
pub const new_vec -> fn(x: double, y: double) Vec2;
```

**Parameters:**
* `x` - X component
* `y` - Y component

**Returns:**
A new Vec2

**Example:**
```luma
let v: Vec2 = vec2::new_vec(3.0, 4.0);
```

### public `from_angle`

Create a unit vector from an angle in radians

Create a unit vector from an angle in radians

# Parameters
* `angle` - Angle in radians

Create a unit vector from an angle in radians

# Parameters
* `angle` - Angle in radians

# Returns
A unit vector pointing in the direction of the angle


**Signature:**
```luma
pub const from_angle -> fn(angle: double) Vec2;
```

**Parameters:**
* `angle` - Angle in radians

**Returns:**
A unit vector pointing in the direction of the angle

**Example:**
```luma
let v: Vec2 = vec2::from_angle(std_math::PI / 4.0); // (√2/2, √2/2)
```

