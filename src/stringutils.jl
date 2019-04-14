capitalizecamelcase(str::String)::String =
    titlecase(replace(str, r"([A-Z])" => s" \1"))

getstr(bytes)::String =
    strip(String(bytes)) |>
        trim -> strip(trim, ['\0'])

getint(bytes)::Int =
    tryparse(Int, String(bytes)) |>
        n -> isa(n, Int) ? n : 0
