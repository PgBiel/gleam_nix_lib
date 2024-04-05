//// Types and functions related to Nix attribute sets.

/// Represents any attribute set in Nix, containing values of a single type.
pub type AttrSet(value)

/// Creates a new, empty attribute set.
@external(nix, "../nix_ffi.nix", "attrset_new")
pub fn new() -> AttrSet(a)

/// Gets the amount of attributes in the attribute set.
@external(nix, "../nix_ffi.nix", "attrset_size")
pub fn size(set: AttrSet(a)) -> Int

/// Gets the value associated with that attribute, if it exists.
@external(nix, "../nix_ffi.nix", "attrset_get")
pub fn get(set: AttrSet(a), attr: String) -> Result(a, Nil)

/// Updates the value of an attribute in the attribute set,
/// returning the new, updated attribute set.
///
/// The original attribute set is NOT changed and is immutable.
@external(nix, "../nix_ffi.nix", "attrset_set")
pub fn set(set: AttrSet(a), at attr: String, to value: a) -> AttrSet(a)

/// Merges two attribute sets, such that attributes in the second set
/// override those in the first with the same name.
@external(nix, "../nix_ffi.nix", "attrset_merge")
pub fn merge(first: AttrSet(a), with second: AttrSet(a)) -> AttrSet(a)

/// Generates an attribute set with all attributes in the first set
/// which have the same name as some attribute in the second set.
@external(nix, "../nix_ffi.nix", "attrset_intersect")
pub fn intersect(first: AttrSet(a), with second: AttrSet(a)) -> AttrSet(a)
