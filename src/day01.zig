const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day01.txt");

pub fn part1() !void {
    var iter = tokenize(u8, data, "\n");
    var tok = iter.next();
    var lastNum : u32 = 0; 
    var curNum : u32 = 0; 
    var numIncreases : u32 = 0; 
    while(tok != null)
    {
        //print("{s}\n", .{tok.?});
        curNum = parseInt(u32, tok.?, 10) catch |err| {
            print("Error on parseInt: {any}\n", .{err}); 
            tok = iter.next(); 
            continue;
        };
        if((lastNum != 0) and (lastNum < curNum))
        {
            numIncreases+=1; 
        }
        lastNum = curNum; 

        tok = iter.next();
    } 
    print("Part 1 Result: {d}\n", .{numIncreases}); 
}


pub fn part2() !void{
    var iter = tokenize(u8, data, "\n");
    var tok = iter.next();
    var lastNum = [_]u32{0, 0, 0}; 
    var curNum : u32 = 0; 
    var numIncreases : u32 = 0; 
    var curSum : u32 = 0; 
    var lastSum : u32 = 0; 
    //process first three separately
    while(tok != null)
    {
        //print("{s}\n", .{tok.?});
        curNum = parseInt(u32, tok.?, 10) catch |err| {
            print("Error on parseInt: {any}\n", .{err}); 
            tok = iter.next(); 
            continue;
        };
        //first iterations
        if(lastNum[0] == 0) 
        {
            lastNum[0] = curNum;
        }
        else if(lastNum[1] == 0)
        {
            lastNum[1] = curNum; 
        }
        else if(lastNum[2] == 0)
        {
            lastNum[2] = curNum;  
            //generate current sum
            lastSum = lastNum[0] + lastNum[1] + lastNum[2]; 
        }
        else //actual work
        {
            //use lastNum[1], lastNum[2] and curNum for curSum
            curSum = lastNum[1] + lastNum[2] + curNum; 
            if(curSum > lastSum)
                numIncreases += 1; 

            //set lastNum to accomodate new number
            lastNum[0] = lastNum[1]; 
            lastNum[1] = lastNum[2]; 
            lastNum[2] = curNum; 
            lastSum = curSum; 
        }

        tok = iter.next();
    } 
    print("Part 2 Result: {d}\n", .{numIncreases}); 
}

pub fn main() !void {
    try part1(); 
    try part2(); 
    
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
