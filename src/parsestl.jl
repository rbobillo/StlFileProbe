include("GsiBlock.jl")

getStr(io::IO)::String =
    strip(String(io)) |>
        trim -> strip(trim, ['\0'])

getInt(io::IO)::Int =
    tryparse(Int, String(io)) |>
        n -> isa(n, Int) ? n : 0

function gsiblockfromstl(file)::GsiBlock
    io = open(file)

    gsiblock = GsiBlock(
        getStr(read(io, 3)),   # codePageNumber              :: String
        getStr(read(io, 8)),   # diskFormatCode              :: String
        getStr(read(io, 1)),   # displayStandardCode         :: String
        getStr(read(io, 2)),   # characterCodeTable          :: String
        getStr(read(io, 2)),   # languageCode                :: String
        getStr(read(io, 32)),  # originalProgrammeTitle      :: String
        getStr(read(io, 32)),  # originalEpisodeTitle        :: String
        getStr(read(io, 32)),  # translatedProgrammeTitle    :: String
        getStr(read(io, 32)),  # translatedEpisodeTitle      :: String
        getStr(read(io, 32)),  # translatorsName             :: String
        getStr(read(io, 32)),  # translatorContactDetails    :: String
        getStr(read(io, 16)),  # subtitleListReferenceCode   :: String
        getStr(read(io, 6)),   # creationDate                :: String #Date
        getStr(read(io, 6)),   # revisionDate                :: String #Date
        getInt(read(io, 2)),   # revisionNumber              :: Int
        getInt(read(io, 5)),   # totalNumberOfSubtitles      :: Int
        getInt(read(io, 5)),   # totalNumberOfTtiBlocks      :: Int
        getInt(read(io, 3)),   # totalNumberOfSubtitleGroups :: Int
        getInt(read(io, 2)),   # maximumNumberOfCharacters   :: Int
        getInt(read(io, 2)),   # maximumNumberOfRows         :: Int
        getInt(read(io, 1)),   # timecodeStatus              :: Int
        getInt(read(io, 8)),   # startOfProgramme            :: Int
        getInt(read(io, 8)),   # firstInCue                  :: Int
        getInt(read(io, 1)),   # totalNumberOfDisks          :: Int
        getInt(read(io, 1)),   # diskSequenceNumber          :: Int
        getStr(read(io, 3)),   # countryOfOrigin             :: String
        getStr(read(io, 32)),  # publisher                   :: String
        getStr(read(io, 32)),  # editorsName                 :: String
        getStr(read(io, 32)),  # editorsContactDetails       :: String
        getStr(read(io, 75)),  # spareBytes                  :: String
        getStr(read(io, 376)), # userDefinedArea             :: String
    )

    close(io)

    gsiblock
end
