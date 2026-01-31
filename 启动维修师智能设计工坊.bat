@echo off
chcp 936 >nul
setlocal
echo ============================================
echo 🚀 Alicia 正在为你启动：维修师智能设计工坊 
echo ============================================

:: 1. 尝试从 config.ini 读取 python_path
set "CONFIG_FILE=config.ini"
set "PYTHON_EXE="

if exist "%CONFIG_FILE%" (
    for /f "usebackq tokens=1* delims==" %%A in ("%CONFIG_FILE%") do (
        if /i "%%A"=="python_path" set "PYTHON_EXE=%%B"
    )
)

:: 2. 如果未读取到（例如文件不存在或 key 不匹配），这里的逻辑可以决定是报错还是用默认值
:: 为了方便，如果 config.ini 有问题，我们给一个提示，但不阻断（或者也可以阻断）
if "%PYTHON_EXE%"=="" (
    echo [警告] 未能从 config.ini 获取 python_path。
    echo 请确保 config.ini 存在且包含 python_path=... 的设置。
    echo.
    echo 正在尝试使用默认路径...
    set PYTHON_EXE=D:\PythonEnvs\aienv_app\python.exe
)

echo [信息] 当前 Python 解释器路径: %PYTHON_EXE%

:: 检查环境是否存在 (如果是全局命令 python 则跳过文件检查)
if /i not "%PYTHON_EXE%"=="python" (
    if not exist "%PYTHON_EXE%" (
        echo [错误] 找不到 Python 文件: %PYTHON_EXE%
        echo 请修改 config.ini 中的路径配置。
        pause
        exit /b
    )
)

:: 运行主程序
"%PYTHON_EXE%" "excel_cleaner_tool.py"

if %errorlevel% neq 0 (
    echo [提示] 程序已关闭或发生异常。
    pause
)