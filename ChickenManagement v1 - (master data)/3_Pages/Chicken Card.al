page 50120 "Chicken Card"
{
  // version EXT001

  PageType=Card;
  SourceTable=Chicken;

  layout
  {
    area(content)
    {
      group(General)
      {
        field("No.";"No.")
        {
          ApplicationArea = All;
          trigger OnAssistEdit();
          begin
            IF AssistEdit(xRec) THEN
              CurrPage.UPDATE;
          end;
        }
        field(Description;Description)
        {
          ApplicationArea = All;
        }
        field("Chicken Type Code";"Chicken Type Code")
        {
          ApplicationArea = All;
        }
        // field("No Of Eggs On Document";"No Of Eggs On Document")
        // {
        // }
      }
    }
  }

  actions
  {
    area(processing)
    {
      action(AddAsResource)
      {
        CaptionML=ENU='Add As Resource';
        Image=CreateSKU;
        ApplicationArea = All;

        trigger OnAction();
        var
          //ChickenManagement : Codeunit 70060001;
        begin
          //ChickenManagement.AddChickenAsResource(Rec);
        end;
      }
    }
  }
}

