include("parsestl.jl")

import JSON2

function main(args)
    file = isempty(args) ? "res/test.stl" : args[1]

    json = JSON2.write(gsiblockfromstl(file))

    JSON2.@pretty json
end

main(ARGS)
