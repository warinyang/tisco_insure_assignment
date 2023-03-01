*** Settings ***
Resource    ../resources/imports.resource

*** Keywords ***

Open browser and accepted cookie
    Open Browser    ${tisco_insure_url}    browser=chrome
    Wait Until Element Is Visible    ${navbar}
    Wait Until Element Is Visible    ${cookie_button}
    Set Focus To Element    ${cookie_button}
    Click Element    ${cookie_button}
    # Maximize Browser Window

Go to page by navbar
    [Arguments]    ${menu_name}
    ${nav_link}    Replace String    ${nav_link}    $NAME    ${menu_name}
    Set Focus To Element    ${nav_link}
    Click Element    ${nav_link}
    Wait Until Element Is Visible    ${cards}
    Capture Page Screenshot

Click card 
    [Arguments]    ${card_name}
    ${card_button}    Replace String    ${card_button}    $NAME    ${card_name}
    Wait Until Element Is Visible    ${card_button}    timeout=10 s
    Set Focus To Element    ${card_button}
    Click Element    ${card_button}
    Wait Until Element Is Visible    ${health_insurance_page_name_section}    timeout=10 s

Select Tab
    [Arguments]    ${tab_name}
    ${tab}    Replace String    ${health_insurance_tab}    $NAME    ${tab_name}
    Wait Until Element Is Visible    ${tab}
    Set Focus To Element    ${tab}
    Click Element    ${tab}

Select insurance card
    [Arguments]    ${insure_name}
    ${health_insurance_card_button}    Replace String    ${health_insurance_card_button}    $NAME    ${insure_name}
    Log    ${health_insurance_card_button}
    Wait Until Element Is Visible    ${health_insurance_card_button}
    Set Focus To Element    ${health_insurance_card_button}
    Click Link    ${health_insurance_card_button}

Acceptd terms of use
    Wait Until Element Is Visible    ${accept_button}
    Click Button    ${accept_button}

Input form select coverage section (step 1) 
    [Arguments]    ${day}    ${month}    ${year}
    Wait and Click Element    ${insured_for.myself}
    Wait and Click Element    ${gender_is.women}
    Wait Until Element Is Visible  ${date.day}
    Select From List By Value    ${date.day}    ${day}  #Selected date of birth
    Select From List By Value    ${date.month}    ${month}
    Select From List By Value    ${date.year}    ${year}
    Wait and Click Element    ${has.never_been_cancer}
    Set Focus To Element    ${submit_first_step}
    Click Element    ${submit_first_step}

Wait and Click Element
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

Input form select coverage section (step 2) 
    [Arguments]    ${paln}
    Log    ${plan.${paln}}
    Wait and Click Element    ${plan.${paln}}
    Wait Until Element Is Visible    ${submit_second_step}
    Set Focus To Element    ${submit_second_step}
    # Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    3
    Click Button    ${submit_second_step}

Input form personal data (step 3)
    [Arguments]    ${title_name}    ${first_name}    ${last_name}    ${height}     ${weight}
    ...    ${occupation}    ${job_desc}    ${id_cards}    ${email}    ${mobile}
    Select From List By Value    ${information.title_name}    ${title_name}
    Wait and Input Text    ${information.first_name}    ${first_name}
    Wait and Input Text    ${information.last_name}    ${last_name}
    Wait and Input Text    ${information.height}    ${height}
    Wait and Input Text    ${information.weight}    ${weight}
    Wait and Input Text    ${information.id_cards}    ${id_cards}
    Mouse Over    ${information.maritalStatus.single}
    Set Focus To Element    ${information.maritalStatus.single}
    Wait and Click Element    ${information.maritalStatus.single}
    # Click Element    ${information.maritalStatus.single}
    Input Text    ${information.email}    ${email}
    Input Text    ${information.mobile}    ${mobile}
    Select From List By Value    ${information.occupation}    ${occupation}
    Select From List By Value    ${information.job_desc}    ${job_desc}


Wait and Input Text
    [Arguments]    ${element}    ${value}
    Wait Until Element Is Visible    ${element}
    Input Text    ${element}    ${value}

Input form health questions (step 3)
    [Arguments]    @{answer}
    Log    ${answer}
    FOR    ${i}    IN    @{answer}
        Wait Until Element Is Visible    ${i}
        Click Element    ${i}
    END
    Wait and Click Element    ${submit_third_step}

Input form details questions for insure (step 3)
    [Arguments]    ${dic_person_data}
    Wait Until Element Is Visible    ${detail_for_ask_insure_title}
    Wait and Input Text    ${detail_for_ask_insure.address}    ${dic_person_data.address} 
    Wait and Input Text    ${detail_for_ask_insure.district}    ${dic_person_data.district}
    Wait Until Element Is Visible    ${detail_for_ask_insure.suggession_dropdown_dist}
    Set Focus To Element    ${detail_for_ask_insure.suggession_dropdown_dist}
    Click Element    ${detail_for_ask_insure.suggession_dropdown_dist}
    Set Focus To Element    ${detail_for_ask_insure.beneficiary.legal_heir}
    Click Element    ${detail_for_ask_insure.beneficiary.legal_heir}
    Click Element    ${detail_for_ask_insure.send.current_address}
    Click Element    ${detail_for_ask_insure.tex.decline}
    Set Focus To Element    ${submit_third_step_2}
    Click Element    ${submit_third_step_2}
    Sleep    4

Submit and verify data (step 4)
    Wait Until Element Is Visible    ${veriy_screen_title}
    Wait and Click Element    ${submit_third_step_3}
    Sleep    4
