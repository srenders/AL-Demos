codeunit 50120 "Chicken Management"
{
  trigger OnRun();
  begin
  end;

  PROCEDURE AddChickenAsResource(Chicken : Record Chicken);
  var
    Resource : Record Resource;
    ErrorAlreadyExists : TextConst ENU='Resource %1 already exists!';
    MsgResourceAdded : TextConst ENU='Chicken %1 has been added as Resource: %2.';
  begin
    WITH Chicken DO BEGIN
      IF NOT Resource.GET(Chicken."No.") THEN BEGIN
        Resource."No."                := Chicken."No.";
        Resource.Name                 := Chicken.Description;
        Resource."Resource Group No." := Chicken."chicken Type Code";
        Resource.INSERT;
        MESSAGE(MsgResourceAdded,Chicken."No.",Resource."No.");
      END
      ELSE
        ERROR(ErrorAlreadyExists,Chicken."No.");
    END;
  end;
}