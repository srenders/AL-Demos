table 50126 "Egg. Production Header"
{
  // version EXT001


  fields
  {
    field(1;"No.";Code[20])
    {

      trigger OnValidate();
      begin
        IF "No." <> xRec."No." THEN BEGIN
          ChickenSetup.GET;
          NoSeriesManagement.TestManual(ChickenSetup."Egg. Production Nos.");
          "No. Series" := '';
        END;
      end;
    }
    field(2;"Document Date";Date)
    {
    }
    field(3;"No. Series";Code[20])
    {
    }
    field(10;"Posting Date";Date)
    {
      CaptionML=ENU='Posting Date';
    }
    field(11;"Posting No. Series";Code[10])
    {
      CaptionML=ENU='Posting No. Series';
      TableRelation="No. Series".Code;

      trigger OnLookup();
      begin
         WITH EggProductionHeader DO BEGIN
          EggProductionHeader := Rec;
          ChickenSetup.GET;
          ChickenSetup.TESTFIELD("Egg. Production Nos.");
          ChickenSetup.TESTFIELD("Posted Egg. Production Nos.");
          IF NoSeriesManagement.LookupSeries(ChickenSetup."Posted Egg. Production Nos.","Posting No. Series")
          THEN BEGIN
            VALIDATE("Posting No. Series");
          END;
          Rec := EggProductionHeader;
         END;
      end;

      trigger OnValidate();
      begin
         IF "Posting No. Series" <> '' THEN BEGIN
          ChickenSetup.GET;
          ChickenSetup.TESTFIELD("Egg. Production Nos.");
          ChickenSetup.TESTFIELD("Posted Egg. Production Nos.");
          NoSeriesManagement.TestSeries(ChickenSetup."Posted Egg. Production Nos.","Posting No. Series");
         END;
         TESTFIELD("Posting No.",'');
      end;
    }
    field(12;"Posting No.";Code[20])
    {
      CaptionML=ENU='Posting No.';
    }
    field(13;"No. Printed";Integer)
    {
      CaptionML=ENU='No. Printed';
      Editable=false;
    }
    field(51;"Shortcut Dimension 1 Code";Code[20])
    {
      CaptionClass='1,2,1';
      CaptionML=ENU='Shortcut Dimension 1 Code';
      TableRelation="Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));

      trigger OnValidate();
      begin
        //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
      end;
    }
    field(52;"Shortcut Dimension 2 Code";Code[20])
    {
      CaptionClass='1,2,2';
      CaptionML=ENU='Shortcut Dimension 2 Code';
      TableRelation="Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));

      trigger OnValidate();
      begin
        //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
      end;
    }
    field(480;"Dimension Set ID";Integer)
    {
      CaptionML=ENU='Dimension Set ID';
      Editable=false;
      TableRelation="Dimension Set Entry";

      trigger OnLookup();
      begin
        //ShowDocDim;
      end;
    }
  }

  keys
  {
    key(Key1;"No.")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }

  trigger OnInsert();
  begin
    IF "No." = '' THEN BEGIN
      ChickenSetup.GET;
      ChickenSetup.TESTFIELD("Egg. Production Nos.");
      NoSeriesManagement.InitSeries(ChickenSetup."Egg. Production Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    InitRecord;
  end;

  var
    NoSeriesManagement : Codeunit NoSeriesManagement;
    ChickenSetup : Record "Chicken Setup";
    EggProductionHeader : Record "Egg. Production Header";
    EggProductionLine : Record "Egg. Production Line";

  PROCEDURE AssistEdit(OldEggProductionHeader : Record "Egg. Production Header") : Boolean;
  var
    EggProductionHeader : Record "Egg. Production Header";
  begin
    WITH EggProductionHeader DO BEGIN
      EggProductionHeader := Rec;
      ChickenSetup.GET;
      ChickenSetup.TESTFIELD("Egg. Production Nos.");
      IF NoSeriesManagement.SelectSeries(ChickenSetup."Egg. Production Nos.",OldEggProductionHeader."No. Series","No. Series") THEN BEGIN
        NoSeriesManagement.SetSeries("No.");
        Rec := EggProductionHeader;
        EXIT(TRUE);
      END;
    END;
  end;

  PROCEDURE InitRecord();
  begin
    IF "Posting Date" = 0D THEN
      "Posting Date" := WORKDATE;
    "Document Date" := WORKDATE;
    ChickenSetup.GET;
    NoSeriesManagement.SetDefaultSeries("Posting No. Series",ChickenSetup."Posted Egg. Production Nos.");
  end;

  LOCAL PROCEDURE EggProdLinesExist() : Boolean;
  begin
    EggProductionLine.RESET;
    EggProductionLine.SETRANGE("Document No.","No.");
    EXIT(EggProductionLine.FINDFIRST);
  end;

}

