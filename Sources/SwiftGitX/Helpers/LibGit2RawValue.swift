/// Converts libgit2 C enum/flag raw values across platforms.
///
/// MSVC imports many C enums as `Int32`, while Clang often surfaces them as `UInt32`.
/// All libgit2 flag values used here are non-negative and fit in 32 bits, so
/// `truncatingIfNeeded` preserves the same bit pattern on every platform.
enum LibGit2RawValue {
    @inline(__always)
    static func asUInt32<T: BinaryInteger>(_ value: T) -> UInt32 {
        UInt32(truncatingIfNeeded: value)
    }

    @inline(__always)
    static func asCRawValue<T: FixedWidthInteger>(_ value: some BinaryInteger) -> T {
        T(truncatingIfNeeded: value)
    }
}
