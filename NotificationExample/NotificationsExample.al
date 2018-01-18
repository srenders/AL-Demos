codeunit 50126 MyExampleCodeunit
{
    trigger OnRun();
    begin
    end;

    [EventSubscriber(ObjectType::Table, 18, 'OnAfterValidateEvent', 'Address', false, false)]
    procedure OnCustomerAddressValidate(var Rec : Record customer;var xRec : Record customer;currFieldNo : Integer);
    begin
        //MESSAGE('OnCustomerTableAddressValidate');
        if CheckForPlusSign(Rec.Address) then
            CreateCustomerAddressLookupnotification(Rec.Address,Rec);
    end;

    [EventSubscriber(ObjectType::Page, 21, 'OnAfterValidateEvent', 'Address', false, false)]
    procedure OnCustomerPageAddressValidate(var Rec : Record customer;var xRec : Record customer);
    begin
        //MESSAGE('OnCustomerPageAddressValidate');
        if CheckForPlusSign(Rec.Address) then
            CreateCustomerAddressLookupnotification(Rec.Address,Rec);
    end;

    procedure CheckForPlusSign(var TextToVerify : Text) : Boolean;
    begin
        IF (STRPOS(TextToVerify, '+') > 0) THEN BEGIN
            exit(true);
        END;
    end;

    procedure CreateCustomerAddressLookupnotification(NotificationText : Text; Customer : record Customer);
    var
      addressNotification : Notification;
      CanNotUseThisSignMsg : TextConst ENU='Cannot use a plus sign (+) in the address [%1]';      
    begin
      addressNotification.Message := StrSubstNo(CanNotUseThisSignMsg,Customer.address);
      addressNotification.SetData('Customer',Format(Customer."No." + '-' + Customer.Name));
      addressNotification.SetData('Address',Format(Customer.Address));
      addressNotification.Send;
    end;

}