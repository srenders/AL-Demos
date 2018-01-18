pageextension 50101 MyCustomerListExtension extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("&Customer")
        {
            action(CopyToMyCustomers)
            {
                ApplicationArea=All;
                Image=ExecuteBatch;
                trigger OnAction();
                var MyCopyCustomers: CodeUnit MyCopyCustomers;
                begin
                    MyCopyCustomers.CopyCustomersToMyCustomers;
                end;
            }
            action(ShowMyCustomers)
            {
                ApplicationArea=All;
                Image=ExecuteBatch;
                trigger OnAction();
                var MyCustomers: Page MyCustomers;
                begin
                    MyCustomers.Run;
                end;
            }
        }
    }
}