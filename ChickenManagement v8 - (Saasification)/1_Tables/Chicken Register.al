table 50129 "Chicken Register"
{
  // version EXT001


  fields
  {
    field(1;"No.";Integer)
    {
      CaptionML=ENU='No.';
    }
    field(2;"From Entry No.";Integer)
    {
      CaptionML=ENU='From Entry No.';
      TableRelation="Chicken Ledger Entry";
    }
    field(3;"To Entry No.";Integer)
    {
      CaptionML=ENU='To Entry No.';
      TableRelation="Chicken Ledger Entry";
    }
    field(4;"Creation Date";Date)
    {
      CaptionML=ENU='Creation Date';
    }
    field(5;"Source Code";Code[10])
    {
      CaptionML=ENU='Source Code';
      TableRelation="Source Code";
    }
    field(6;"User ID";Code[25])
    {
      CaptionML=ENU='User ID';
      //TableRelation=User."User Name";
      //This property is currently not supported
      //TestTableRelation=false;

      trigger OnLookup();
      var
        UserMgt : Codeunit 418;
      begin
        UserMgt.LookupUserID("User ID");
      end;
    }
    field(7;"Journal Batch Name";Code[10])
    {
      CaptionML=ENU='Journal Batch Name';
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
}

