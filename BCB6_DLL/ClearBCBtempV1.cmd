@rem ��X�ثe�ؿ��Τl�ؿ��U���ɡA����R��
forfiles /s /m *.~* /c "cmd /c del @file"
forfiles /s /m *.obj /c "cmd /c del @file"
forfiles /s /m *.ddp /c "cmd /c del @file"
forfiles /s /m *.tds /c "cmd /c del @file"
forfiles /s /m *.bak /c "cmd /c del @file"
pause