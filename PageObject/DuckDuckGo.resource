*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Identifiers for the Search
${url}  https://duckduckgo.com/
${duckduckgoLogo}   //a[@id='logo_homepage_link']
${duckSearch}   //input[@id='search_form_input_homepage']
${duckSearchGo}     //input[@id='search_button_homepage']
${JordanImage}  //img[@class='module--about__img']
${JordanWikipedia}  //a[normalize-space()='Michael Jordan - Wikipedia']
${JordanNBA}    //a[normalize-space()='Michael Jordan | Chicago Bulls | NBA.com']
#Identifiers for the Themes
${DuckSettings}     //a[contains(@class,'js-side-menu-open')]
${DuckThemes}      //a[normalize-space()='Themes']
${TerminalTheme}    //label[@for='setting_kae_t']//span[@class='set-theme__color-2']
${dismissPopUp}     //span[@class='ddgsi badge-link__close js-badge-link-dismiss']
${dismissPopUp2}    //span[@class='ddgsi badge-link__close js-badge-link-close']
${body}     //body
${expectedColor}    rgba(34, 34, 34, 1)


*** Keywords ***
#First we Open a Browser and Navigate to DDG, Verify that the search is visible before interacting
Navigate to DuckDuckGo
    Open Browser    url=${url}  browser=gc
    Wait Until Element Is Visible    ${duckduckgoLogo}
    Element Should Be Visible    ${ducksearch}
    Element Should Be Visible    ${duckSearchGo}

#Then we perform the search by typing the query and clicking on the search button
Search for Michael Jordan
    Input Text    ${duckSearch}     Michael Jordan
    Click Element    ${duckSearchGo}

#Next we check that the Wikipedia, NBA and image links are present
Verify Results of Search
    Wait Until Element Is Visible    ${JordanWikipedia}
    Click Element    ${dismissPopUp}
    Wait Until Element Is Visible    ${dismisspopup2}
    Click Element    ${dismisspopup2}
    Page Should Contain Link    ${JordanWikipedia}      message="No Wikipedia Link Found"
    Page Should Contain Link    ${JordanNBA}        message="No NBA Page Link"
    Page Should Contain Image    ${JordanImage}     message="Jordan Image not found"

#This ons is a bit longer, First we go to the theme section of the site and verify the current background color
#Then we change the theme to Terminal and verify the current color, and save it to a variable
#Finally we compare the saved variable to the expected one defined in the Variables section, which has the Terminal background color coded in
#Right now it's done in RGBA, but it could easily be done with Hex color codes as well.
#The Should Not be Equals method is used to ensure that the theme is actually changed and was not set to Terminal from the start
Change Theme
    Wait Until Element Is Visible    ${DuckSettings}
    Click Element    ${DuckSettings}
    Wait Until Element Is Visible    ${DuckThemes}
    Click Element    ${DuckThemes}
    ${page}    Get WebElement    ${body}
    ${color}    Call Method    ${page}      value_of_css_property       background-color
    Wait Until Element Is Visible    ${TerminalTheme}
    Click Element    ${TerminalTheme}
    ${page}    Get WebElement    ${body}
    ${color1}    Call Method    ${page}      value_of_css_property       background-color
    Should Not Be Equal As Strings    ${color}  ${color1}
    Should Be Equal As Strings    ${color1}  ${expectedColor}

