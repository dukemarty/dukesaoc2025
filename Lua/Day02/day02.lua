
require '../aoc_utils/aoclib'
require '../aoc_utils/aocio'



function part1_check_is_invalid(i)
  s = string.format("%d", i)
  l = #s
  if l % 2 == 0 then
    h1 = string.sub(s, 0, l//2)
--    h1 = tonumber(string.sub(s, 0, l//2 - 1))
--    h2 = tonumber(string.sub(s, l//2, l))
----        print("h1: <" .. h1 .. ">")
----        print("h2: <" .. h2 .. ">")
--    if h1 == h2 then
--      res = res + i
--    end
--    print("Doubled: " .. string.rep(h1, 2) .. "   vs   " .. s)
    if string.rep(h1, 2) == s then
      return true
    end
  end
  
  return false
end

function part1(line)
  print_part_header(1, "Invalid IDs")
  
  res = 0
  
  for p1, p2  in string.gmatch(line, "(%d+)-(%d+),?") do
--    print("Next pair: " .. p1 .. " - " .. p2)
  
    for i = p1, p2, 1 do
      if part1_check_is_invalid(i) then
        res = res + i
      end
    end
  end
    
  print("Sum of invalid ids: " .. res//1)
end


function part2_check_is_invalid(i)
  s = string.format("%d", i)
  l = #s
  for ps = 1, l//2, 1 do
      if l % ps == 0 then
        p = string.sub(s, 0, ps)
        if string.rep(p, l//ps) == s then
          return true
        end
      end
  end
  
  return false
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

print_day_header(2, "Gift Shop")

-- raw_data = singleline_from("Day02/sample.txt")
raw_data = singleline_from("Day02/puzzle.txt")
--print("Raw data: " .. raw_data)


--part1(raw_data)
-- 85508508990
part2(raw_data)

