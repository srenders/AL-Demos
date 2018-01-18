page 50121 "Chicken List"
{
  CardPageID="Chicken Card";
  Editable=false;
  PageType=List;
  SourceTable=Chicken;  
  
  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("No.";"No.")
        {
          ApplicationArea = All;
        }
        field(Description;Description)
        {
          ApplicationArea = All;
        }
        field("Chicken Type Code";"Chicken Type Code")
        {
          ApplicationArea = All;
        }
      }
    }
    area(factboxes)
    {
      part(Control9;"Chicken Factbox")
      {
        SubPageLink="No."=FIELD("No.");
        ApplicationArea = All;
      }
      systempart(Control7;Notes)
      {
        ApplicationArea = All;
      }
      systempart(Control8;Links)
      {
        ApplicationArea = All;
      }
    }
  }

  actions
  {
    area(navigation)
    {
      action(Resources)
      {
        CaptionML=ENU='Resources';
        Image=Resource;
        RunObject=Page "Resource List";
        ApplicationArea = All;
      }
    }
    area(reporting)
    {
      // action("Chicken List")
      // {
      //   CaptionML=ENU='Chicken List';
      //   Image=List;
      //   Promoted=true;
      //   PromotedCategory="Report";
      //   PromotedIsBig=true;
      //   RunObject=Report "Chicken List Report";
      // }
    }
    area(processing)
    {
      // action("Export Chickens")
      // {
      //   CaptionML=ENU='Export Chickens';
      //   Image=Export;
      //   Promoted=true;
      //   PromotedCategory=Process;
      //   PromotedIsBig=true;
      //   RunObject=XMLport "Export Chickens";
      // }
      // action("Show a Notification")
      // {
      //   CaptionML=ENU='Show a Notification';
      //   Image=Export;
      //   Promoted=true;
      //   PromotedCategory=Process;
      //   PromotedIsBig=true;
      //   trigger OnAction();
      //   var MyCodeUnit : Codeunit "Chicken Management";
      //   begin
      //     MyCodeUnit.ShowANotification(rec.Description);
      //   end;
      // }
    }
  }
}

