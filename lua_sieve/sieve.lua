local max = 1000000
local start = os.time()
local iterations = 0
local diff = os.difftime(os.time(), start)


local function find_primes (max_num)
    local bv = {};
    local arr_len = math.floor(max_num / 2) + 1
    for i = 1, arr_len, 1 do
        bv[i] = true
    end

    for i = 3, math.floor(math.sqrt(max_num)), 2 do
        local ch = math.floor(i / 2)

        if bv[ch] then
            local j = i
            while i * j < max_num do
                bv[math.floor((i * j) / 2)] = false
                j = j + 2
            end
        end
    end

    local num = -1;
    for _, p in pairs(bv) do
        if p then
            num = num + 1
        end
    end

    return num
end

while diff < 5 do
    find_primes(max)
    iterations = iterations + 1
    diff = os.difftime(os.time(), start)
end
print(string.format("Lua did %i iterations in 5 seconds", iterations))
