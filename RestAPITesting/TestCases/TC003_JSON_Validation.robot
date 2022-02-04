*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections

*** Variables ***
${base_url}  https://reqres.in/api/users

*** Test Cases ***
Testcase1:
        ${json_obj}        load json from file      /Users/ishandhaliwal/Documents/RobotFrameworkPython/RestAPITesting/TestCases/test.json
        ${name_value}      get value from json   ${json_obj}     $.firstName
        should be equal    ${name_value[0]}      John


        ${street}      get value from json   ${json_obj}     $.address.streetAddress
        should be equal    ${street[0]}      A street

        log to console  ${name_value[0]}
        log to console  ${street[0]}

        ${phonenum}      get value from json   ${json_obj}     $.phoneNumbers[1].number
        log to console   ${phonenum[0]}
        should be equal    ${phonenum[0]}      0123-4567-8910



