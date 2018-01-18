codeunit 50133 "Name Meth"
{
    trigger OnRun();
    begin
    end;

    procedure MethodName();
    var
        Handled : Boolean;
    begin
        OnBeforeMethodName(Handled);

        DoMethodName(Handled);

        OnAfterMethodName;
    end;

    local procedure DoMethodName(var Handled: Boolean);
    begin
        IF Handled THEN
            EXIT;

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeMethodName(var Handled : Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterMethodName();
    begin
    end;
}