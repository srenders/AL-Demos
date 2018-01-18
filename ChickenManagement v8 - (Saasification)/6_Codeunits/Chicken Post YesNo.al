codeunit 50121 "Chicken Post (Yes/No)"
{
  // version EXT001

  TableNo="Egg. Production Header";

  trigger OnRun();
  begin
    EggProductionHeader.COPY(Rec);
    Code;
    Rec := EggProductionHeader;
  end;

  var
    EggProductionHeader : Record "Egg. Production Header";
    Text001 : TextConst ENU='Do you want to post the Egg. Production?';
    ChickenPost : Codeunit "Chicken-Post";

  LOCAL PROCEDURE "Code"();
  begin
    IF NOT CONFIRM(Text001,FALSE) THEN
      EXIT;
    ChickenPost.RUN(EggProductionHeader);
    COMMIT;
  end;
}

