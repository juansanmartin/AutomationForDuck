*** Settings ***
Resource    ../PageObject/DuckDuckGo.resource

*** Test Cases ***
DDG Search for MJ
    Navigate To DuckDuckGo
    Search For Michael Jordan
    Verify Results Of Search
    Change Theme
    Change Language
    Close All Browsers

