include("parsestl.jl")

using Blink

import JSON2
import Blink

gsiBlockAsJson(gsib)::String = JSON2.write(gsib)

function displayGsi(json)
    w = Window()
    gblock = JSON2.read(json, GsiBlock)
    fields = fieldnames(GsiBlock)
    listfs = map(
        x -> "<li>$(x) : $(getfield(gblock, Symbol(x)))</li>",
        fields)
    body!(w, "<ul>$(join(listfs))</ul>")

    JSON2.@pretty json
end

function main(args)
    file = isempty(args) ? "res/test.stl" : args[1]
    gsib = gsiblockfromstl(file)
    json = gsiBlockAsJson(gsib)

    displayGsi(json)
end

main(ARGS)
