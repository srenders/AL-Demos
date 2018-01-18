page 50132 "Posted Egg.Prod.Line Subpage"
{
  // version EXT001

  AutoSplitKey=true;
  DelayedInsert=false;
  DeleteAllowed=false;
  Editable=false;
  InsertAllowed=false;
  ModifyAllowed=false;
  PageType=ListPart;
  SourceTable="Posted Egg. Production Line";

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("Chicken No.";"Chicken No.")
        {
        }
        field("Chicken Description";"Chicken Description")
        {
        }
        field("Egg Date";"Egg Date")
        {
        }
        field("Egg Type Code";"Egg Type Code")
        {
        }
        field(Quantity;Quantity)
        {
        }
      }
    }
  }

  actions
  {
  }
}

