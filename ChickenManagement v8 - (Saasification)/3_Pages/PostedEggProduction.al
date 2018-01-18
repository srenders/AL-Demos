page 50135 "Posted Egg Production List"
{
    PageType = List;
    SourceTable = "Posted Egg. Production Header";
    CardPageId = "Posted Egg. Production";
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
                    ApplicationArea = all;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}