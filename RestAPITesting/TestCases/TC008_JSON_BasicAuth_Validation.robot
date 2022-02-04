*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}   https://postman-echo.com/basic-auth

*** Test Cases ***
Get_Header_Info
        ${auth}=    create list     postman    password
        create session  myssion     ${base_url}    auth=${auth}
        ${response}=    get request     myssion    /
        log to console      ${response.content}



