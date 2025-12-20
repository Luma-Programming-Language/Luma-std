# Module: vector

Dynamic array (vector) implementation for Luma.

Provides a generic, resizable array container that can hold elements of any type.
The vector automatically grows when capacity is exceeded and provides efficient
random access, insertion, and removal operations.

# Example
```luma
let v: Vector = create_vector(sizeof<int>);
defer free_vector(&v);

let x: int = 42;
v.push_back(cast<*void>(&x));
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### pub `Vector`

A dynamic array that can grow as needed.

Vector stores elements of a fixed size in contiguous memory.
All elements must be of the same type (specified by element_size).
The vector automatically reallocates when capacity is exceeded.

# Fields
- `data`: Pointer to the underlying data buffer
- `capacity`: Maximum number of elements before reallocation
- `size`: Current number of elements stored
- `element_size`: Size in bytes of each element

**Public Members:**

- **data**
- **capacity**: Pointer to contiguous data buffer
- **size**: Maximum elements before resize
- **element_size**: Current number of elements
- **insert** (method): Size of each element in bytes
- **push_back** (method): Appends an element to the end of the vector.
- **pop_back** (method): Removes and retrieves the last element from the vector.
- **remove_at** (method): Removes the element at a specific index.
- **get** (method): Retrieves a pointer to the element at a specific index.

## Functions

### pub `create_vector_capacity`

Creates a vector with a specific initial capacity.

Allocates memory for init_capacity elements upfront.
Use this when you know approximately how many elements you'll need
to avoid multiple reallocations.

@param init_capacity Initial number of elements to allocate space for
@param element_size Size in bytes of each element (use sizeof<T>)
@return Newly created vector (caller must call free_vector when done)

# Example
```luma
let v: Vector = create_vector_capacity(100, sizeof<double>);
defer free_vector(&v);
// Vector can hold 100 doubles before first reallocation
```

**Signature:**
```luma
#returns_ownership pub const create_vector_capacity -> fn(init_capacity: int, element_size: int) Vector;
```

### pub `create_vector`

Creates a vector with default initial capacity.

Uses DEFAULT_VECTOR_CAPACITY (1024) as the initial capacity.
This is the most common way to create a vector.

@param element_size Size in bytes of each element (use sizeof<T>)
@return Newly created vector (caller must call free_vector when done)

# Example
```luma
let v: Vector = create_vector(sizeof<int>);
defer free_vector(&v);

loop [i: int = 0](i < 10) : (++i) {
    v.push_back(cast<*void>(&i));
}
```

**Signature:**
```luma
#returns_ownership pub const create_vector -> fn(element_size: int) Vector;
```

### pub `free_vector`

Frees all memory associated with a vector.

After calling this function, the vector should not be used.
This function takes ownership of the vector.

@param v Pointer to the vector to free

# Example
```luma
let v: Vector = create_vector(sizeof<int>);
// ... use vector ...
free_vector(&v);
// v is now invalid
```

**Signature:**
```luma
#takes_ownership pub const free_vector -> fn(v: *Vector) void;
```

## Variables

### priv `DEFAULT_VECTOR_CAPACITY`

**Type:** int (constant)

Default initial capacity for vectors (1024 elements)

### priv `NULL`

**Type:** *void (constant)

Null pointer constant

