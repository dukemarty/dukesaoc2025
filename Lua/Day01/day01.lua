
require 'aoclib'

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end


function part1(lines)
  print_part_header(1, "Zero's count")
  
  p = 50
  res = 0
  for _, line in ipairs(lines) do
    -- print("line: " .. line)
    dir = string.sub(line, 1, 1)
    dist = tonumber(string.sub(line, 2, -1))
    -- print("dir = " .. dir .. " , dist = " .. dist)
    if dir == "L" then
      p = (p - dist) % 100
    elseif dir == "R" then
      p = (p + dist) % 100
    else
      error("invalid turn direction")
    end
    -- print("Next p = " .. p)
    if p == 0 then
      res = res + 1
    end
  end
  print("Number of zeros: " .. res)
end


print_day_header(1, "Secret Entrance")

-- raw_data = lines_from("sample.txt")
raw_data = lines_from("puzzle.txt")
print(raw_data)


part1(raw_data)

print_part_header(2, "lskndlck")



