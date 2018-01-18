codeunit 50101 GetCustomers 
{
    trigger OnRun();
    begin
        DoSomething;
    end;
    local procedure DoSomething();
    var 
        Customer : Record Customer;
        msgNothingFound : TextConst ENU='Nothing Found';
    begin
        Customer.FindFirst;
        Message('%1',Customer); 

        Customer.SetRange(City,'Londonx');
        if Customer.FindFirst then
            Message('%1',Customer) 
        else
            message(msgNothingFound);
    end;   
}