if false then  --code to collect all item names and icons from game to pass to colorcompute.py
    local function pylist(table)
        out = ""
        out = out.."{"
        for signal,value in pairs(table) do
            out = out.."\""..signal.."\": \""..value.."\","
        end
        out = out.."}"
        print(out)
        print("breakpoint me!")
    end
    local itemsignals = {}
    local fluidsignals = {}
    local virtualsignals = {}
    for k,v in pairs(data.raw.item) do itemsignals[k] = v.icon end
    for k,v in pairs(data.raw.fluid) do fluidsignals[k] = v.icon end
    for k,v in pairs(data.raw["virtual-signal"]) do virtualsignals[k] = v.icon end
    pylist(itemsignals)
    pylist(fluidsignals)
    pylist(virtualsignals)
end
