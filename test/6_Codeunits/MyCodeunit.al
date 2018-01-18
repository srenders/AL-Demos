codeunit 50125 MyCodeunit
{
    trigger OnRun();
    begin
        
    end;

    
    [EventSubscriber(ObjectType::Page, 21, 'OnAfterValidateEvent', 'Name', false, false)]
    local procedure MyProcedure(var Rec : Record customer;var xRec : Record customer);
    //var;
    begin
        Message('Hello %1!', rec.Name);
    end;

    [EventSubscriber(ObjectType::Page, 21, 'OnOpenPageEvent', '', false, false)]
    procedure MyProcedure2(var Rec : Record customer);
    //var;
    begin
        Message('Hello %1!', rec.Name);
    end;


}