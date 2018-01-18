table 50121 "Chicken Type"
{
  // version EXT001

  DataPerCompany=false;
  DrillDownPageID="Chicken Types";
  LookupPageID="Chicken Types";

  fields
  {
    field(1;"Code";Code[20])
    {
    }
    field(2;Description;Text[50])
    {
    }
  }

  keys
  {
    key(Key1;"Code")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}

