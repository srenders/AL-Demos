page 50102 MyCustomers
{
    PageType = List;
    SourceTable = MyCustomersTable;
    Editable = false;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {   
                    ApplicationArea=All;                 
                }
                field(Name;Name)
                {
                    ApplicationArea=All;
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