*** Settings ****
Library    Collections
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

Variables    ../resources/common_config.yaml
Variables    ../resources/screen_elements/home_screen.yaml
Variables    ../resources/screen_elements/product_screen.yaml
Variables    ../resources/screen_elements/health_insurance_screen.yaml
Variables    ../resources/screen_elements/zero_cancer_screen.yaml

Variables    ../resources/test-data/person-one/address.yaml
# Variables    ../resources/common_config.yaml
# Variables    ../resources/screen_elements/welcome_screen.yaml
# Variables    ../resources/screen_elements/login_screen.yaml
# Variables   ../resources/${env}/config.yaml