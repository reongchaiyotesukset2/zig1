//! By convention, root.zig is the root source file when making a library. If
//! you are making an executable, the convention is to delete this file and
//! start with main.zig instead.
const std = @import("std");
const print = std.debug.print;

pub export fn add2(a: i32, b: i32) i32 {

    return a * b;
}
