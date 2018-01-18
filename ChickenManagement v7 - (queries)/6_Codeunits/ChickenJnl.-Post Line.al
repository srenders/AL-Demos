codeunit 50124 "ChickenJnl.-Post Line"
{
  // version EXT001

  TableNo="Chicken Journal Line";

  trigger OnRun();
  begin
    RunWithCheck(Rec);
  end;

  var
    ChickenJournalLine : Record "Chicken Journal Line";
    ChickenLedgerEntry : Record "Chicken Ledger Entry";
    ChickenRegister : Record "Chicken Register";
    ChickenJnlCheckLine : Codeunit "ChickenJnl.-Check Line";
    NextEntryNo : Integer;

  PROCEDURE RunWithCheck(VAR ChickenJournalLine2 : Record "Chicken Journal Line");
  begin
    ChickenJournalLine.COPY(ChickenJournalLine2);
    Code;
    ChickenJournalLine2 := ChickenJournalLine;
  end;

  PROCEDURE "Code"();
  begin
    WITH ChickenJournalLine DO BEGIN
      IF EmptyLine THEN
        EXIT;

      ChickenJnlCheckLine.RunCheck(ChickenJournalLine);

      IF NextEntryNo = 0 THEN BEGIN
        ChickenLedgerEntry.LOCKTABLE;
        IF ChickenLedgerEntry.FINDLAST THEN
          NextEntryNo := ChickenLedgerEntry."Entry No.";
        NextEntryNo := NextEntryNo + 1;
      END;

      IF "Document Date" = 0D THEN
        "Document Date" := "Posting Date";

      IF ChickenRegister."No." = 0 THEN BEGIN
        ChickenRegister.LOCKTABLE;
        IF (NOT ChickenRegister.FINDLAST) OR (ChickenRegister."To Entry No." <> 0) THEN BEGIN
          ChickenRegister.INIT;
          ChickenRegister."No." := ChickenRegister."No." + 1;
          ChickenRegister."From Entry No." := NextEntryNo;
          ChickenRegister."To Entry No." := NextEntryNo;
          ChickenRegister."Creation Date" := TODAY;
          ChickenRegister."Source Code" := "Source Code";
          ChickenRegister."Journal Batch Name" := "Journal Batch Name";
          ChickenRegister."User ID" := USERID;
          ChickenRegister.INSERT;
        END;
      END;
      ChickenRegister."To Entry No." := NextEntryNo;
      ChickenRegister.MODIFY;

      ChickenLedgerEntry.INIT;
      ChickenLedgerEntry."Chicken No." := "Chicken No.";
      ChickenLedgerEntry."Posting Date" := "Posting Date";
      ChickenLedgerEntry."Document Date" := "Document Date";
      ChickenLedgerEntry."Entry Type" := "Entry Type";
      ChickenLedgerEntry."Document No." := "Document No.";
      ChickenLedgerEntry.Description := Description;
      ChickenLedgerEntry.Quantity := Quantity;
      ChickenLedgerEntry."Starting Date" := "Starting Date";
      ChickenLedgerEntry."Egg Production No." := "Egg Production No.";
      ChickenLedgerEntry."Source Type" := "Source Type";
      ChickenLedgerEntry."Source No." := "Source No.";
      ChickenLedgerEntry."Journal Batch Name" := "Journal Batch Name";
      ChickenLedgerEntry."Source Code" := "Source Code";
      ChickenLedgerEntry."Reason Code" := "Reason Code";
      ChickenLedgerEntry."No. Series" := "Posting No. Series";
      ChickenLedgerEntry."User ID" := USERID;
      ChickenLedgerEntry."Entry No." := NextEntryNo;
      ChickenLedgerEntry."Global Dimension 1 Code" := "Shortcut Dimension 1 Code";
      ChickenLedgerEntry."Global Dimension 2 Code" := "Shortcut Dimension 2 Code";
      ChickenLedgerEntry."Dimension Set ID" := "Dimension Set ID";
      ChickenLedgerEntry.INSERT;
      NextEntryNo := NextEntryNo + 1;

    END;
  end;
}

