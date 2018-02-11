codeunit 50100 CalculationMngt
{
    trigger OnRun()
    begin
        
    end;
    
    procedure CalculateSum(FirstValue : Decimal;SecondValue : Decimal) : Decimal
    begin
        exit(FirstValue + SecondValue);        
    end;

    procedure CalculateSum(FirstValue : Decimal; SecondValue : Decimal; ThirdValue : Decimal) : Decimal
    var
    begin
        exit(FirstValue + SecondValue + ThirdValue);                
    end;

    }