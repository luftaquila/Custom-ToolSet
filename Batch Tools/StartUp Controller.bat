cd C:\ProgramData\Microsoft\Windows\Start Menu\Programs
del Dropbox /S /Q
SCHTASKS.EXE /RUN /TN "\UAC Whitelist\KeySet"