
require '../aoc_utils/aoclib'
require '../aoc_utils/aocio'




function part1(line)
  print_part_header(1, "Invalid IDs")
  
  res = 0
  
  for p1, p2  in string.gmatch(line, "(%d+)-(%d+),?") do
--    print("Next pair: " .. p1 .. " - " .. p2)
  
    for i = p1, p2, 1 do
      s = tostring(i)
      l = #s
      if l % 2 == 0 then
        h1 = tonumber(string.sub(s, 0, l//2 - 1))
        h2 = tonumber(string.sub(s, l//2, l))
--        print("h1: <" .. h1 .. ">")
--        print("h2: <" .. h2 .. ">")
        if h1 == h2 then
          res = res + i
        end
      end
    end
  end
    
  print("Sum of invalid ids: " .. res//1)
end


print_day_header(2, "Gift Shop")

-- raw_data = singleline_from("Day02/sample.txt")
raw_data = singleline_from("Day02/puzzle.txt")
print("Raw data: " .. raw_data)


part1(raw_data)

--print_part_header(2, "lskndlck")



