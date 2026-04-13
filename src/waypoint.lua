#!/usr/bin/lua

require("os")

local function pwd()
    local handle = io.popen("pwd")
    if (handle == nil)
    then
        print("PWD ERROR!")
        return
    end
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Getting current dir with pwd and nil handling
local current_dir = pwd();
if (current_dir == nil)
then
    print("PWD ERROR!")
    return
end

local home_dir = os.getenv("HOME");
local history_file = "/.waypoint_history"
local absolute_file = home_dir..history_file

local max = 255; -- Max amount of waypoints

local function grab_dir(index)
    local open_file = io.open(absolute_file, "r");
    if (open_file ~= nil)
    then
        for i = 0, index
        do
            local line = open_file:read("*line")
            if (i == index and line ~= nil)
            then
                print(line)
            end
        end
        open_file:close()
    end
end

local function last_index()
    local open_file = io.open(absolute_file, "r");

    if (open_file == nil)
    then
        return
    end

    for i = 0, max
    do
        local line = open_file:read("*line")
        if (line == nil)
        then
            open_file:close()
            return i-1
        end
    end
end

local function drop_history()
    io.output(absolute_file)
    io.write()
    io.close()
end

local function write_waypoint()
    local open_file = io.open(absolute_file, "a");

    if (open_file == nil)
    then
        print("File not found")
        return
    end

    if (open_file:read("*line") ~= nil)
    then
        open_file:write("\n"..current_dir);
    else
        open_file:write(current_dir);
    end
    open_file:close();

end

local function ls_waypoint()
    local result -- Initialize result var

    local open_file = io.open(absolute_file, "r")

    -- nil handling
    if (open_file == nil)
    then
        print("File not found: "..absolute_file.."\nConsider trying to add a waypoint first")
        return
    end

    -- Waypoint listing loop
    for i = 0, max
    do
        result = open_file:read("*line")

        if (result == nil)
        then
            break
        else
            -- Print index and directory to roll
            print(i.." - "..result)
        end
    end

    -- Close file
    open_file:close()
end

local function rollback_waypoint(opt)
    if (opt == "b")
    then
        grab_dir(last_index())
        return
    end
    if (type(opt) == "number")
    then
        grab_dir(opt)
    end
end

if (arg[1] == nil)
then
    write_waypoint()

elseif (arg[1] == "ls")
then
    ls_waypoint()

elseif (arg[1] == "clear")
then
    drop_history()

elseif (arg[1] == "b")
then
    rollback_waypoint(arg[1])
elseif (arg[1])
then
    rollback_waypoint(tonumber(arg[1]))

else
    print("Seems like you need help here!\
Usage example:\
    [command] [option*] [index*]\
Args and index are optional\
    Try one of the following options:\
    [r][index]   (rollback)\
    [b]          (last waypoint)\
    [clear]       (clear all waypoints)\
    [ls]          (lists all waypoints)\
    [none]        (adds the current dir to waypoints)\
You also have to add an alias to \". command\" to your .bashrc")
    return
end
