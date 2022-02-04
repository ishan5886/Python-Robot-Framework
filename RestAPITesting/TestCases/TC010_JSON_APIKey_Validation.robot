*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem

*** Variables ***
${base_url}         https://api.openweathermap.org

${req_uri}         data/2.5/forecast/daily?

*** Test Cases ***
TC_APIKey

        create session  myssion     ${base_url}
        ${params}   create dictionary   q=Delhi     cnt=1   appid=fe9c5cddb7e01d747b4611c3fc9eaf2c
        ${response}=    get on session     myssion      ${req_uri}     params=${params}
        log to console  ${response.status_code}
        log to console  ${response.content}



