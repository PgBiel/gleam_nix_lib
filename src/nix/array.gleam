//// Contains types and functions related to Nix's built-in lists (consisting of arrays).

/// A Nix list. This is not a linked list, but rather a contiguous array.
/// The fastest way to access values in this array is by index.
/// Recursion over this type tends to be slower, as a consequence (would be `O(N^2)`).
pub type Array(element)

/// Reduces a list of elements into a single value by calling a given function
/// on each element, going from right to left.
///
/// Runs in linear time, and is strict (uses the `foldl'` built-in).
@external(nix, "../nix_ffi.nix", "array_fold")
pub fn fold(over array: Array(a), from init: b, with operator: fn(b, a) -> b) -> b

/// Reduces a list of elements into a single value by calling a given function
/// on each element, going from right to left.
///
/// Runs in linear time, and is lazy and recursive, so large arrays can cause a stack overflow.
@external(nix, "../nix_ffi.nix", "array_fold_right")
pub fn fold_right(over array: Array(a), from init: b, with operator: fn(b, a) -> b) -> b

/// Get the element at the given index.
@external(nix, "../nix_ffi.nix", "array_get")
pub fn get(array: Array(a), b: Int) -> Result(a, Nil)

/// Returns a new array containing only the elements of the first array after
/// the function has been applied to each one.
///
/// Runs in linear time.
@external(nix, "../nix_ffi.nix", "array_map")
pub fn map(array: Array(a), with operator: fn(a) -> b) -> Array(b)

/// Gets the amount of elements in the array.
///
/// Runs in constant time.
@external(nix, "../nix_ffi.nix", "array_size")
pub fn size(array: Array(a)) -> Int

/// Joins two arrays using Nix's built-in `++` operator.
@external(nix, "../nix_ffi.nix", "array_concat")
pub fn concat(first: Array(a), second: Array(a)) -> Array(a)

/// Converts a Gleam list to a Nix array.
///
/// Runs in linear time, and is recursive, so large lists can cause a stack overflow.
@external(nix, "../nix_ffi.nix", "array_from_list")
pub fn from_list(list: List(a)) -> Array(a)

/// Converts a Nix array to a Gleam list.
///
/// Runs in linear time.
@external(nix, "../nix_ffi.nix", "array_to_list")
pub fn to_list(array: Array(a)) -> List(a)