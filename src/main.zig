pub fn main() !void {
    //const a : i32 = 100;
    //const b : i32 = 100;
    const sum = lib.add(300,100);
    const sum2 = lib2.add2(100,100);
    std.debug.print("::{any} \n", .{sum});
     std.debug.print("::{any} \n", .{sum2});
}

const std = @import("std");
const lib = @import("zig1_lib");
const lib2 = @import("zig2_lib");
