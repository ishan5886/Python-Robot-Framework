*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}  https://reqres.in/api/users

*** Test Cases ***
Get_Header_Info
        create session  myssion  ${base_url}
        ${response}=    get request     myssion     /2



#        log to console  ${response.headers}
#
#        #Validations
#
#
#        # Verify specific Header value Content Type
#        ${contentTypeValue}=    get from dictionary     ${response.headers}     Content-Type
#        should be equal  ${contentTypeValue}    application/json; charset=utf-8

        #Verify Cookies

        log to console      ${response.cookies}
        ${cookieValue}=    get from dictionary    ${response.cookies}       __cfduid



