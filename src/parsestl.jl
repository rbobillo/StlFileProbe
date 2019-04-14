include("GsiBlock.jl")
include("stringutils.jl")

function gsiblockfromstl(file)::GsiBlock
    io = open(file)

    gsiblock = GsiBlock(
        getstr(read(io, 3)),   # codePageNumber              :: String
        getstr(read(io, 8)),   # diskFormatCode              :: String
        getstr(read(io, 1)),   # displayStandardCode         :: String
        getstr(read(io, 2)),   # characterCodeTable          :: String
        getstr(read(io, 2)),   # languageCode                :: String
        getstr(read(io, 32)),  # originalProgrammeTitle      :: String
        getstr(read(io, 32)),  # originalEpisodeTitle        :: String
        getstr(read(io, 32)),  # translatedProgrammeTitle    :: String
        getstr(read(io, 32)),  # translatedEpisodeTitle      :: String
        getstr(read(io, 32)),  # translatorsName             :: String
        getstr(read(io, 32)),  # translatorContactDetails    :: String
        getstr(read(io, 16)),  # subtitleListReferenceCode   :: String
        getstr(read(io, 6)),   # creationDate                :: String #Date
        getstr(read(io, 6)),   # revisionDate                :: String #Date
        getint(read(io, 2)),   # revisionNumber              :: Int
        getint(read(io, 5)),   # totalNumberOfSubtitles      :: Int
        getint(read(io, 5)),   # totalNumberOfTtiBlocks      :: Int
        getint(read(io, 3)),   # totalNumberOfSubtitleGroups :: Int
        getint(read(io, 2)),   # maximumNumberOfCharacters   :: Int
        getint(read(io, 2)),   # maximumNumberOfRows         :: Int
        getint(read(io, 1)),   # timecodeStatus              :: Int
        getint(read(io, 8)),   # startOfProgramme            :: Int
        getint(read(io, 8)),   # firstInCue                  :: Int
        getint(read(io, 1)),   # totalNumberOfDisks          :: Int
        getint(read(io, 1)),   # diskSequenceNumber          :: Int
        getstr(read(io, 3)),   # countryOfOrigin             :: String
        getstr(read(io, 32)),  # publisher                   :: String
        getstr(read(io, 32)),  # editorsName                 :: String
        getstr(read(io, 32)),  # editorsContactDetails       :: String
        getstr(read(io, 75)),  # spareBytes                  :: String
        getstr(read(io, 376)), # userDefinedArea             :: String
    )

    close(io)

    gsiblock
end
