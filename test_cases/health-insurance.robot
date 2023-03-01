*** Settings ***
Resource    ../resources/imports.resource
Resource   ../keywords/web_keyword.robot

Suite Setup    Open browser and accepted cookie
Suite Teardown    Close browser 

*** Variables ***

@{answer}    ${health_questions.question_one.no}    ${health_questions.question_two.no}    ${health_questions.question_three.never}
...    ${health_questions.question_four.never}    ${health_questions.question_five.no}    ${health_questions.question_six.no}

*** Test Cases ***
TC01 - Buy Insure TISCO Zero Cancer
    [Tags]    regression
    [Documentation]    to verify buy 'TISCO Zero Cencer' are run correctly util send to OTP

    Go to page by navbar    ผลิตภัณฑ์ประกัน
    Click card    ประกันสุขภาพและโรคร้าย
    Select Tab    ประกันคุ้มครองโรคมะเร็ง
    Select insurance card    ประกันภัยโรคมะเร็ง TISCO Zero Cancer
    Acceptd terms of use
    #Input form feild 
    Input form select coverage section (step 1) 
    ...    day=25     month=9    year=1996
    Input form select coverage section (step 2)    four
    Input form personal data (step 3)
    ...    title_name=1    first_name=วรินธร    last_name=ยังกิจการ    height=${155}     weight=${52}
    ...    occupation=A02    job_desc=A0201    id_cards=8909185970091
    ...    email=warintorn-i@hotmail.com    mobile=0851470376
    Input form health questions (step 3)    @{answer}
    Input form details questions for insure (step 3)    ${data_address}
    Submit and verify data (step 4)

