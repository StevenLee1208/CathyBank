# Run test cases with Robot Framework

## Emulator Devices
| Device | Version |
|--------|---------|
| Simulator_Pixel_4 | 10 |
| Simulator_Pixel_5 | 11 |
| Simulator_Pixel_6 | 12 |

## Software Versions
| Software | Version |
|----------|---------|
| Appium | 2.0 |
| Robot Framework | 7.0 |
| Python | 3.11.8 |

### Appium 2.0 Setup
若要使用 Appium 2.0 版本，請參考以下指令：

1. 安裝 Appium：
    ```bash
    npm install -g appium@next
    ```

2. 安裝必要功能：
    ```bash
    appium plugin install execute-driver
    appium driver install xcuitest # for iOS
    appium driver install uiautomator2 # for Android
    ```

3. 啟動 Appium ：
    ```bash
    appium -p {port_you_want} --use-plugins execute-driver
    ```

### Directory Structure
```
├─tests
│   └─Android
│          AndroidBaseUICore.py  (裝置基本設定)
│          AndroidRunRobot.py  (所有腳本執行測試)
│          Testrail.py  (處裡Testrail相關功能)
│          ReportMethods.py  (測試結果發送功能)
│          url.txt (chat頻道url)
│          ├─Keyword (一連串動作封裝成function)
│          │   ├─  AndroidDeviceInfo.txt (定義裝置相關function)
│          │   ├─  ApiMethod.txt (定義api功能)
│          │   ├─  .
│          │   └─  .
│          ├─TestCase (robot TC)
│          │   ├─  A101-1.robot
│          │   ├─  .
│          │   ├─  .
│          │   └─  A201-1.robot
│          ├─Variable (xpath/變數定義)
│          │   ├─  CartPageVariable.txt
│          │   ├─  .
│          │   ├─  .
│          │   └─  CommonPageVariable.txt
│          └─log (存放當次執行robot產生的檔案)
│              ├─  20230523-173219 (當前執行的系統時間)
│              │     ├─  <Devices_name>_<Robot_name>(再依照裝置與頁面做區分)
│              │     │     ├─ log.html 
│              │     │     ├─ output.xml
│              │     │     ├─ report.html
│              │     │     ├─ logcat.txt (裝置所發送出去的api紀錄)
│   └─Ios
├─ README.md
└─ requirements.txt
```

### Testing Tools
- Language: Robot Framework, Python
- Tool: Appium, Android Studio, adb, Xcode, Simulator

### Steps
1. 使用 pip 安裝所需套件：
    ```bash
    pip install -r requirements.txt
    ```
   
2. Open the appium port you want (two ways)：
   - [1] 使用 Appium 2.0：
     ```bash
     appium -pa /wd/hub -p {port} --use-plugins execute-driver
     ```

3. Run robot on terminal each of the following options：
   - For one robot file：
     ```bash
     robot --variable devicename:<Device_Name> --variable port:<Port> --variable logcat: .\tests\Android\log\<Device_Name> -d .\tests\Android\log\<Device_Name> <robotfilepath>
     ```
   - For all robot file ：
     ```bash
     python3 .\tests\Android\AndroidRunRobot.py <Device_Name> <Port> .\tests\Android\log\<Device_Name>
     ```
   - For all robot file with tag：
     ```bash
     python3 .\tests\Android\AndroidRunRobot.py <Device_Name> <Port> .\tests\Android\log\<Device_Name> -i <Tag>
     ```
   - For all robot file by Specific robots：
     ```bash
     python3 .\tests\Android\AndroidRunRobot.py <Device_Name> <Port> .\tests\Android\log\<Device_Name> -r <Your_File>
     ```

4. If you want to run some specific test suites / test cases, you can add tag in your robot file. Then you can use --include(-i) or --exclude(-e) add tag name as your terminal argument. Like this
    ```bash
    robot -i regression <robotfilename>.robot