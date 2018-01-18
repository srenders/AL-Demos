codeunit 50126 MyExampleCodeunit
{
    trigger OnRun();
    begin
    end;

    [EventSubscriber(ObjectType::Table, 18, 'OnAfterValidateEvent', 'Address', false, false)]
    procedure OnCustomerAddressValidate(var Rec : Record customer;var xRec : Record customer;currFieldNo : Integer);
    //var
        //VariableName : VariableType;
    begin
        MESSAGE('OnCustomerTableAddressValidate');
        CheckForPlusSign(Rec.Address);
    end;

    [EventSubscriber(ObjectType::Page, 21, 'OnAfterValidateEvent', 'Address', false, false)]
    procedure OnCustomerPageAddressValidate(var Rec : Record customer;var xRec : Record customer);
    //var
    //    VariableName : VariableType;
    begin
        MESSAGE('OnCustomerPageAddressValidate');
        CheckForPlusSign(Rec.Address);
    end;

    procedure CheckForPlusSign(var TextToVerify : Text);
    //var
    //    VariableName : VariableType;
    begin
        IF (STRPOS(TextToVerify, '+') > 0) THEN BEGIN
            MESSAGE('Cannot use a plus sign (+) in the address [' + TextToVerify + ']');
        END;
    end;

}