codeunit 50130 DialogMngt
{
    trigger OnRun();
    begin
        Window.OPEN('#1###########################\\ ' + '@2@@@@@@@@@@@@@@@@');
        FOR intI := 1 TO 10000 DO
        BEGIN
            Window.UPDATE(1,intI);
            Window.UPDATE(2,intI);
            SLEEP(10);
        END;
    end;
    
    var
        window : Dialog;
        intI : Integer;
}