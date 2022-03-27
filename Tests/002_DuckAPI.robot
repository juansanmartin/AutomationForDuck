*** Settings ***
Resource    ../PageObject/APIDDG.resource

*** Test Cases ***
DDG Search for MJ
    API Call Dogecoin
    API Call Dog Image

