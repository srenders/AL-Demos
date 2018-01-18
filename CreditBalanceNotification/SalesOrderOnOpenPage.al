codeunit 50120 MySalesOrderOnOpenPage
{
    trigger OnRun();
    begin
    end;
    
    [EventSubscriber(ObjectType::Page, page::"Sales Order", 'OnOpenPageEvent','' , true, true)]
    local procedure CreateNotificationForCredit(VAR Rec : Record "Sales Header");
    var
        Customer : Record Customer;
        CreditBalanceNotification : Notification;
        OpenCustomer : Text;
        Text003 : TextConst ENU='The customer''s current balance exceeds their credit limit.';
        Text004 : TextConst ENU='Change credit limit';
    begin
    Customer.GET(rec."Sell-to Customer No.");
    Customer.CalcFields("Balance (LCY)");
    IF Customer."Balance (LCY)" > Customer."Credit Limit (LCY)" THEN
        begin
        //Create the notification
        CreditBalanceNotification.MESSAGE(Text003);
        CreditBalanceNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
        //Add a data property for the customer number
        CreditBalanceNotification.SETDATA('CustNumber', Customer."No.");
        //Add an action that calls the Action Handler codeunit, which you define in the next step.
        CreditBalanceNotification.ADDACTION(Text004, CODEUNIT::"MySalesOrderOnOpenPage", 'OpenCustomer');
        //Send the notification to the client.
        CreditBalanceNotification.SEND;
        end;        
    end;
    
    procedure OpenCustomer (var CreditBalanceNotification : Notification);
    var
        CustNo : Text;
        CustRec : Record Customer;
        CustPage : Page "Customer Card";
    begin
        //Get the customer number data from the SETDATA call.
        CustNo := CreditBalanceNotification.GETDATA('CustNumber');
        // Open the Customer Card page for the customer.
        if CustRec.GET(CustNo) then begin
            CustPage.SETRECORD(CustRec);
            CustPage.RUN;
        end else begin
            ERROR('Could not find Customer: ' + CustNo);
        end;   
    end;

}