codeunit 50123 "ChickenJnl.-Check Line"
{
  // version EXT001

  TableNo="Chicken Journal Line";

  trigger OnRun();
  begin
    RunCheck(Rec);
  end;

  var
    Text000 : TextConst ENU='cannot be a closing date.';
    Text001 : TextConst ENU='is not within your range of allowed posting dates.';
    Text002 : TextConst ENU='The combination of dimensions used in %1 %2, %3, %4 is blocked. %5';
    Text003 : TextConst ENU='A dimension used in %1 %2, %3, %4 has caused an error. %5';
    GLSetup : Record "General Ledger Setup";
    UserSetup : Record "User Setup";
    DimMgt : Codeunit DimensionManagement;
    AllowPostingFrom : Date;
    AllowPostingTo : Date;

  PROCEDURE RunCheck(VAR ChickenJournalLine : Record "Chicken Journal Line");
  var
    TableID : ARRAY [10] OF Integer;
    No : ARRAY [10] OF Code[20];
  begin
    WITH ChickenJournalLine DO BEGIN
      IF EmptyLine THEN
        EXIT;

      TESTFIELD("Posting Date");
      TESTFIELD("Chicken No.");

      IF "Posting Date" = CLOSINGDATE("Posting Date") THEN
        FIELDERROR("Posting Date",Text000);

      IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
        IF USERID <> '' THEN
          IF UserSetup.GET(USERID) THEN BEGIN
            AllowPostingFrom := UserSetup."Allow Posting From";
            AllowPostingTo := UserSetup."Allow Posting To";
          END;
        IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
          GLSetup.GET;
          AllowPostingFrom := GLSetup."Allow Posting From";
          AllowPostingTo := GLSetup."Allow Posting To";
        END;
        IF AllowPostingTo = 0D THEN
          AllowPostingTo := 99991231D;
      END;
      IF ("Posting Date" < AllowPostingFrom) OR ("Posting Date" > AllowPostingTo) THEN
        FIELDERROR("Posting Date",Text001);

      IF ("Document Date" <> 0D) THEN
        IF ("Document Date" = CLOSINGDATE("Document Date")) THEN
          FIELDERROR("Document Date",Text000);

      IF NOT DimMgt.CheckDimIDComb("Dimension Set ID") THEN
        ERROR(
          Text002,
          TABLECAPTION,"Journal Template Name",
          "Journal Batch Name","Line No.",
          DimMgt.GetDimCombErr);
      TableID[1] := DATABASE::Chicken;
      No[1] := "Chicken No.";
      IF NOT DimMgt.CheckDimValuePosting(TableID,No,"Dimension Set ID") THEN
        IF "Line No." <> 0 THEN
          ERROR(
            Text003,
            TABLECAPTION,"Journal Template Name",
            "Journal Batch Name","Line No.",
            DimMgt.GetDimValuePostingErr)
        ELSE
          ERROR(DimMgt.GetDimValuePostingErr);
    END;
  end;
}

