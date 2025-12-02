
function print_day_header(day, title)
    print("")
    line = "-- Day " .. day .. ": " .. title .. "---"
    print(line)
    print(string.rep("=", string.len(line)))
    print("")
end

function print_part_header(id, title)
    print("")
    line = "Part " .. id .. ": " .. title
    print(line)
    print(string.rep("-", string.len(line)))
end
