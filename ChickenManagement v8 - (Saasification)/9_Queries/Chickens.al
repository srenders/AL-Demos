query 50120 Chickens
{
  QueryType=Normal;  

  elements
  {
    dataitem(Chicken;Chicken)
    {
      column(No;"No.")
      {
      }
      column(Description;Description)
      {
      }
      column(Type_Code;"Chicken Type Code")
      {
      }
      column(No_Of_Eggs_On_Document;"No Of Eggs On Document")
      {
        //Method=Sum;
      }
      dataitem(ChickenLedgerEntry;"Chicken Ledger Entry")
      {
        DataItemLink="Chicken No."=Chicken."No.";
        SqlJoinType=LeftOuterJoin;
        column(Quantity;Quantity)
        {
          Method=Sum;
        }
      }
    }
  }
}

