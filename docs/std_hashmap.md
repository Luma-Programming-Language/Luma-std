# Module: std_hashmap

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### `HashMap`

| Field | Type | Description |
|-------|------|-------------|
| `capacity` | int |  |
| `num_of_elem` | int |  |
| `arr` | **Node |  |

**Methods:**

#### `hash()`

```luma
hash -> fn(
    key: *char
) int
```

#### `insert()`

```luma
#returns_ownership
insert -> fn(
    key: *char,
    value: *char
) void
```

#### `delete()`

```luma
#takes_ownership
delete -> fn(
    key: *char
) void
```

#### `search()`

```luma
search -> fn(
    key: *char
) *char
```


## Functions

### `_strcmp`

```luma
pub _strcmp -> fn(
    s1: *char,
    s2: *char
) int
```

### `init_hashmap`

```luma
#returns_ownership
pub init_hashmap -> fn(
) *HashMap
```

### `free_hashmap`

```luma
#takes_ownership
pub free_hashmap -> fn(
    ptr: *HashMap
) void
```

