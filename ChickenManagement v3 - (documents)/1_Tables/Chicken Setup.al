table 50124 "Chicken Setup"
{
  // version EXT001


  fields
  {
    field(1;"Primary Key";Code[10])
    {
    }
    field(2;"Chicken Nos.";Code[20])
    {
      TableRelation="No. Series";
    }
    field(3;"Egg. Production Nos.";Code[20])
    {
      TableRelation="No. Series";
    }
    field(4;"Posted Egg. Production Nos.";Code[20])
    {
      TableRelation="No. Series";
    }
  }

  keys
  {
    key(Key1;"Primary Key")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}

