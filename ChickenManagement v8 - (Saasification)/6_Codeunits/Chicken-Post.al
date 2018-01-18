codeunit 50122 "Chicken-Post"
{
  // version EXT001

  TableNo="Egg. Production Header";

  trigger OnRun();
  begin
    CLEARALL;
    EggProductionHeader := Rec;
    WITH EggProductionHeader DO BEGIN
      TESTFIELD("Document Date");
      TESTFIELD("Posting Date");

      EggProductionLine.RESET;
      EggProductionLine.SETRANGE("Document No.", EggProductionHeader."No.");
      IF EggProductionLine.ISEMPTY THEN
        ERROR(Text001);

      Window.OPEN('#1#######################\\' + Text002);
      Window.UPDATE(1,STRSUBSTNO('%1 %2',Text003,"No."));

      IF EggProductionHeader."Posting No." = '' THEN BEGIN
        TESTFIELD("Posting No. Series");
        "Posting No." := NoSeriesManagement.GetNextNo("Posting No. Series","Posting Date",TRUE);
        MODIFY;
        COMMIT;
      END;
      EggProductionLine.LOCKTABLE;

      SourceCodeSetup.GET;
      SourceCode := SourceCodeSetup.Chicken;

      PostedEggProductionHeader.INIT;
      PostedEggProductionHeader.TRANSFERFIELDS(EggProductionHeader);
      PostedEggProductionHeader."No." := "Posting No.";
      PostedEggProductionHeader."No. Series" := "Posting No. Series";
      PostedEggProductionHeader."Source Code" := SourceCode;
      PostedEggProductionHeader."User ID" := USERID;
      PostedEggProductionHeader.INSERT;

      Window.UPDATE(1,STRSUBSTNO(Text004,"No.",PostedEggProductionHeader."No."));

      LineCount := 0;
      EggProductionLine.RESET;
      EggProductionLine.SETRANGE("Document No.","No.");
      IF EggProductionLine.FINDSET THEN
      REPEAT
        LineCount += 1;
        Window.UPDATE(2,LineCount);
        EggProductionLine.TESTFIELD("Chicken No.");

        PostChickenJournalLine(EggProductionLine);

        PostedEggProductionLine.INIT;
        PostedEggProductionLine.TRANSFERFIELDS(EggProductionLine);
        PostedEggProductionLine."Document No." := PostedEggProductionHeader."No.";
        PostedEggProductionLine.INSERT;

      UNTIL EggProductionLine.NEXT = 0;

      DELETE;
      EggProductionLine.DELETEALL;
    END;
    Rec := EggProductionHeader;
  end;

  var
    EggProductionHeader : Record "Egg. Production Header";
    EggProductionLine : Record "Egg. Production Line";
    PostedEggProductionHeader : Record "Posted Egg. Production Header";
    PostedEggProductionLine : Record "Posted Egg. Production Line";
    ChickenJournalLine : Record "Chicken Journal Line";
    SourceCodeSetup : Record "Source Code Setup";
    NoSeriesManagement : Codeunit NoSeriesManagement;
    Window : Dialog;
    SourceCode : Code[10];
    LineCount : Integer;
    Chicken : Record Chicken;
    Text001 : TextConst ENU='There is nothing to post.';
    Text002 : TextConst ENU='Posting lines              #2######\';
    Text003 : TextConst ENU='Egg Production';
    Text004 : TextConst ENU='Egg. Production %1  -> Posted Egg. Production %2';

  LOCAL PROCEDURE PostChickenJournalLine(EggProductionLine : Record "Egg. Production Line");
  var
    ChickenJournalLine : Record "Chicken Journal Line";
    ChickenJnlPostLine : Codeunit "ChickenJnl.-Post Line";
  begin
    ChickenJournalLine.INIT;
    ChickenJournalLine."Chicken No."               := EggProductionLine."Chicken No.";
    ChickenJournalLine."Document Date"             := EggProductionHeader."Document Date";
    ChickenJournalLine."Posting Date"              := EggProductionHeader."Posting Date";
    ChickenJournalLine."Entry Type"                := ChickenJournalLine."Entry Type"::EggProduction;
    ChickenJournalLine."Document No."              := PostedEggProductionHeader."No.";
    ChickenJournalLine.Description                 := '';
    ChickenJournalLine.Type                        := ChickenJournalLine.Type::Chicken;
    ChickenJournalLine.Quantity                    := PostedEggProductionLine.Quantity;
    ChickenJournalLine."Starting Date"             := EggProductionLine."Egg Date";
    ChickenJournalLine."Egg Production No."        := EggProductionLine."Document No.";
    ChickenJournalLine."Source Type"               := ChickenJournalLine."Source Type"::Chicken;
    ChickenJournalLine."Source No."                := EggProductionLine."Chicken No.";
    ChickenJournalLine."Source Code"               := SourceCode;
    ChickenJournalLine."Reason Code"               := '';
    ChickenJournalLine."Posting No. Series"        := EggProductionHeader."Posting No. Series";
    ChickenJournalLine."Shortcut Dimension 1 Code" := EggProductionHeader."Shortcut Dimension 1 Code";
    ChickenJournalLine."Shortcut Dimension 2 Code" := EggProductionHeader."Shortcut Dimension 2 Code";
    ChickenJournalLine."Dimension Set ID"          := EggProductionHeader."Dimension Set ID";

    ChickenJnlPostLine.RUN(ChickenJournalLine);
  end;
}

