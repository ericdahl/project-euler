#!/usr/bin/env lua

local i = 1
local j = 2
local sum = 0

while i < 4000000 do
    i, j = j, i + j

    if (i % 2 == 0) then
        sum = sum + i
    end
end

print(sum)
