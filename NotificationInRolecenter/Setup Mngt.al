codeunit 50122 "Setup Management"
{
    trigger OnRun();
    begin
    end;
    
    var
        myInt : Integer;

    procedure DoSomething(var MyNotification : Notification);
    var
        //myInt : Integer;
    begin
        message('Everything has been setup...');
    end;  
    procedure DoSomethingElse(var MyNotification : Notification);
    var
        //myInt : Integer;
    begin
        message('Everything has been setup, %1...',MyNotification.GetData('Extra Info'));
    end;   
}