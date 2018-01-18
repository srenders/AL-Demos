page 50138 "Egg Prodcution Lines"
{
    PageType = List;
    SourceTable = "Egg. Production Line";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Chicken No."; "Chicken No.")
                {
                    
                }
                field("Chicken Description";"Chicken Description")
                {
                    
                }
                field(Quantity;Quantity)
                {
                    
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