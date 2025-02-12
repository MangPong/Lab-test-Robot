*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}        http://automationexercise.com
${BROWSER}    Chrome
${NAME}       TestUser
${EMAIL}      mangpong.ar@gmail.com.com
${PASSWORD}   Test@123
${FIRSTNAME}  John
${LASTNAME}   Doe
${BIRTH_DAY}  10
${BIRTH_MONTH}  June
${BIRTH_YEAR}  1990
${COMPANY}    TestCompany
${ADDRESS}    123 Test Street
${ADDRESS2}   Apt 456
${COUNTRY}    Canada
${STATE}      Yukon
${CITY}       Whitehorse
${ZIPCODE}    Y0A
${MOBILE}     1234567890

*** Test Cases ***
Open Automation Exercise Website
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains    Automation Exercise    10s
    Close Browser


Test Sign Up
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Automation Exercise    10s
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Page Contains    New User Signup!    10s
    Close Browser

Click Signup/Login Button
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Automation Exercise    10s
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Page Contains    New User Signup!    10s
    Close Browser

Enter Name And Email For Signup
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Page Contains    New User Signup!    10s
    Input Text      xpath=//input[@data-qa='signup-name']    ${NAME}
    Input Text      xpath=//input[@data-qa='signup-email']   ${EMAIL}
    Click Button    xpath=//button[@data-qa='signup-button']
    Close Browser

Fill Address And Create Account
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    Input Text      xpath=//input[@data-qa='signup-name']    ${NAME}
    Input Text      xpath=//input[@data-qa='signup-email']   ${EMAIL}
    Click Button    xpath=//button[@data-qa='signup-button']
      
    Page Should Contain Element      xpath=//b[contains(text(), 'Enter Account Information')]


    # กรอกที่อยู่
    Click Element    xpath=//label[@for='id_gender1']    # Mr.
    Input Text    id=password    ${PASSWORD}
    Select From List By Value    id=days    ${BIRTH_DAY}
    Select From List By Label    xpath=//select[@id='months']    March
    Select From List By Value    id=years    ${BIRTH_YEAR}
   
   
    Input Text      xpath=//input[@id='first_name']    John
    Input Text      xpath=//input[@id='last_name']    Doe 
    Input Text      xpath=//input[@id='company']       Test Company
    Input Text      xpath=//input[@id='address1']      123 Test Street
    Input Text      xpath=//input[@id='address2']      Apt 456
    Select From List By Value    xpath=//select[@id='country']    Canada
    Input Text    xpath=//input[@id='state']   Yukon
    Input Text      xpath=//input[@id='city']     Whitehorse
    

    Input Text      xpath=//input[@id='zipcode']      ${ZIPCODE}
    Input Text      xpath=//input[@id='mobile_number']     ${MOBILE}
    Mouse Down    down 5    # เลื่อนหน้าจอลง 5 ครั้ง


    

    Wait Until Element Is Visible    xpath=//button[@data-qa='create-account-button']    3600s

    Click Button    xpath=//button[@data-qa='create-account-button']

    Wait Until Page Contains    ACCOUNT CREATED!    20s
    Capture Page Screenshot
    Close Browser




 
