page 50130 "Chicken Registers"
{
  // version EXT001

  PageType=List;
  SourceTable="Chicken Register";
  InsertAllowed = false;
  ModifyAllowed = false;
  DeleteAllowed = false;

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("No.";"No.")
        {
        }
        field("From Entry No.";"From Entry No.")
        {
        }
        field("To Entry No.";"To Entry No.")
        {
        }
        field("Creation Date";"Creation Date")
        {
        }
        field("Source Code";"Source Code")
        {
        }
        field("User ID";"User ID")
        {
        }
        field("Journal Batch Name";"Journal Batch Name")
        {
        }
      }
    }
  }

  actions
  {
    area(navigation)
    {
      group(Register)
      {
        CaptionML=ENU='Register';
        action("Seminar Ledger")
        {
          CaptionML=ENU='Seminar Ledger';
          Image=WarrantyLedger;
          Promoted=true;
          //The properties 'PromotedCategory' and 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
          //PromotedCategory=Process;
          //The properties 'PromotedCategory' and 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
          //PromotedIsBig=true;
          //RunObject=Codeunit 123456734;
        }
      }
    }
  }
}

