*** Settings ***
Library     JSONLibrary
Library     RequestsLibrary

*** Variables ***
${Api}     https://api.duckduckgo.com

*** Keywords ***
#API Call to the DDG API searching for Dogecoin
#SetVariable to get the JSON and not just the response code
#Get Value From JSON to get all URLs , as far as I can see in this query, FirstURL is the field in all JSON responses to get the URL for each get variable value
#Log To Console to print it in the console, will be in the report as well
API Call Dogecoin
    ${response}=     GET    url=https://api.duckduckgo.com/?q=dogecoin&format=json&pretty=1
    ${json}=    set variable    ${response.json()}
    @{dogeURL}=    Get Value From Json    ${json}      $..FirstURL
    log to console    ${dogeURL}



#Same as the above, but iterating on each Icon>URL , as there are no other images returned
API Call Dog Image
    ${response}=     GET    url=https://api.duckduckgo.com/?q=Dog&format=json&pretty=1
    ${json}=    set variable    ${response.json()}
    @{dogImg}=    Get Value From Json    ${json}      $..Icon..URL
    log to console    ${dogImg}