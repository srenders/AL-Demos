codeunit 50135 Armstrong
{
    trigger OnRun();
    begin
    
    end;

    procedure FindArmstrong();
        var intJ: Integer;
        intI: Integer;
        intPower: Integer;
        intNumber: Integer;
        intResult: Integer;    
        MagicNumbers: Text;
    begin    
        FOR intI := 1 TO 10000 DO
        begin
            //SLEEP(100);
            //Get the Power, last digit of my looping number::
            EVALUATE(intPower, COPYSTR(FORMAT(intI),STRLEN(FORMAT(intI)),1));
  
            //Loop over every digit of the number:
            FOR intJ := 1 TO STRLEN(FORMAT(intI)) DO
            begin
                //Get the individual digit:
                EVALUATE(intNumber,COPYSTR(FORMAT(intI),intJ,1));

                //Add it to the Result:
                intResult += POWER(intNumber,intPower);
            end;

            //Is the EndResult the same as the original number?
            IF intResult = intI THEN
                MagicNumbers += FORMAT(intResult) + '\';
            CLEAR(intResult);
        end;
        MESSAGE(MagicNumbers);
    end;
}