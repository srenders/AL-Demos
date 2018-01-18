page 50125 "Chicken Setup"
{
  // version EXT001

  DelayedInsert=false;
  DeleteAllowed=false;
  InsertAllowed=false;
  ModifyAllowed=true;
  PageType=Card;
  SourceTable="Chicken Setup";

  layout
  {
    area(content)
    {
      group(General)
      {
        field("Chicken Nos.";"Chicken Nos.")
        {
        }
        field("Egg. Production Nos.";"Egg. Production Nos.")
        {
        }
        field("Posted Egg. Production Nos.";"Posted Egg. Production Nos.")
        {
        }
      }
    }
  }

  actions
  {
  }

  trigger OnOpenPage();
  begin
    IF NOT GET THEN INSERT;
  end;
}

