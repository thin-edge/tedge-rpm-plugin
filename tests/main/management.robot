*** Settings ***
Resource    ../resources/common.robot
Library    Cumulocity

Suite Setup    Set Main Device

*** Test Cases ***

Install package via file
    ${binary_url}=    Cumulocity.Create Inventory Binary    example    binary    file=${CURDIR}/../testdata/example-1.2.3-r1.noarch.rpm
    ${operation}=    Cumulocity.Install Software    example,latest::rpm,${binary_url}
    Operation Should Be SUCCESSFUL    ${operation}
    Cumulocity.Device Should Have Installed Software    example,1.2.3-r1

Install/Uninstall package via Cumulocity
    # install
    ${operation}=    Cumulocity.Install Software    jq,latest::rpm
    Operation Should Be SUCCESSFUL    ${operation}
    Cumulocity.Device Should Have Installed Software    jq

    # remove
    ${operation}=    Cumulocity.Uninstall Software    jq,latest::rpm
    Operation Should Be SUCCESSFUL    ${operation}
    ${mo}=    Cumulocity.Device Should Have Fragments    c8y_SoftwareList
    Log    ${mo}
    Should Not Contain    ${mo}    jq
