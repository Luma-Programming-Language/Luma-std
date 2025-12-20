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

### public `Vector`

A dynamic array that can grow as needed.

Vector stores elements of a fixed size in contiguous memory.
All elements must be of the same type (specified by element_size).
The vector automatically reallocates when capacity is exceeded.


**Fields:**

- `data`: *void
- `capacity`: int — Pointer to contiguous data buffer
- `size`: int — Maximum elements before resize
- `element_size`: int — Current number of elements

**Methods:**

#### `insert()`

Size of each element in bytes
Inserts an element at a specific index.

Shifts all elements at and after the index one position to the right.
Automatically grows the vector if capacity is exceeded.

@param elem Pointer to the element to insert
@param index Position to insert at (0 <= index <= size)
@return 1 on success, 0 if index is out of bounds


```luma
insert -> fn(elem: *void, index: int) int
```

**Example:**
```luma
let v: Vector = create_vector(sizeof<int>);
let x: int = 10;
v.insert(cast<*void>(&x), 0); // Insert at beginning
```

#### `push_back()`

Appends an element to the end of the vector.

This is the most efficient way to add elements.
Automatically grows the vector if capacity is exceeded.

@param elem Pointer to the element to append


```luma
push_back -> fn(elem: *void) void
```

**Example:**
```luma
let v: Vector = create_vector(sizeof<int>);
let nums: [int; 3] = [1, 2, 3];
loop [i: int = 0](i < 3) : (++i) {
    v.push_back(cast<*void>(&nums[i]));
}
```

#### `pop_back()`

Removes and retrieves the last element from the vector.

@param out Pointer to store the removed element (can be NULL to just remove)
@return 1 on success, 0 if vector is empty


```luma
pop_back -> fn(out: *void) int
```

**Example:**
```luma
let v: Vector = create_vector(sizeof<int>);
// ... add elements ...
let value: int;
if (v.pop_back(cast<*void>(&value))) {
    outputln("Popped: ", value);
}
```

#### `remove_at()`

Removes the element at a specific index.

Shifts all elements after the index one position to the left.
Does not reduce capacity.

@param index Position of element to remove (0 <= index < size)
@return 1 on success, 0 if index is out of bounds


```luma
remove_at -> fn(index: int) int
```

**Example:**
```luma
let v: Vector = create_vector(sizeof<int>);
// ... add elements ...
v.remove_at(2); // Remove third element
```

#### `get()`

Retrieves a pointer to the element at a specific index.

Returns a void pointer that must be cast to the appropriate type.
Does not remove the element from the vector.

@param index Position of element to retrieve (0 <= index < size)
@return Pointer to element, or NULL if index is out of bounds


```luma
get -> fn(index: int) *void
```

**Example:**
```luma
let v: Vector = create_vector(sizeof<int>);
// ... add elements ...
let ptr: *int = cast<*int>(v.get(0));
if (ptr != cast<*int>(0)) {
    outputln("First element: ", *ptr);
}
```

## Functions

### public `create_vector_capacity`

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
Creates a vector with a specific initial capacity.

Allocates memory for init_capacity elements upfront.
Use this when you know approximately how many elements you'll need
to avoid multiple reallocations.

@param init_capacity Initial number of elements to allocate space for
@param element_size Size in bytes of each element (use sizeof<T>)
@return Newly created vector (caller must call free_vector when done)


**Signature:**
```luma
#returns_ownership pub const create_vector_capacity -> fn(init_capacity: int, element_size: int) Vector;
```

**Example:**
```luma
let v: Vector = create_vector_capacity(100, sizeof<double>);
defer free_vector(&v);
// Vector can hold 100 doubles before first reallocation
```

### public `create_vector`

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
Creates a vector with default initial capacity.

Uses DEFAULT_VECTOR_CAPACITY (1024) as the initial capacity.
This is the most common way to create a vector.

@param element_size Size in bytes of each element (use sizeof<T>)
@return Newly created vector (caller must call free_vector when done)


**Signature:**
```luma
#returns_ownership pub const create_vector -> fn(element_size: int) Vector;
```

**Example:**
```luma
let v: Vector = create_vector(sizeof<int>);
defer free_vector(&v);

loop [i: int = 0](i < 10) : (++i) {
    v.push_back(cast<*void>(&i));
}
```

### public `free_vector`

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
Frees all memory associated with a vector.

After calling this function, the vector should not be used.
This function takes ownership of the vector.

@param v Pointer to the vector to free


**Signature:**
```luma
#takes_ownership pub const free_vector -> fn(v: *Vector) void;
```

**Example:**
```luma
let v: Vector = create_vector(sizeof<int>);
// ... use vector ...
free_vector(&v);
// v is now invalid
```

## Variables

### private `DEFAULT_VECTOR_CAPACITY`

**Type:** int (constant)

Default initial capacity for vectors (1024 elements)

### private `NULL`

**Type:** *void (constant)

Null pointer constant

