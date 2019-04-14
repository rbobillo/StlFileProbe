include("GsiBlock.jl")

import JSON2

gsiblockfromjson(gsib::String)::GsiBlock = JSON2.read(gsib, GsiBlock)

gsiblockasjson(gsib::GsiBlock)::String = JSON2.write(gsib)

prettydisplay(json::String) = JSON2.@pretty json
