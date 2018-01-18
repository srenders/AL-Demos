xmlport 50140 "Export Chickens"
{
  Direction=Export;
  Format=Xml;


  schema
  {
    textelement(root)
    {
      tableelement(Chicken;Chicken)
      {
        fieldelement(No;Chicken."No.")
        {
        }
        fieldelement(Description;Chicken.Description)
        {
        }
        fieldelement(NoOfEggs;Chicken."No Of Eggs On Document")
        {
        }
      }
    }
  }

  requestpage
  {
    layout
    {
      area(Content)
      {
        group(Options)
        {
          field("No.";Chicken."No.")
          {
          }
          field("Type";Chicken."Chicken Type Code")
          {
          }
        }
      }
    }

    actions
    {
    }
  }
}

