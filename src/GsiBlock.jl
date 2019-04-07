struct GsiBlock
    codePageNumber::String
    diskFormatCode::String
    displayStandardCode::String
    characterCodeTable::String
    languageCode::String
    originalProgrammeTitle::String
    originalEpisodeTitle::String
    translatedProgrammeTitle::String
    translatedEpisodeTitle::String
    translatorsName::String
    translatorContactDetails::String
    subtitleListReferenceCode::String
    creationDate::String #Date
    revisionDate::String #Date
    revisionNumber::Int
    totalNumberOfSubtitles::Int
    totalNumberOfTtiBlocks::Int
    totalNumberOfSubtitleGroups::Int
    maximumNumberOfCharacters::Int
    maximumNumberOfRows::Int
    timecodeStatus::Int
    startOfProgramme::Int
    firstInCue::Int
    totalNumberOfDisks::Int
    diskSequenceNumber::Int
    countryOfOrigin::String
    publisher::String
    editorsName::String
    editorsContactDetails::String
    spareBytes::String
    userDefinedArea::String
end
