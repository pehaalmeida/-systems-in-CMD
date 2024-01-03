@echo off
cls
set SiteMonitor=""
set versaoMonitor=1.0.3.1
mkdir Logs
mkdir Logs\LogsPing
mkdir Logs\LogsErro
echo START MONITOR RC - DATA: %date% Hora: %time:~0,2%:%time:~3,2%:%time:~6,2% - Versão: %versaoMonitor% >> Logs\LogsAberturaMonitorRC.txt 
:MENU
cls
color a
echo.
echo.
echo.
echo.
echo.
echo.
echo ::::    ::::   ::::::::  ::::    ::: ::::::::::: :::::::::::  ::::::::  :::::::::  
echo +:+:+: :+:+:+ :+:    :+: :+:+:   :+:     :+:         :+:     :+:    :+: :+:    :+: 
echo +:+ +:+:+ +:+ +:+    +:+ :+:+:+  +:+     +:+         +:+     +:+    +:+ +:+    +:+ 
echo +#+  +:+  +#+ +#+    +:+ +#+ +:+ +#+     +#+         +#+     +#+    +:+ +#++:++#:  
echo +#+       +#+ +#+    +#+ +#+  +#+#+#     +#+         +#+     +#+    +#+ +#+    +#+ 
echo #+#       #+# #+#    #+# #+#   #+#+#     #+#         #+#     #+#    #+# #+#    #+# 
echo ###       ###  ########  ###    #### ###########     ###      ########  ###    ### 
echo.
echo.
echo                      Desenvolvido por PEDRO AUGUSTO
echo                                V %versaoMonitor%
echo.
echo.
echo.
echo   Escolha uma opcao:
echo   1. Monitor Site1
echo   2. Monitor Site2
echo   3. creditos
echo.
echo.
set /p escolha="Digite o numero da opcao desejada: "

if "%escolha%"=="1" (
set SiteMonitor=Site1.com.br
set SiteNome=Site1
goto MONITOR
)

if "%escolha%"=="2" (
set SiteMonitor=Site2.com.br
set SiteNome=Site2
goto MONITOR
)
if "%escolha%"=="3" goto CRED

echo Opcao invalida. Por favor, digite um numero valido.
pause
goto Fim

REM Monitor 

:MONITOR
cls
color 0f
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo TESTANDO COMUNICACAO!
echo.
echo  Site Monitorado: %SiteNome%
echo  URL: %SiteMonitor%
echo.
echo  Caso queira cancelar, utilize "Ctrl + C"
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

:MONITOR-Loop
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a
set data=%datetime:~6,2%%datetime:~4,2%%datetime:~0,4%
echo ============================================= >> Logs\LogsPing\%data%_Logs_%SiteNome%.txt
echo REGISTRO DE LOG DATA E HORA: %date% %time:~0,2%:%time:~3,2%:%time:~6,2% >> Logs\LogsPing\%data%_Logs_%SiteNome%.txt
ping %SiteMonitor% -n 1 | find "TTL=" >> Logs\LogsPing\%data%_Logs_%SiteNome%.txt
if errorlevel 1 (
    echo PERDA DE COMUNICAÇÃO >> Logs\LogsPing\%data%_Logs_%SiteNome%.txt
    GOTO MONITORERRO
) else (
    GOTO :MONITOR-Loop
)
GOTO :MONITOR-Loop

:MONITORERRO
cls
color CF
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo  :::::::::: :::::::::  :::::::::   ::::::::  
echo  :+:        :+:    :+: :+:    :+: :+:    :+: 
echo  +:+        +:+    +:+ +:+    +:+ +:+    +:+ 
echo  +#++:++#   +#++:++#:  +#++:++#:  +#+    +:+ 
echo  +#+        +#+    +#+ +#+    +#+ +#+    +#+ 
echo  #+#        #+#    #+# #+#    #+# #+#    #+# 
echo  ########## ###    ### ###    ###  ########  
echo.
Echo  X - Ocorreu uma perda de comunicacao - X
echo.
echo  Site Monitorado: %SiteNome%
echo  URL Monitorada: %SiteMonitor%
echo  Momento do Erro: %date% %time:~0,2%:%time:~3,2%:%time:~6,2%
echo.
echo  Foi Feito Registro Nos Logs
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo REGISTRO DE ERRO: SITE: %SiteNome% - URL: Monitorada %SiteMonitor% - DATA E HORA DO ERRO: %date% %time:~0,2%:%time:~3,2%:%time:~6,2% >> Logs\LogsErro\%data%_LogsErro_%SiteNome%.txt
timeout 60 && GOTO :MONITOR
GOTO :MONITOR

REM Creditos 

:CRED
cls
color 0f
echo.
echo.
echo.
echo.
echo.
echo.
echo  ::::::::  :::::::::  :::::::::: :::::::::  ::::::::::: :::::::::::  ::::::::   ::::::::  
echo :+:    :+: :+:    :+: :+:        :+:    :+:     :+:         :+:     :+:    :+: :+:    :+: 
echo +:+        +:+    +:+ +:+        +:+    +:+     +:+         +:+     +:+    +:+ +:+        
echo +#+        +#++:++#:  +#++:++#   +#+    +:+     +#+         +#+     +#+    +:+ +#++:++#++ 
echo +#+        +#+    +#+ +#+        +#+    +#+     +#+         +#+     +#+    +#+        +#+ 
echo #+#    #+# #+#    #+# #+#        #+#    #+#     #+#         #+#     #+#    #+# #+#    #+# 
echo  ########  ###    ### ########## #########  ###########     ###      ########   ########  
echo.
echo.
echo.
echo                          Desenvolvido por PEDRO AUGUSTO
echo       Este MONITOR foi criado com o intuito de monitorar os sites que a equipe
echo                 de Suporte utiliza diariamente, em casos de oscilacao.
echo.
echo      Qualquer Duvida ou Sugestao de melhora entrar em contato com Pedro.Augusto
echo.
echo.
pause
goto MENU