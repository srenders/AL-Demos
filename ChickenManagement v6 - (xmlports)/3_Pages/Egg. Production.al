page 50126 "Egg. Production"
{
  // version EXT001

  PageType=Document;
  SourceTable="Egg. Production Header";

  layout
  {
    area(content)
    {
      group(General)
      {
        field("No.";"No.")
        {
          ApplicationArea = All;
        }
        field("Document Date";"Document Date")
        {
          ApplicationArea = All;
        }
        field("Posting Date";"Posting Date")
        {
          ApplicationArea = All;
        }
        field("No. Printed";"No. Printed")
        {
          ApplicationArea = All;
        }
      }
      part(EggProdLineSubpage;"Egg.Prod.Line Subpage")
      {
        SubPageLink="Document No."=FIELD("No.");
        ApplicationArea = All;
      }
    }
    area(factboxes)
    {
      part(Control7;"Chicken Factbox")
      {
        Provider=EggProdLineSubpage;
        SubPageLink="No."=FIELD("Chicken No.");
        ApplicationArea = All;
      }
      systempart(Control8;Notes)
      {
        ApplicationArea = All;
      }
      systempart(Control9;Links)
      {
        ApplicationArea = All;
      }
    }
  }

  actions
  {
    area(processing)
    {
      group(Test)
      {
        CaptionML=ENU='GetSelectedLineRecords';        
        action(MyAction)
        {
          ApplicationArea = All;
          Image = GetEntries;
          Promoted = true;
          PromotedIsBig = true;
          
          trigger OnAction();
          var
            EggProductionLine : Record "Egg. Production Line";
          begin
            CurrPage.EggProdLineSubpage.PAGE.GetSelectedRecords(EggProductionLine);
            if EggProductionLine.Findset then
            REPEAT
              MESSAGE('Selected record(s): %1',EggProductionLine);
            UNTIL EggProductionLine.NEXT = 0;
          end;
        }
      }
      group(Posting)
      {
        CaptionML=ENU='Posting';
        action("P&ost")
        {
          CaptionML=ENU='P&ost';
          Image=PostDocument;
          Promoted=true;
          PromotedCategory=Process;
          RunObject=Codeunit "Chicken Post (Yes/No)";
          ShortCutKey='F9';
        }
      }
    }
  }
}

