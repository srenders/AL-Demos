codeunit 50103 MyDataTypeExamplesCodeunit
{
    trigger OnRun();
    begin
    end;
    procedure ShowResults();
    var
        Color : Option Green,Red,Blue;
        LoopNo : Integer;
        MyDate : Date;
        MyText : Text;
        LoopNoDec : Decimal;
        MyArray : Array[4] of Integer;
    begin
        
        LoopNo := 1;
        message('The value of %1 is %2.','LoopNo',LoopNo);
        MyDate := Today;
        MyDate := 20170101D;
        message('The value of %1 is %2.','MyDate',MyDate);
        Color := 1;
        //Color := Color::Red;
        message('The value of %1 is %2.','Color',Color);
        for LoopNo := 1 to 4 do
        begin
            MyArray[LoopNo] := LoopNo;
            message('The value of %1 is %2.','Color',MyArray[LoopNo]);
        end;
    end;
}