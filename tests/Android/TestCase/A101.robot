*** Settings ***
Library    AppiumLibrary
Library    ../AndroidBaseUICore.py
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/CathyBankVariable.txt

Suite Setup    Android Open Chrome Browser

Test Setup    Go To Url    https://www.cathaybk.com.tw/cathaybk/personal/loan/calculator/mortgage-budget/

*** Test Cases ***
檢查房貸試算標題文字
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_purchaseBudgetTitle}    10

檢查子標題文字是否正確
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_purchaseBudgetSubTitle1}    10
    Wait Until Element Is Visible    ${homeCalculate_text_purchaseBudgetSubTitle2}    10
    Wait Until Element Is Visible    ${homeCalculate_text_purchaseBudgetSubTitle3}    10

檢查購屋貸款方案文字連結導向
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_purchaseBudgetTitle}    10
    Click Element After It Is Visible    ${homeCalculate_text_purchaseBudgetSubTitle2}    10
    Wait Until Element Is Visible    ${homeCalculate_text_homeLoanPlan}    10
    Wait Until Element Is Visible    xpath=//*[@text="貸款選擇多元"]    10

檢查必填欄位警訊文字
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_reqiredFiled}    10

檢查房屋座落區域標題
    [Tags]    P2
    Wait Until Element Is Visible    xpath=//*[@text="*"]    10
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocateTitle}    10
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocateTitleMark}    10

檢查房屋座落區域place-holder
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district}    10

檢查房屋座落區域選擇區域後place-holder
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible And Element Text Should Be    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    請選擇區域    10

檢查房屋座落區域place-holder_輸入狀態
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Wait Until Element Is Visible    xpath=//*[@text="文山區"]    10

檢查不選擇房屋座落區塊縣市直接選擇屋座落區塊區域
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district}    10
    Wait Until Element Is Visible    xpath=//*[@text="選擇行政區"]    10

檢查重新選擇縣市直接選擇屋座落區塊區域
    [Tags]    Bug    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Scroll UP Until Element Found    xpath=//*[@text="選擇縣市"]
    Click Element After It Is Visible    xpath=//*[@text="選擇縣市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district}    10
    Wait Until Element Is Visible    xpath=//*[@text="選擇行政區"]    10

檢查房屋座落區塊縣市不選擇
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    3    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    3    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_chooseCity}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_chooseLocate}    10

檢查房屋座落區塊區域不選擇
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    3    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    3    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_chooseLocate}    10

檢查每月可負擔房貸金額區域標題
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible    ${homeCalculate_text_everyMonthCanPayTitleMark}    10
    Wait Until Element Is Visible    ${homeCalculate_text_everyMonthCanPayTitle}    10

檢查每月可負擔房貸金額輸入欄位
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible And Element Text Should Be    ${homeCalculate_text_everyMonthCanPayUnit}    萬元    10

檢查每月可負擔房貸金額輸入框_空白_錯誤狀態顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    3    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_everyMonthCanpay}    10

檢查每月可負擔房貸金額輸入欄位_非數字_錯誤狀態顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    Cathay    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    3    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_everyMonthCanpay}    10

檢查每月可負擔房貸金額輸入欄位_標點符號_錯誤狀態顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    :)    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    3    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_everyMonthCanpay}    10

檢查每月可負擔房貸金額輸入欄位輸入負數
    [Tags]    P1    Bug
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    -100    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    3    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_everyMonthCanpay}    10

檢查貸款年限區域標題
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible    ${homeCalculate_text_loanTermTitle}    10
    Wait Until Element Is Visible    ${homeCalculate_text_loanTermTitleMark}    10

檢查貸款利率區域標題
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible    ${homeCalculate_text_loanInterestRate}    10
    Wait Until Element Is Visible    ${homeCalculate_text_loanInterestRateMark}    10

檢查貸款利率輸入框顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible    ${homeCalculate_text_loanInterestRatePersent}    10

檢查貸款利率輸入框_空白_錯誤狀態顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    10    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_loanInterestRate}    10

檢查貸款利率輸入框_非數字_錯誤狀態顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    10    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    Cathay    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_loanInterestRate}    10

檢查貸款利率輸入框_標點符號_錯誤狀態顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    10    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    :)    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    ${homeCalculate_text_errorMessage_loanInterestRate}    10

檢查貸款利率輸入匡_輸入負數
    [Tags]    Bug    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    10    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    -5    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible And Element Text Should Be    ${homeCalculate_text_spanHousePrice}    0    10

檢查無網路下開始試算正流程
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Set Network Connection Status    0
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    6    10
    Click Element After It Is Visible    xpath=//*[@text="30年"]    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    2.2    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Set Network Connection Status    2
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@text="試算結果"]    10
    Wait Until Element Is Visible    xpath=//*[@text="注意事項： 本試算結果僅供參考，實際貸款條件仍依法令規範及本行提供之產品為準；本行將依您實際信用狀況、個人資力及擔保品價值等資訊，綜合評量審查決定核准與否，並同時保留調整產品規格、申貸期限及其他相關規定之權利。"]    10
    Wait Until Element Is Visible    xpath=//*[@text="還在等什麼呢？"]    10
    Wait Until Element Is Visible And Element Text Should Be    ${homeCalculate_text_spanHousePrice}    1,975萬    10
    [Teardown]    Set Network Connection Status    2
