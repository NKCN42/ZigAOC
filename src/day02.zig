const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day02.txt");

pub fn main() !void {
    try part1(); 
    try part2(); 
}

pub fn part2() !void{
    var horizontal_move : i64 = 0; 
    var vertical_move : i64 = 0;
    var aim : i64 = 0; 
    var iter = tokenize(u8, data, "\n"); 
    while(iter.next()) |tok| 
    {
        var str_iter = tokenize(u8, tok, " "); 
        var dir = str_iter.next().?; 
        var amount = parseInt(i64, str_iter.next().?, 10) catch |err| {
            print("Error on parseInt: {any}\n", .{err});
            continue; 
        }; 
        if(std.mem.eql(u8, dir, "forward"))
        {
            horizontal_move += amount; 
            vertical_move += aim * amount; 
        }
        else if(std.mem.eql(u8, dir, "down"))
        {
            aim += amount; 
        }
        else if(std.mem.eql(u8, dir, "up"))
        {
            aim -= amount; 
        }
        //print("Test: {s} {s}\n", .{dir, amount}); 
    }
    print("Part 2: {d}\n", .{horizontal_move * vertical_move}); 
}

pub fn part1() !void {
    var horizontal_move : i64 = 0; 
    var vertical_move : i64 = 0; 
    var iter = tokenize(u8, data, "\n"); 
    while(iter.next()) |tok| 
    {
        var str_iter = tokenize(u8, tok, " "); 
        var dir = str_iter.next().?; 
        var amount = parseInt(i64, str_iter.next().?, 10) catch |err| {
            print("Error on parseInt: {any}\n", .{err});
            continue; 
        }; 
        if(std.mem.eql(u8, dir, "forward"))
        {
            horizontal_move += amount; 
        }
        else if(std.mem.eql(u8, dir, "down"))
        {
            vertical_move += amount; 
        }
        else if(std.mem.eql(u8, dir, "up"))
        {
            vertical_move -= amount; 
        }
        //print("Test: {s} {s}\n", .{dir, amount}); 
    }
    print("Part 1: {d}\n", .{horizontal_move * vertical_move}); 
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
