*** Settings ***
Library     XML
Library     os
Library     Collections

*** Test Cases ***
Testcase1:
        ${xml_obj}=         parse xml       /Users/ishandhaliwal/Documents/RobotFrameworkPython/RestAPITesting/TestCases/Food.xml

        #Validations

        #Single Element Value  - Approach 1
        ${price}       get element text    ${xml_obj}      .//food[1]/price
        log to console   ${price}
        should be equal  ${price}      $5.95


         #Single Element Value  - Approach 2
         element text should be     ${xml_obj}      $5.95       .//food[1]/price

         #Check number of element nodes
         ${count}=      get element count      ${xml_obj}      .//price   #Check for count of all <price> nodes in xml
         log to console  ${count}
         should be equal as integers  ${count}       5


         #Check attirbute presence
         element attribute should be        ${xml_obj}      id    4    .//food[4]

         #Check value of child elements

         ${child_ele}=      get child elements    ${xml_obj}       .//food[4]
         log to console  ${child_ele}

        should not be empty  ${child_ele}

        ${name}=      get element text    ${child_ele[0]}  //Fetch child element text based on index starting from 0
        log to console  ${name}

