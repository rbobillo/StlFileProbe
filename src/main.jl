include("parsestl.jl")

import JSON

function main(args)
    file = isempty(args) ? "res/test.stl" : args[1]

    JSON.print(gsiblockfromstl(file), 2)
end

main(ARGS)
