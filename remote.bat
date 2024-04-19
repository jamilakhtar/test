for /f "skip=1 tokens=3" %%s in ('query user %USERNAME%') do ( 
  %windir%\System32\tscon.exe %%s /dest:console >nul 2>nul
)
exit /b 0