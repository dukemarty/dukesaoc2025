
require '../aoc_utils/aoclib'
require '../aoc_utils/aocio'


function part1_find_max_joltage(line)
  lpos, rpos = #line - 1, #line
  l, r = line:sub(lpos, lpos), line:sub(rpos, rpos)
--  print("Initial l/r: " .. l .. " / " .. r)
  for i = lpos, 1, -1 do
--    print("   i=" .. i)
    if line:sub(i, i) >= l then
      for j = rpos, i+1, -1 do
--        print("      j=" .. j)
        if line:sub(j, j) > r then
          rpos, r = j, line:sub(j, j)
--          print("  Changed rpos/r to " .. rpos .. " / " .. r)
        end
      end
      lpos, l = i, line:sub(i, i)
--      print("  Changed lpos/l to " .. lpos .. " / " .. l)
    end
  end
--  print("Found max joltage: " .. string.format("%d", l .. r))
  return l .. r
end

function part1(lines)
  print_part_header(1, "Total max voltage")
  
  res = 0
  
  for _, l in ipairs(lines) do
--    print("Next line: " .. l)
    res = res + part1_find_max_joltage(l)
  end
    
  print("Sum of maximized joltage: " .. res)
end

function part2(line)
  print_part_header(2, "Extended invalid IDs")
  
  res = 0
  
  for p1, p2  in string.gmatch(line, "(%d+)-(%d+),?") do
    print("Next pair: " .. p1 .. " - " .. p2)
  
    for i = p1, p2, 1 do
      if part2_check_is_invalid(i) then
--        print("   Found invalid: " .. i)
        res = res + i
      end
    end
  end
  
  print("Sum of extended invalid ids: " .. string.format("%d", res))
end

print_day_header(3, "Lobby ")

--raw_data = lines_from("Day03/sample.txt")
raw_data = lines_from("Day03/puzzle.txt")
--print("Raw data: " .. dump(raw_data))


part1(raw_data)

--part2(raw_data)

