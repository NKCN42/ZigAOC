const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day03.txt");

pub fn main() !void {
    try part1();
    try part2(); 
}

pub fn part2() !void {
    
}

pub fn part1() !void {
    var iter = tokenize(u8, data, "\n"); 
    var num_lines : u32 = 0; 
    var char_ctr : u32 = 0; 
    var episilon_int : u32 = 0; 
    var sigma_int : u32 = 0; 
    var arr = [_]u32{0} ** 12; 
    var sigma = [_]u8{0} ** 12; 
    var epsilon = [_]u8{0} ** 12; 
    
    while(iter.next()) |tok| 
    {
        char_ctr = 0; 
        var str = trim(u8, tok, " \t\n");
        for (str) |c|
        {
            if(c == '1')
            {
                arr[char_ctr] += 1;
            }
            char_ctr += 1; 
        }
        num_lines += 1;
    }
    char_ctr = 0; 
    for(arr) |num_ones|
    {
        print("Run {d}  num_ones = {d}\n", .{char_ctr, num_ones}); 
        if(num_ones > (num_lines/2))
        {
            sigma[char_ctr] = '1'; 
            epsilon[char_ctr] = '0';
        }
        else
        {
            sigma[char_ctr] = '0'; 
            epsilon[char_ctr] = '1'; 
        }
        char_ctr+=1; 
    }
    
    sigma_int = parseInt(u32, &sigma, 2) catch |err| {
        print("I dun goofed 1?! Sigma = {s} {any}", .{sigma, err}); 
        return; 
    }; 
    print("Sigma: {d}\n", .{sigma_int}); 
    
    episilon_int = parseInt(u32, &epsilon, 2) catch |err| {
        print("I dun goofed 2?! Epsilon = {s} {any}", .{epsilon, err}); 
        return; 
    }; 
    print("Epsilon: {d}\n", .{episilon_int}); 
    print("Part 1: {d}\n", .{episilon_int * sigma_int}); 
}

// Useful stdlib functions
const tokenize = std.mem.tokenize;
const split = std.mem.split;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const min = std.math.min;
const min3 = std.math.min3;
const max = std.math.max;
const max3 = std.math.max3;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.sort;
const asc = std.sort.asc;
const desc = std.sort.desc;
