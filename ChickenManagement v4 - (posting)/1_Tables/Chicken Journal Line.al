table 50127 "Chicken Journal Line"
{
  // version EXT001


  fields
  {
    field(1;"Journal Template Name";Code[10])
    {
      CaptionML=ENU='Journal Template Name';
    }
    field(2;"Line No.";Integer)
    {
      CaptionML=ENU='Line No.';
    }
    field(3;"Chicken No.";Code[20])
    {
      CaptionML=ENU='Chicken No.';
      TableRelation=Chicken;
    }
    field(4;"Posting Date";Date)
    {
      CaptionML=ENU='Posting Date';

      trigger OnValidate();
      begin
        VALIDATE("Document Date","Posting Date");
      end;
    }
    field(5;"Document Date";Date)
    {
      CaptionML=ENU='Document Date';
    }
    field(6;"Entry Type";Option)
    {
      CaptionML=ENU='Entry Type';
      OptionCaptionML=ENU='EggProduction';
      OptionMembers=EggProduction;
    }
    field(7;"Document No.";Code[20])
    {
      CaptionML=ENU='Document No.';
    }
    field(8;Description;Text[50])
    {
      CaptionML=ENU='Description';
    }
    field(12;Type;Option)
    {
      CaptionML=ENU='Type';
      OptionCaptionML=ENU='Chicken,"G/L Account"';
      OptionMembers=Chicken,"G/L Account";
    }
    field(13;Quantity;Decimal)
    {
      CaptionML=ENU='Quantity';
      DecimalPlaces=0:5;
    }
    field(21;"Starting Date";Date)
    {
      CaptionML=ENU='Starting Date';
    }
    field(22;"Egg Production No.";Code[20])
    {
      CaptionML=ENU='Seminar Registration No.';
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
    field(32;"Journal Batch Name";Code[10])
    {
      CaptionML=ENU='Journal Batch Name';
    }
    field(33;"Source Code";Code[10])
    {
      CaptionML=ENU='Source Code';
      Editable=false;
      TableRelation="Source Code";
    }
    field(34;"Reason Code";Code[10])
    {
      CaptionML=ENU='Reason Code';
      TableRelation="Reason Code";
    }
    field(35;"Posting No. Series";Code[10])
    {
      CaptionML=ENU='Posting No. Series';
      TableRelation="No. Series";
    }
    field(51;"Shortcut Dimension 1 Code";Code[20])
    {
      CaptionClass='1,2,1';
      CaptionML=ENU='Shortcut Dimension 1 Code';
      TableRelation="Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
    }
    field(52;"Shortcut Dimension 2 Code";Code[20])
    {
      CaptionClass='1,2,2';
      CaptionML=ENU='Shortcut Dimension 2 Code';
      TableRelation="Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
    }
    field(480;"Dimension Set ID";Integer)
    {
      CaptionML=ENU='Dimension Set ID';
      Editable=false;
      TableRelation="Dimension Set Entry";
    }
  }

  keys
  {
    key(Key1;"Journal Template Name","Journal Batch Name","Line No.")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }

  PROCEDURE EmptyLine() : Boolean;
  begin
    EXIT(
      ("Chicken No." = '')
      AND (Quantity = 0));
  end;
}

