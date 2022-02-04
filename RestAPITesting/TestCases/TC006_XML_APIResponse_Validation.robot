*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     RequestsLibrary
Library     XML

*** Variables ***
${base_url}  https://chercher.tech/sample

*** Test Cases ***
TestCase1
        create session  myssion  ${base_url}
        ${response}=        get request     myssion     /api/books.xml
        ${xml_string}=      convert to string  ${response.content}
        ${xml_obj}=     parse xml   ${xml_string}

        #Check single element value
        element text should be  ${xml_obj}      Hannah    .//book[1]/author

        #Check Multiple Values
        ${child_eles}=  get child elements      ${xml_obj}
        ${first_ele}=      get element text    ${child_eles[0]}
        log to console  ${first_ele}