檢查重新試算按鈕功能_30年限
    [Tags]    Bug    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    6    10
    Click Element After It Is Visible    xpath=//*[@text="30年"]    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    2.2    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    xpath=//*[@text="試算結果"]    10
    Wait Until Element Is Visible    xpath=//*[@text="注意事項： 本試算結果僅供參考，實際貸款條件仍依法令規範及本行提供之產品為準；本行將依您實際信用狀況、個人資力及擔保品價值等資訊，綜合評量審查決定核准與否，並同時保留調整產品規格、申貸期限及其他相關規定之權利。"]    10
    Wait Until Element Is Visible    xpath=//*[@text="還在等什麼呢？"]    10
    Wait Until Element Is Visible And Element Text Should Be    ${homeCalculate_text_spanHousePrice}    1,975萬    10
    Scroll UP Until Element Found    ${homeCalculate_button_startCalculating}
    Click Element After It Is Visible    ${homeCalculate_button_retryCalculation}    10
    Scroll UP Until Element Found    ${homeCalculate_text_houseLocateTitle}
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district}    10

檢查重新試算按鈕功能_其他年限
    [Tags]    Bug    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    6    10
    Click Element After It Is Visible    xpath=//*[@text="40年"]    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    2.2    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    xpath=//*[@text="試算結果"]    10
    Wait Until Element Is Visible    xpath=//*[@text="注意事項： 本試算結果僅供參考，實際貸款條件仍依法令規範及本行提供之產品為準；本行將依您實際信用狀況、個人資力及擔保品價值等資訊，綜合評量審查決定核准與否，並同時保留調整產品規格、申貸期限及其他相關規定之權利。"]    10
    Wait Until Element Is Visible    xpath=//*[@text="還在等什麼呢？"]    10
    Wait Until Element Is Visible And Element Text Should Be    ${homeCalculate_text_spanHousePrice}    1,975萬    10
    Scroll UP Until Element Found    ${homeCalculate_button_startCalculating}
    Click Element After It Is Visible    ${homeCalculate_button_retryCalculation}    10
    Scroll UP Until Element Found    ${homeCalculate_text_houseLocateTitle}
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district}    10

檢查房貸試算-建議購屋預算試算結果顯示
    [Tags]    P1
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    6    10
    Click Element After It Is Visible    xpath=//*[@text="30年"]    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    2.2    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Wait Until Element Is Visible    xpath=//*[@text="試算結果"]    10
    Wait Until Element Is Visible    xpath=//*[@text="注意事項： 本試算結果僅供參考，實際貸款條件仍依法令規範及本行提供之產品為準；本行將依您實際信用狀況、個人資力及擔保品價值等資訊，綜合評量審查決定核准與否，並同時保留調整產品規格、申貸期限及其他相關規定之權利。"]    10
    Wait Until Element Is Visible    xpath=//*[@text="還在等什麼呢？"]    10
    Wait Until Element Is Visible And Element Text Should Be    ${homeCalculate_text_spanHousePrice}    1,975萬    10

檢查馬上預約諮詢按鈕導向是否正確
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Click Element After It Is Visible    xpath=//*[@text="台北市"]    10
    Wait Until Element Is Visible    xpath=//*[@text="台北市"]    10
    Click Element After It Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_district_afterChooseCity}    10
    Click Element After It Is Visible    xpath=//*[@text="文山區"]    10
    Input Text After It Is Visible    ${homeCalculate_input_everyMonthCanPay}    6    10
    Click Element After It Is Visible    xpath=//*[@text="30年"]    10
    Input Text After It Is Visible    ${homeCalculate_input_loanInterestRaten}    2.2    10
    Click Element After It Is Visible    ${homeCalculate_button_startCalculating}    10
    Click Element After It Is Visible    ${homeCalculate_button_bookAppointment}    10
    Wait Until Element Is Visible    xpath=//*[@text="預約房屋貸款諮詢"]    10
檢查其他試算標題文字是否正確
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Scroll Down Until Element Found    ${homeCalculate_text_otherCalculateTitle}

檢查每月還款金額試算區塊顯示是否正確
    [Tags]    P3
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Scroll Down Until Element Found    ${homeCalculate_text_otherCalculateTitle}
    Scroll Down Until Element Found    ${homeCalculate_text_everyMonthCanPayCalculateTitle}
    Scroll Down Until Element Found    ${homeCalculate_text_everyMonthCanPayCalculateSubtitle}
    Scroll Down Until Element Found    ${homeCalculate_button_everyMonthCanPayCalculate}

檢查每月還款金額試算按鈕導向是否正確
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Scroll Down Until Element Found    ${homeCalculate_text_otherCalculateTitle}
    Scroll Down Until Element Found    ${homeCalculate_text_everyMonthCanPayCalculateTitle}
    Scroll Down Until Element Found    ${homeCalculate_text_everyMonthCanPayCalculateSubtitle}
    Click Element After It Is Visible    ${homeCalculate_button_everyMonthCanPayCalculate}    10
    Wait Until Element Is Visible    xpath=//android.view.View[@text="寬限期"]    10

檢查貸款成數試算區塊顯示是否正確
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Scroll Down Until Element Found    ${homeCalculate_image_loanRatio}
    Scroll Down Until Element Found    ${homeCalculate_text_loanRatioSubtitle}
    Scroll Down Until Element Found    ${homeCalculate_text_loanRatioSubtitle}

檢查貸款成數試算按鈕導向是否正確
    [Tags]    P2
    Wait Until Element Is Visible    ${homeCalculate_text_houseLocatePlaceHolder_city}    10
    Scroll Down Until Element Found    ${homeCalculate_image_loanRatio}
    Scroll Down Until Element Found    ${homeCalculate_text_loanRatioTitle}
    Scroll Down Until Element Found    ${homeCalculate_text_loanRatioSubtitle}
    Click Element After It Is Visible    ${homeCalculate_button_loanRatio}    10
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="房貸試算-購屋可貸成數試算"]    10





    
   