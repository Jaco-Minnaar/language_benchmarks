const std = @import("std");
const ArrayList = std.ArrayList;

pub fn main() anyerror!void {
    const max = 1_000_000;
    var iterations: u32 = 0;
    var start = std.time.milliTimestamp();

    while (std.time.milliTimestamp() - start < 5_000) {
        _ = try findPrimes(max);
        iterations += 1;
    }

    std.debug.print("Zig performed {d} iterations in 5 seconds\n", .{iterations});
}

fn findPrimes(max: u32) !u32 {
    const allocator = std.heap.page_allocator;
    const arrayLength = max / 2 + 1;
    var bv = try ArrayList(bool).initCapacity(allocator, arrayLength);
    defer bv.deinit();

    try bv.appendNTimes(true, arrayLength);

    bv.items[0] = false;

    var i: u32 = 3;
    while (i <= std.math.sqrt(max)) : (i += 2) {
        if (bv.items[i / 2]) {
            var j = i;
            while (i * j < max) : (j += 2) {
                bv.items[(i * j) / 2] = false;
            }
        }
    }

    var sum: u32 = 0;
    for (bv.items) |p| {
        if (p) {
            sum += 1;
        }
    }

    return sum;
}
