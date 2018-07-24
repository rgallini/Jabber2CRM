@ECHO OFF
ECHO Jabber 2 CRM setup starting...
ECHO Checking to see if this is already done...
TYPE "%APPDATA%\Cisco\Unified Communications\Jabber\CSF\Config\jabberLocalConfig.xml" | FIND "jabber2crm" > nul
IF NOT errorlevel 1 GOTO AlreadySetup
ECHO Stopping Jabber if it is running...
TASKKILL /IM CiscoJabber.exe
ECHO Installing...
TYPE "%APPDATA%\Cisco\Unified Communications\Jabber\CSF\Config\jabberLocalConfig.xml" | FIND /V "/Jabber" > "%APPDATA%\Cisco\Unified Communications\Jabber\CSF\Config\jabberLocalConfig.crm"
ECHO  ^<userConfig name="UserDefinedCustomTabs" value="&lt;jabber-plugin-config&gt;&lt;browser-plugin&gt;&lt;page refresh=&quot;true&quot; preload=&quot;true&quot;&gt;&lt;tooltip&gt;CRM&lt;/tooltip&gt;&lt;url&gt;http://localhost/jabber2crm.html&lt;/url&gt;&lt;icon&gt;http://hcrm:5555/_imgs/NavBar/NavBarLogo.png&lt;/icon&gt;&lt;/page&gt;&lt;/browser-plugin&gt;&lt;/jabber-plugin-config&gt;"/^> >> "%APPDATA%\Cisco\Unified Communications\Jabber\CSF\Config\jabberLocalConfig.CRM"
ECHO ^</Jabber^> >> "%APPDATA%\Cisco\Unified Communications\Jabber\CSF\Config\jabberLocalConfig.CRM"
COPY /y "%APPDATA%\Cisco\Unified Communications\Jabber\CSF\Config\jabberLocalConfig.CRM" "%APPDATA%\Cisco\Unified Communications\Jabber\CSF\Config\jabberLocalConfig.xml"
ECHO Jabber2CRM Setup complete!
GOTO RestartJabber

:AlreadySetup
CLS
ECHO Jabber2CRM is already setup...
GOTO RestartJabber

:RestartJabber
ECHO Jabber will restart after you
PAUSE
Start /D "C:\Program Files (x86)\Cisco Systems\Cisco Jabber\" CiscoJabber.exe