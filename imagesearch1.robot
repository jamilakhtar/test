# ## Google Image Search Example test commit
# This simple robot will execute a Google Image Search and save the first result image.
#

*** Settings ***
Documentation     Executes Google image search and stores the first result image.
Library           Autosphere.Browser.Selenium

*** Variables ***
${GOOGLE_URL}     https://google.com/?hl=en
${SEARCH_TERM}    rpa

*** Keywords ***
Accept Google Consent
    Click Element    xpath://button/div[contains(text(), 'I agree')]

*** Keywords ***
Open Google search page
	Log To Console	"====Logging to Console====="   
    Open Browser    ${GOOGLE_URL}
    Run Keyword And Ignore Error    Accept Google Consent

*** Keywords ***
Search for
    [Arguments]    ${text}
    Input Text    name:q    ${text}
    Press Keys    name:q    ENTER
    Wait Until Page Contains Element    search

*** Keywords ***
View image search results
    Click Link    Images

*** Keywords ***
Screenshot first result
    Capture Element Screenshot    css:div[data-ri="0"]

*** Tasks ***
Execute Google image search and store the first result image
    Open Google search page    
    Search for    ${SEARCH_TERM}
    View image search results
    [Teardown]    Close Browser
