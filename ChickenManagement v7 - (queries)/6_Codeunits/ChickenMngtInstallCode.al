codeunit 50105 ChickenMngtInstallCode
{
    // Set the codeunit to be an install codeunit. 
    Subtype = Install;

    // This trigger includes code for company-related operations. 
    trigger OnInstallAppPerCompany();
    var
        Chicken : Record Chicken;
        ChickenType : record "Chicken Type";
    begin
        // If the "Chicken Type" table is empty, insert the default Chicken Types.
        if ChickenType.IsEmpty() then begin
            InsertDefaultChickenTypes();
        end;
        // If the "Chicken" table is empty, insert the default Chickens.
        if Chicken.IsEmpty() then begin
            InsertDefaultChickens();
        end;
    end;

    
    procedure InsertDefaultChickens();
    begin
        InsertChicken('Chicken001', 'Chicken 001', 'Normal');
        InsertChicken('Chicken002', 'Chicken 002', 'Blue');
        InsertChicken('Chicken003', 'Chicken 003', 'Belgian');
    end;

    
    procedure InsertChicken(No : Code[30]; Description : Text[250]; ChickenType : Text[250]);
    var
        Chicken : Record Chicken;
    begin
        Chicken.Init();
        Chicken."No." := No;
        Chicken.Description := Description;
        Chicken."Chicken Type Code" := ChickenType;
        Chicken.Insert();
    end;
    procedure InsertDefaultChickenTypes();
    begin
        InsertChickenType('Normal', 'Normal');
        InsertChickenType('Blue', 'Blue');
        InsertChickenType('Belgian', 'Belgian');
    end;

    procedure InsertChickenType(Code : Code[30]; Description : Text[250]);
    var
        ChickenType : Record "Chicken Type";
    begin
        ChickenType.Init();
        ChickenType.Code := Code;
        chickentype.description := Description;
        chickentype.Insert();
    end;
}