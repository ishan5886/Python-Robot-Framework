*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}  https://reqres.in/api/users

*** Test Cases ***
Post_UserInfo
        create session  mysession  ${base_url}

        ${body}=    create dictionary  name=Ishan   job=QA Manager
        ${header}=  create dictionary   Content-Type=application/json; charset=utf-8
        ${response}     post request     mysession  /  data=${body}     headers=${header}


        log to console      ${response.status_code}
        log to console      ${response.content}

        #Validations

        #Status Code
        ${status_code}=     convert to string    ${response.status_code}
        should be equal     ${status_code}  201

        # Verify Response Data
        ${res_body}=    convert to string    ${response.content}
        should contain  ${res_body}     createdAt



