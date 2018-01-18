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
      action("Chicken List Report")
      {
        CaptionML=ENU='Chicken List Report';
        Image=List;
        Promoted=true;
        PromotedCategory="Report";
        PromotedIsBig=true;
        RunObject=Report "Chicken List Report";
      }
      action("Chicken Query")
      {
        CaptionML=ENU='Chicken Query';
        Image=List;
        Promoted=true;
        PromotedCategory="Report";
        PromotedIsBig=true;
        trigger OnAction()
        var
          ChickenManagement : Codeunit "Chicken Management";
        begin
          ChickenManagement.RunChickenQuery;          
        end;
      }    
    }
    area(processing)
    {
      action("Export Chickens")
      {
        CaptionML=ENU='Export Chickens XMLPort';
        Image=Export;
        Promoted=true;
        PromotedCategory=Process;
        PromotedIsBig=true;
        //RunObject=XMLport "Export Chickens";
        trigger OnAction();
        var
          ExportChickens : XmlPort "Export Chickens";
        begin
          //ExportChickens.Run;
          Xmlport.Run(50140, false, false);
        end;
      }
    }
  }
}

