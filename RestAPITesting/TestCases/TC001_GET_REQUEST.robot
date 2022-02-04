*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}  https://reqres.in/api/users

*** Test Cases ***
Get_UserInfo
        create session  myssion  ${base_url}
        ${response}=    get request     myssion     /2


#        log to console  ${response.status_code}
#        log to console  ${response.content}
#        log to console  ${response.headers}

        #Validations

        #Status Code
        ${status_code}=     convert to string    ${response.status_code}
        should be equal     ${status_code}  200

        # Verify Response Data
        ${body}=    convert to string    ${response.content}
        should contain  ${body}     Janet

        # Verify Content Type
        ${contentTypeValue}=    get from dictionary     ${response.headers}     Content-Type
        should be equal  ${contentTypeValue}    application/json; charset=utf-8



