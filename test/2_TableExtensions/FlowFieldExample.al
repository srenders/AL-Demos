tableextension 50139 MySalespersonExtension extends "Salesperson/Purchaser"
{
    fields
    {
        // Add changes to table fields here
        field(50100;NoOfCustomers;Integer)
        {
            FieldClass=FlowField;
            CalcFormula=Count(Customer where ("SalesPerson Code"=field(Code)));
        }
    }
    
    var
        myInt : Integer;
}

pageextension 50130 MySalesPersonListExtension extends "Salespersons/Purchasers"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field(NoOfCustomers;NoOfCustomers)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt : Integer;
}