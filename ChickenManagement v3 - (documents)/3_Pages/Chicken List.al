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
  }
}

