table 50131 "Posted Egg. Production Line"
{
  // version EXT001


  fields
  {
    field(1;"Document No.";Code[20])
    {
    }
    field(2;"Line No.";Integer)
    {
    }
    field(3;"Chicken No.";Code[20])
    {
      TableRelation=Chicken;
    }
    field(4;"Egg Date";Date)
    {
    }
    field(5;"Egg Type Code";Code[20])
    {
      TableRelation="Egg Type";
    }
    field(6;Quantity;Decimal)
    {
    }
    field(7;"Chicken Description";Text[50])
    {
      CalcFormula=Lookup(Chicken.Description WHERE ("No."=FIELD("Chicken No.")));
      Editable=false;
      FieldClass=FlowField;
    }
  }

  keys
  {
    key(Key1;"Document No.","Line No.")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}

