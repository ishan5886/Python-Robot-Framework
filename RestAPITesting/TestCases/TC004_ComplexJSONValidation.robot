*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     os

*** Variables ***
${base_url}  https://restcountries.eu

*** Test Cases ***
Get_CountryInfo
        create session  myssion  ${base_url}
        ${response}=    get request     myssion     /rest/v2/alpha/IN

        ${json_object}=     to json  ${response.content}

        # Single Data Validation

        ${country_name}=     get value from json    ${json_object}  $.name
        log to console  ${country_name[0]}
        should be equal  ${country_name[0]}     India

        # Single Data Validation with Array

        ${borders_name}=     get value from json    ${json_object}  $.borders[0]
        log to console  ${borders_name[0]}
        should be equal  ${borders_name[0]}     AFG

        #Mulitple Data Validation in Array

         ${borders_name_all}=     get value from json    ${json_object}  $.borders
        log to console  ${borders_name_all[0]}
        should contain any  ${borders_name_all[0]}  AFG     BGD     BTN     MMR     CHN

