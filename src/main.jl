include("jsonutils.jl")
include("stringutils.jl")
include("gui.jl")
include("parsestl.jl")

function displaygsi(json)
    guidisplay(json)

    prettydisplay(json)
end

function main(args)
    file = isempty(args) ? "res/test.stl" : args[1]
    gsib = gsiblockfromstl(file)
    json = gsiblockasjson(gsib)

    displaygsi(json)
end

main(ARGS)
