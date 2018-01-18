table 50120 Chicken
{
  // version EXT001

  DrillDownPageID="Chicken List";
  LookupPageID="Chicken List";

  fields
  {
    field(1;"No.";Code[20])
    {

      trigger OnValidate();
      begin
        IF "No." <> xRec."No." THEN BEGIN
          ChickenSetup.GET;
          NoSeriesManagement.TestManual(ChickenSetup."Chicken Nos.");
          "No. Series" := '';
        END;
      end;
    }
    field(2;Description;Text[50])
    {
    }
    field(3;"Chicken Type Code";Code[20])
    {
      TableRelation="Chicken Type";
    }
    field(4;"No. Series";Code[20])
    {
    }
    // field(5;"No Of Eggs On Document";Decimal)
    // {
    //   CalcFormula=Sum("Egg. Production Line".Quantity WHERE ("Chicken No."=FIELD("No."),
    //                                        "Egg Date"=FIELD("Date Filter"),
    //                                        "Egg Type Code"=FIELD("Egg Type Filter")));
    //   Editable=false;
    //   FieldClass=FlowField;
    // }
    // field(6;"Date Filter";Date)
    // {
    //   FieldClass=FlowFilter;
    // }
    // field(7;"Egg Type Filter";Code[20])
    // {
    //   FieldClass=FlowFilter;
    //   TableRelation="Egg Type";
    // }
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
      ChickenSetup.TESTFIELD("Chicken Nos.");
      NoSeriesManagement.InitSeries(ChickenSetup."Chicken Nos.",
                                    xRec."No. Series",
                                    0D,
                                    "No.",
                                    "No. Series");
    END;
  end;

  var
    NoSeriesManagement : Codeunit NoSeriesManagement;
    ChickenSetup : Record "Chicken Setup";

  PROCEDURE AssistEdit(OldChicken : Record Chicken) : Boolean;
  var
    Chicken : Record Chicken;
  begin
    WITH Chicken DO BEGIN
      Chicken := Rec;
      ChickenSetup.GET;
      ChickenSetup.TESTFIELD("Chicken Nos.");
      IF NoSeriesManagement.SelectSeries(ChickenSetup."Chicken Nos.",OldChicken."No. Series","No. Series") THEN BEGIN
        NoSeriesManagement.SetSeries("No.");
        Rec := Chicken;
        EXIT(TRUE);
      END;
    END;
  end;
}

