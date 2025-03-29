
pub fn main() !void {


       var buffer: [10]u8 = [_]u8{10} ** 10; 
      std.debug.print("buffer::{any} \n", .{&buffer});
  
}

const std = @import("std");
const builtin = @import("builtin");
const AllocationError = error{OutOfMemory};
const expect = std.testing.expect;
