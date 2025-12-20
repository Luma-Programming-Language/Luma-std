# Module: arena

Arena/bump allocator for fast temporary allocations

Provides a simple arena allocator that can allocate quickly from
a pre-allocated buffer and free all allocations at once. Ideal for
temporary data that has the same lifetime.

# Example
```luma
let arena: Arena = arena::create_arena();
defer { arena::free_arena(&arena); }

let ptr1: *int = cast<*int>(arena::alloc_arena(&arena, sizeof<int>));
let ptr2: *int = cast<*int>(arena::alloc_arena(&arena, sizeof<int>));
// ... use allocations ...
// All freed when arena is freed
```

## Table of Contents

- [Structures](#structures)
- [Enumerations](#enumerations)
- [Functions](#functions)
- [Variables](#variables)

---

## Structures

### pub `Arena`

Arena allocator state

Contains a pre-allocated buffer and tracks current/previous allocation offsets.

**Public Members:**

- **buf**: Pointer to memory buffer
- **buf_len**: Total size of buffer in bytes
- **prev_offset**: Offset of previous allocation (for potential deallocation)
- **curr_offset**: Current allocation offset

## Functions

### pub `create_arena_sized`

Creates an arena with custom size

Allocates a buffer of the specified size for the arena.

# Parameters
* `size` - Size in bytes for the arena buffer

# Returns
Newly created arena

# Example
```luma
let big_arena: Arena = arena::create_arena_sized(10 * 1024 * 1024); // 10MB
defer { arena::free_arena(&big_arena); }
```

**Signature:**
```luma
#returns_ownership pub const create_arena_sized -> fn(size: int) Arena;
```

### pub `create_arena`

Creates an arena with default size (1MB)

# Returns
Newly created arena

# Example
```luma
let arena: Arena = arena::create_arena();
defer { arena::free_arena(&arena); }
```

**Signature:**
```luma
#returns_ownership pub const create_arena -> fn() Arena;
```

### pub `reset_arena`

Resets arena to empty state

Resets allocation pointers without freeing the underlying buffer.
All previous allocations become invalid.

# Parameters
* `a` - Pointer to arena to reset

# Example
```luma
arena::alloc_arena(&arena, 1000);
// ... use allocation ...
arena::reset_arena(&arena); // Reuse arena
```

**Signature:**
```luma
pub const reset_arena -> fn(a: *Arena) void;
```

### pub `free_arena`

Frees arena and its buffer

Frees the underlying buffer and resets all fields.

# Parameters
* `a` - Pointer to arena to free

**Signature:**
```luma
#takes_ownership pub const free_arena -> fn(a: *Arena) void;
```

### pub `alloc_arena`

Allocates memory from arena

Performs fast bump-pointer allocation with 8-byte alignment.
Returns NULL if insufficient space.

# Parameters
* `a` - Pointer to arena
* `size` - Number of bytes to allocate

# Returns
Pointer to allocated memory, or NULL if insufficient space

# Example
```luma
let ptr: *int = cast<*int>(arena::alloc_arena(&arena, sizeof<int>));
if (ptr == cast<*int>(0)) {
    output("Arena full!\n");
}
```

**Signature:**
```luma
pub const alloc_arena -> fn(a: *Arena, size: int) *void;
```

## Variables

### priv `ARENA_DEFAULT_SIZE`

**Type:** int (constant)

Default arena size (1MB)

### priv `NULL`

**Type:** *void (constant)

Null pointer constant

