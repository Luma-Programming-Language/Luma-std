# Module: std_args

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### public `ArgsIter`

**Fields:**

- `data`: **char
- `remaining`: int

**Methods:**

#### `peek()`

```luma
peek -> fn() *char
```

#### `next()`

```luma
next -> fn() *char
```

#### `skip()`

```luma
skip -> fn(n: int) void
```

### public `Args`

**Fields:**

- `data`: **char
- `count`: int

**Methods:**

#### `len()`

```luma
len -> fn() int
```

#### `is_empty()`

```luma
is_empty -> fn() int
```

#### `get()`

```luma
get -> fn(index: int) *char
```

#### `contains()`

```luma
contains -> fn(val: *char) int
```

#### `tail()`

```luma
tail -> fn() Args
```

#### `iter()`

```luma
iter -> fn() ArgsIter
```

## Functions

### public `init_args`

**Signature:**
```luma
pub const init_args -> fn(argc: int, argv: **char) Args;
```

