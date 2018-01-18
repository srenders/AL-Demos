codeunit 50100 MyFirstCodeunit
{
    trigger OnRun();
    begin
    end;

    procedure MyFunction();
    var
        myInt : Integer;
    begin
        message('Hello Steven!');        
    end;

    procedure LoopNoExercise();
    var
        LoopNo : Integer;
    begin
        Message('The value of %1 is %2','LoopNo',LoopNo);
    end;
    procedure ShowResults();
    var
        Color : Option Green,Red,Blue;
        LoopNo : Integer;
        MyDate : Date;
        MyText : Text;
        LoopNoDec : Decimal;
    begin
        
        LoopNo := 1;
        message('The value of %1 is %2.','LoopNo',LoopNo);
        MyDate := Today;
        MyDate := 20170101D;
        message('The value of %1 is %2.','MyDate',MyDate);
        Color := 1;
        //Color := Color::Red;
        message('The value of %1 is %2.','Color',Color);
    end;
    
    var
        myInt : Integer;
}