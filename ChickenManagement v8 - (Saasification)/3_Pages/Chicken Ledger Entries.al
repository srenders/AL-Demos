page 50129 "Chicken Ledger Entries"
{
  // version EXT001

  PageType=List;
  SourceTable="Chicken Ledger Entry";
  Editable = false;
  InsertAllowed = false;
  ModifyAllowed = false;
  DeleteAllowed = false;

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("Entry No.";"Entry No.")
        {
        }
        field("Chicken No.";"Chicken No.")
        {
        }
        field("Posting Date";"Posting Date")
        {
        }
        field("Document Date";"Document Date")
        {
        }
        field("Entry Type";"Entry Type")
        {
        }
        field("Document No.";"Document No.")
        {
        }
        field(Description;Description)
        {
        }
        field(Quantity;Quantity)
        {
        }
        field("Starting Date";"Starting Date")
        {
        }
        field("Egg Production No.";"Egg Production No.")
        {
        }
        field("Journal Batch Name";"Journal Batch Name")
        {
        }
        field("Source Code";"Source Code")
        {
        }
        field("Reason Code";"Reason Code")
        {
        }
        field("No. Series";"No. Series")
        {
        }
        field("User ID";"User ID")
        {
        }
        field("Source Type";"Source Type")
        {
        }
        field("Source No.";"Source No.")
        {
        }
        field("Global Dimension 1 Code";"Global Dimension 1 Code")
        {
        }
        field("Global Dimension 2 Code";"Global Dimension 2 Code")
        {
        }
        field("Dimension Set ID";"Dimension Set ID")
        {
        }
      }
    }
  }

  actions
  {
    area(navigation)
    {
      group("Ent&ry")
      {
        CaptionML=ENU='Ent&ry';
        Image=Entry;
        action(Dimensions)
        {
          CaptionML=ENU='Dimensions';
          Image=Dimensions;
          ShortCutKey='Shift+Ctrl+D';

          trigger OnAction();
          begin
            ShowDimensions;
          end;
        }
      }
    }
    area(processing)
    {
      action("&Navigate")
      {
        CaptionML=ENU='&Navigate';
        Image=Navigate;
        Promoted=true;
        //The properties 'PromotedCategory' and 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
        //PromotedCategory=Process;

        trigger OnAction();
        begin
          Navigate.SetDoc("Posting Date","Document No.");
          Navigate.RUN;
        end;
      }
    }
  }

  var
    Navigate : Page Navigate;
}

