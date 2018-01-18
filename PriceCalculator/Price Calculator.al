page 50112 "Price Calculator"
{
  layout
  {
    area(content)
    {
      group(Input)
      {
        field(Quantity;Quantity)
        {
          ApplicationArea = All;
        }
        field(Price;Price)
        {
          ApplicationArea = All;
        }
      }
      group(Output)
      {       
          field(Result;Result)
          {
            Editable=false;
            ApplicationArea = All;
                      } 
          field(TotalSales;TotalSales)
          {
            Editable=false;
            ApplicationArea = All;
          }
          field(TotalCredits;TotalCredits)
          {
            Editable=false;
            ApplicationArea = All;
          }
          field(GrandTotal;GrandTotal)
          {
            Editable=false;
            Style=Strong;
            StyleExpr=TRUE;
            ApplicationArea = All;
          }       
      }
    }
  }

  actions
  {
    area(processing)
    {
      action(Execute)
      {
        Image=Post;
        Promoted=true;
        PromotedIsBig=true;
        ApplicationArea = All;
        trigger OnAction();
        begin
          IF Quantity = 0 THEN
            EXIT;

          Result := Quantity * Price;

          IF Result > 0 THEN
            TotalSales += Result    //TotalSales := TotalSales + Result
          ELSE
            TotalCredits += Result;

          GrandTotal += Result;
        end;
      }
      action(Clear)
      {
        Image=Evaluate;
        Promoted=true;
        PromotedIsBig=true;
        ApplicationArea = All;
        trigger OnAction();
        begin
          CLEARALL;

          CLEAR(Result);
        end;
      }
    }
  }

  var
    Quantity : Decimal;
    Price : Decimal;
    Result : Decimal;
    TotalSales : Decimal;
    TotalCredits : Decimal;
    GrandTotal : Decimal;
}

