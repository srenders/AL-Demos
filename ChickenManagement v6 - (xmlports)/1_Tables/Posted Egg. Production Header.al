table 50130 "Posted Egg. Production Header"
{
  // version EXT001


  fields
  {
    field(1;"No.";Code[20])
    {
    }
    field(2;"Document Date";Date)
    {
    }
    field(3;"No. Series";Code[20])
    {
    }
    field(23;"Posting Date";Date)
    {
      CaptionML=ENU='Posting Date';
    }
    field(25;"Reason Code";Code[10])
    {
      CaptionML=ENU='Reason Code';
      TableRelation="Reason Code".Code;
    }
    field(29;"User ID";Code[20])
    {
      CaptionML=ENU='User ID';
      //TableRelation=User."User Name";
      //This property is currently not supported
      //TestTableRelation=false;
      //ValidateTableRelation=false;

      trigger OnLookup();
      var
        UserMgt : Codeunit 418;
      begin
        UserMgt.LookupUserID("User ID");
      end;
    }
    field(30;"Source Code";Code[10])
    {
      CaptionML=ENU='Source Code';
      TableRelation="Source Code";
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

      trigger OnLookup();
      begin
        ShowDimensions;
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

  var
    DimMgt : Codeunit 408;

  PROCEDURE ShowDimensions();
  begin
    DimMgt.ShowDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2',TABLECAPTION,"No."));
  end;
}

