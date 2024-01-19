*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}  http://localhost:3003/
${BROWSER}   chrome
*** Test Cases ***
Verify if the user has open the app
    Open Browser  http://localhost:3003/  chrome
    Maximize Browser Window
    Page Should Contain    Welcome to My Bookstore
    Sleep    3s

Click on Explore me button
    Click Button    //*[@id="navbarNav"]/ul/li[1]/button
    Page Should Contain    Login!
    Sleep    3s
Check for User login 
    # Fill in the login form
    Input Text    id=email    kashifkhankk799872@gmail.com
    Input Text    id=password    Kashif

    # Click the login button
    Click Button    xpath://button[contains(text(), 'Login!')]
    Page Should Contain   div
    Sleep    3s

Check the search functionality 
     # Fill in the search form with the query
    Input Text    css=input[type='text']    the kite runner

    # Click the search button
    Click Button    //*[@id="basic-navbar-nav"]/form/button
    Sleep    2s
    # Wait for the search results to load
    Page Should Contain    div
    Sleep    2s

Check sign up functionality
    Open Browser  http://localhost:3003/  chrome
    Maximize Browser Window
    Page Should Contain    Welcome to My Bookstore
    Sleep    3s
    Click Button    //*[@id="navbarNav"]/ul/li[2]/button
    Page Should Contain    Sign up

Users should Register themselves
    Open Browser  http://localhost:3003/  chrome
    Maximize Browser Window
    Page Should Contain    Welcome to My Bookstore
    Sleep    3s
    Click Button    //*[@id="navbarNav"]/ul/li[2]/button
    Page Should Contain    Sign up
    Input Text    id=name    John Doe
    Input Text    id=email    john.doe@example.com
    Input Text    id=password    samplePassword
    Input Text    id=confirmPassword    samplePassword
    Click Button   //*[@id="root"]/div/section/div/div/div/div/div/div/div/form/div[6]/button
    Sleep    2s
    Page Should Contain    div
    Sleep    2s

Test Logout
    Open Browser  http://localhost:3003/  chrome
    Maximize Browser Window
    Page Should Contain   Welcome to My Bookstore
    Sleep    3s
    Click Button    //*[@id="navbarNav"]/ul/li[3]/button
    Input Text    id=email    kashifkhankk799872@gmail.com
    Input Text    id=password    Kashif
    Click Button    xpath://button[contains(text(), 'Login!')]
    Sleep    3s
    Input Text    css=input[type='text']    the kite runner

    # Click the search button
    Click Button    //*[@id="basic-navbar-nav"]/form/button
    Sleep    2s
    # Wait for the search results to load
    Page Should Contain    div
    Sleep    2s
    Click Button    //*[@id="basic-navbar-nav"]/div[2]/button
    Page Should Contain    Welcome to My Bookstore
Test Successful Login
    Open Browser  ${BASE_URL}/login  ${BROWSER}
    Input Text    id=email     testuser@example.com
    Input Text    id=password  testpassword
    Click Button  css=button.btn-primary
    Sleep         2s
    Page Should Contain  Search Results

Test Failed Login
    Open Browser  ${BASE_URL}/login  ${BROWSER}
    Input Text    id=email     invaliduser@example.com
    Input Text    id=password  invalidpassword
    Click Button  css=button.btn-primary
    Sleep         2s
    Page Should Not Contain  Search Results

Test Search Books No Results
    Open Browser  ${BASE_URL}/search  ${BROWSER}
    Input Text    css=input.form-control   non-existent book
    Click Button  css=button.btn-outline-success
    Sleep         2s
    Page Should Contain  No results found.

# Test cases for Home component
Test Home Page
    Open Browser  ${BASE_URL}  ${BROWSER}
    Page Should Contain  Welcome to My Bookstore
    Page Should Contain  Explore Now
    Page Should Contain  Sign Up for Free
    Page Should Not Contain  Logout

# Test cases for navigation
Test Navigation from Home to Login
    Open Browser  ${BASE_URL}  ${BROWSER}
    Click Button  xpath=//button[contains(text(), 'Explore Now')]
    Sleep         2s
    Page Should Contain  Login!

Test Navigation from Home to Signup
    Open Browser  ${BASE_URL}  ${BROWSER}
    Click Button  xpath=//button[contains(text(), 'Sign Up for Free')]
    Sleep         2s
    Page Should Contain  Sign up