page 50131 "Posted Egg. Production"
{
  // version EXT001

  Editable=false;
  PageType=Document;
  SourceTable="Posted Egg. Production Header";
  InsertAllowed = false;
  ModifyAllowed = false;
  DeleteAllowed = false;

  layout
  {
    area(content)
    {
      group(Generel)
      {
        field("No.";"No.")
        {
        }
        field("Document Date";"Document Date")
        {
        }
      }
      part(Control5;"Posted Egg.Prod.Line Subpage")
      {
        SubPageLink="Document No."=FIELD("No.");
      }
    }
    area(factboxes)
    {
      part(Control7;"Chicken Factbox")
      {
        Provider=Control5;
        SubPageLink="No."=FIELD("Chicken No.");
      }
      systempart(Control8;Notes)
      {
      }
      systempart(Control9;Links)
      {
      }
    }
  }

  actions
  {
  }
}

