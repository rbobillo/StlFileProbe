include("jsonutils.jl")
include("stringutils.jl")

using Blink

import Blink

function guidisplay(json)
    window = Window()
    centre(window)
    title(window, "Stl File Probe")
    load!(window, "src/views/css/index.css")
    tmplte = read("src/views/html/index.template.html", String)
    gblock = gsiblockfromjson(json)
    fields = fieldnames(GsiBlock)
    listfs = join(map(x ->
        "<tr>" *
        "<th>$(capitalizecamelcase(string(x)))</th>" *
        "<td>$(getfield(gblock, Symbol(x)))</td>" *
        "</tr>",
        fields))
    body = replace(tmplte, "{{gsi_values}}" => listfs)
    size(window, 560, 780)
    body!(window, body)
end
