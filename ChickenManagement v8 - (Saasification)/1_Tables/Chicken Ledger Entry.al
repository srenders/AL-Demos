table 50128 "Chicken Ledger Entry"
{
  // version EXT001


  fields
  {
    field(1;"Entry No.";Integer)
    {
      CaptionML=ENU='Entry No.';
    }
    field(2;"Chicken No.";Code[20])
    {
      CaptionML=ENU='Chicken No.';
      TableRelation=Chicken;
    }
    field(3;"Posting Date";Date)
    {
      CaptionML=ENU='Posting Date';
    }
    field(4;"Document Date";Date)
    {
      CaptionML=ENU='Document Date';
    }
    field(5;"Entry Type";Option)
    {
      CaptionML=ENU='Entry Type';
      OptionCaptionML=ENU='EggProduction';
      OptionMembers=EggProduction;
    }
    field(6;"Document No.";Code[20])
    {
      CaptionML=ENU='Document No.';
    }
    field(7;Description;Text[50])
    {
      CaptionML=ENU='Description';
    }
    field(11;Quantity;Decimal)
    {
      CaptionML=ENU='Quantity';
      DecimalPlaces=0:5;
    }
    field(19;"Starting Date";Date)
    {
      CaptionML=ENU='Starting Date';
    }
    field(22;"Egg Production No.";Code[20])
    {
      CaptionML=ENU='Egg Production No.';
    }
    field(24;"Journal Batch Name";Code[10])
    {
      CaptionML=ENU='Journal Batch Name';
    }
    field(25;"Source Code";Code[10])
    {
      CaptionML=ENU='Source Code';
      Editable=false;
      TableRelation="Source Code";
    }
    field(26;"Reason Code";Code[10])
    {
      CaptionML=ENU='Reason Code';
      TableRelation="Reason Code";
    }
    field(27;"No. Series";Code[10])
    {
      CaptionML=ENU='No. Series';
      TableRelation="No. Series";
    }
    field(28;"User ID";Code[20])
    {
      CaptionML=ENU='User ID';
      //TableRelation=User."User Name";
      //This property is currently not supported
      //TestTableRelation=false;
      //ValidateTableRelation=false;

      trigger OnValidate();
      var
        UserMgt : Codeunit 418;
      begin
        UserMgt.LookupUserID("User ID");
      end;
    }
    field(30;"Source Type";Option)
    {
      CaptionML=ENU='Source Type';
      OptionCaptionML=ENU='" ",Chicken';
      OptionMembers=" ",Chicken;
    }
    field(31;"Source No.";Code[20])
    {
      CaptionML=ENU='Source No.';
    }
    field(51;"Global Dimension 1 Code";Code[20])
    {
      CaptionClass='1,1,1';
      CaptionML=ENU='Global Dimension 1 Code';
      TableRelation="Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
    }
    field(52;"Global Dimension 2 Code";Code[20])
    {
      CaptionClass='1,1,2';
      CaptionML=ENU='Global Dimension 2 Code';
      TableRelation="Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
    }
    field(480;"Dimension Set ID";Integer)
    {
      CaptionML=ENU='Dimension Set ID';
      Editable=false;
      TableRelation="Dimension Set Entry";

      trigger OnLookup();
      begin
        //ShowDimensions;
      end;
    }
  }

  keys
  {
    key(Key1;"Entry No.")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }

  var
    DimMgt : Codeunit 408;

  PROCEDURE ShowDimensions();
  begin
    DimMgt.ShowDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2',TABLECAPTION,"Entry No."));
  end;
}

