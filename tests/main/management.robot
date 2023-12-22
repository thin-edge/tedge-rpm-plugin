*** Settings ***
Resource    ../resources/common.robot
Library    Cumulocity

Suite Setup    Set Main Device

*** Test Cases ***

Install package via file
    ${binary_url}=    Cumulocity.Create Inventory Binary    example    binary    file=${CURDIR}/../testdata/example_1.2.3-r1_noarch.rpm
    ${operation}=    Cumulocity.Install Software    example,latest::rpm,${binary_url}
    Operation Should Be SUCCESSFUL    ${operation}
    Cumulocity.Device Should Have Installed Software    example,1.2.3-r1

Install package via file without release suffix
    ${binary_url}=    Cumulocity.Create Inventory Binary    dummy-without-release    binary    file=${CURDIR}/../testdata/dummy-without-release_2.0.1_noarch.rpm
    ${operation}=    Cumulocity.Install Software    dummy-without-release,latest::rpm,${binary_url}
    Operation Should Be SUCCESSFUL    ${operation}
    Cumulocity.Device Should Have Installed Software    dummy-without-release,2.0.1


Install/Uninstall package via Cumulocity
    # install
    ${operation}=    Cumulocity.Install Software    vim,latest::rpm
    Operation Should Be SUCCESSFUL    ${operation}
    Cumulocity.Device Should Have Installed Software    vim

    # remove
    ${operation}=    Cumulocity.Create Operation    fragments={"c8y_SoftwareUpdate":[{"name":"vim","version":"latest::rpm","url":"","action":"delete"}]}    description=Remove rpm package
    Operation Should Be SUCCESSFUL    ${operation}
    ${mo}=    Cumulocity.Device Should Have Fragments    c8y_SoftwareList
    Log    ${mo}
    Should Not Contain    ${mo}    vim