page 50123 "Egg Types"
{
  // version EXT001

  PageType=List;
  SourceTable="Egg Type";

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("Code";Code)
        {
          ApplicationArea = All;
        }
        field(Description;Description)
        {
          ApplicationArea = All;
        }
      }
    }
    area(factboxes)
    {
      systempart(Control6;Notes)
      {
        ApplicationArea = All;
      }
      systempart(Control7;Links)
      {
        ApplicationArea = All;
      }
    }
  }

  actions
  {
  }
}

