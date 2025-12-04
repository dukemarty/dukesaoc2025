
require '../aoc_utils/aoclib'
require '../aoc_utils/aocio'


-- ----------------------------------------------------------------
-- Part 1 stuff

-- helper function for part 1
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

-- part 1 solution
function part1(lines)
  print_part_header(1, "Total max voltage")
  
  res = 0
  
  for _, l in ipairs(lines) do
--    print("Next line: " .. l)
    res = res + part1_find_max_joltage(l)
  end
    
  print("Sum of maximized joltage: " .. res)
end


-- ---------------------------------------------------------------
-- Part 2 stuff


function part2_move_left_upto(line, poss, vals, i, boundary)
    for j = poss[i], boundary+1, -1 do
      if line:sub(j, j) >= vals[i] then
        if i > 1 then
          part2_move_left_upto(line, poss, vals, i-1, j)
        end
        poss[i], vals[i] = j, line:sub(j, j)
      end
    end
end

-- main helper function for part 2
-- create basic data structures, call recursive search
function part2_find_max_joltage(line, battery_count)
  poss, vals= {}, {}
  for i = 0, battery_count-1, 1 do
    poss[i+1], vals[i+1] = #line - i, line:sub(#line - i,#line - i)
  end
--  print("Initials: \n" .. dump(poss) .. "\n" .. dump(vals))
 
  hval_index = battery_count
  for cand = poss[hval_index], 1, -1 do
    if line:sub(cand, cand) >= vals[hval_index] then
--      print("Found better candidate for highest value at index " .. cand .. ": " .. line:sub(cand, cand))
      part2_move_left_upto(line, poss, vals, hval_index - 1, cand)
      poss[hval_index], vals[hval_index] = cand, line:sub(cand, cand)
    end
  end
  
  res = ""
  for i = hval_index, 1, -1 do
    res = res .. vals[i]
  end
  return res
end

-- part 2 solution
function part2(lines)
  print_part_header(2, "12 batteries")
  
  res = 0
  
  for _, l in ipairs(lines) do
--    print("Next line: " .. l)
    res = res + part2_find_max_joltage(l, 12)
  end
    
  print("Sum of maximized joltage: " .. res)
end


-- ----------------------------------------------------------------
-- MAIN PROGRAM
-- ----------------------------------------------------------------

print_day_header(3, "Lobby")

--raw_data = lines_from("Day03/sample.txt")
raw_data = lines_from("Day03/puzzle.txt")
--print("Raw data: " .. dump(raw_data))


part1(raw_data)

part2(raw_data)

