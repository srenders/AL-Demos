page 50122 "Chicken Types"
{
  // version EXT001

  PageType=List;
  SourceTable="Chicken Type";
  Editable = false;

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
  }

  actions
  {
  }
}

