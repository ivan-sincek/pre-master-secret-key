:: Copyright (c) 2020 Ivan Šincek

@echo off
setlocal EnableDelayEdexpansion
	set "log=%USERPROFILE%\Desktop\ssl-keys.log"
	for /f "tokens=3" %%i in ('reg query "HKCU\Environment" /v "SSLKEYLOGFILE" 2^>nul') do (
		set env=%%i
	)
	if defined env (
		for /f "tokens=1 delims=:" %%i in ('setx "SSLKEYLOGFILE" ""') do (
			set success=%%i
		)
		if "!success!" NEQ "SUCCESS" (
			echo Cannot remove %%SSLKEYLOGFILE%% env. variable
		) else (
			echo Env. variable %%SSLKEYLOGFILE%% has been removed successfully
			echo:
			if not exist "%log%" (
				echo "%log%" does not exists, will skip removing the file...
			) else (
				del /f /q "%log%" 1>nul 2>nul
				if exist "%log%" (
					echo Cannot remove "%log%", try to remove it manually...
				) else (
					echo "%log%" has been removed successfully
				)
			)
		)
	) else (
		for /f "tokens=1 delims=:" %%i in ('setx "SSLKEYLOGFILE" "%log%"') do (
			set success=%%i
		)
		if "!success!" NEQ "SUCCESS" (
			echo Cannot create %%SSLKEYLOGFILE%% env. variable
		) else (
			echo Env. variable %%SSLKEYLOGFILE%% has been created successfully
			echo:
			if exist "%log%" (
				echo "%log%" already exists, will skip creating the file...
			) else (
				type nul > "%log%"
				if not exist "%log%" (
					echo Cannot create "%log%", try to create it manually...
				) else (
					echo "%log%" has been created successfully
				)
			)
		)
	)
endlocal
echo:
pause
