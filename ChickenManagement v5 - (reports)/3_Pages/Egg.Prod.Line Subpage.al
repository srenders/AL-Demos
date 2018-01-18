page 50127 "Egg.Prod.Line Subpage"
{
  // version EXT001

  AutoSplitKey=true;
  DelayedInsert=true;
  PageType=ListPart;
  SourceTable="Egg. Production Line";

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("Chicken No.";"Chicken No.")
        {
          ApplicationArea = All;
        }
        field("Chicken Description";"Chicken Description")
        {
          ApplicationArea = All;
        }
        field("Egg Date";"Egg Date")
        {
          ApplicationArea = All;
        }
        field("Egg Type Code";"Egg Type Code")
        {
          ApplicationArea = All;
        }
        field(Quantity;Quantity)
        {
          ApplicationArea = All;
        }
      }
    }
  }

  actions
  {
  }
  PROCEDURE GetSelectedRecords(VAR EggProductionLine : Record "Egg. Production Line");
  begin
    CurrPage.SETSELECTIONFILTER(EggProductionLine);
  end;

}

