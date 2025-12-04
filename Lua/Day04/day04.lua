
require '../aoc_utils/aoclib'
require '../aoc_utils/aocio'


DOT = string.byte(".")
AT = string.byte("@")



-- ---------------------------------------------------------------
-- general helper stuff

function map_from_input_lines(lines)
    m = {}
    
    for i, l in ipairs(lines) do
--      print("* " .. i .. ") " .. l .. " -> " .. dump({l:byte(1, -1)}))
      m[i] = {l:byte(1, -1)}
      m[i][0] = DOT
      m[i][#m[i]+1] = DOT
    end
    
    m[0] = {string.byte(string.rep(".", #m[1]-1), 1, -1)}
    m[0][0] = DOT
    m[#m+1] = {string.byte(string.rep(".", #m[1]-1), 1, -1)}
    m[#m][0] = DOT
    
    return m
end


function count_around(data, y, x, sym)
  count = 0
  
--  print(string.format("Checking y=%d x=%d", y, x))
  for i = -1, 1, 1 do
    for j = -1, 1, 1 do
      if (i == 0) and (j == 0) then
        goto continue
      end
--      print(string.format("    i=%d j=%d", i, j))
      if data[y+i][x+j] == sym then
        count = count + 1
      end
      
      ::continue::
    end
  end
  
  return count
end

-- ----------------------------------------------------------------
-- Part 1 stuff

-- part 1 solution
function part1(data)
  print_part_header(1, "#Accessible paper rolls")
  
  res = 0
  
  for r = 1, #data-1, 1 do
    for c = 1, #data[1]-1, 1 do
      if data[r][c]==AT and count_around(data, r, c, AT) < 4 then
--        print(string.format("Found accessible: %d / %d", r, c))
        res = res + 1
      end
    end
  end
    
  print("Number of accessible paper rolls: " .. res)
end

-- ---------------------------------------------------------------
-- Part 2 stuff
function part2(data)
  print_part_header(2, "#Accessible paper rolls with removal")
  
  res = 0
  
  
  
  
  print("Number of removable paper rolls: " .. res)
end


-- ----------------------------------------------------------------
-- MAIN PROGRAM
-- ----------------------------------------------------------------

print_day_header(4, "Printing Department")

--raw_data = lines_from("Day04/sample.txt")
raw_data = lines_from("Day04/puzzle.txt")
data = map_from_input_lines(raw_data)
--print("Raw data: " .. dump(raw_data))
--print("Data: " .. dump(data))

part1(data)

part2(data)
