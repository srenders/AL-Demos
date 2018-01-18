page 50128 "Egg. Production List"
{
    PageType = List;
    Editable = false;
    SourceTable = "Egg. Production Header";
    CardPageId = "Egg. Production";

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
                field("Document Date";"Document Date")
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
        }
    }

    actions
    {
        // area(processing)
        // {
        //     action(ActionName)
        //     {
        //         trigger OnAction();
        //         begin
        //         end;
        //     }
        // }
    }
}