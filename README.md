# AutomationForDuck

ORIGINAL CHALLENGE

QA Automation test:
- Build a small testing framework for web pages
    - Add the following tests for https://duckduckgo.com/
        - Search for Michael Jordan and verify:
            - A picture of Michael Jordan is displayed in the search results page
            - There is at least one wikipedia page results
            - There is at least one nba.com page result
        - Go to the 'Theme' page of duckduckgo, change the theme to 'Terminal'. Save and go to the main page. Verify the background color has changed.
        - Go to the 'All settings' page of duckduckgo, change the language to 'Lingvo' and verify the 'Language' label has been changed by 'Lingvo'

- Build a small script that retrieves data from duckduckgo's api (https://duckduckgo.com/api):
    - search for 'dogs' and print a list of all images retrieved
    - search for 'dogecoin' and print a list of all urls
    
You can use Python or JavaScript and any libraries/framework to build the tests.
We would like to see Gherkin implemented if possible, using any library like 'behave'.
It would be nice if the web pages tests generate any sort of basic html report.


NOTES: 

- The language used is Python with Robot Framework as a Selenium Wrapper
- Libraries used are robotframework , robotframework-seleniumlibrary 
- Gherkin is not implemented due to RobotFramework being Natural Language from the start, but could easily be converted to GIVEN WHEN THEN at the cost of readability
- HTML Reports and Screenshots are added in the Tests folder after each execution (Screenshots only on failed tests)

