query 50100 qryCustomers
{
    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.")
            {
            }
            column(CustomerName; Name)
            {
            }
            column(City; City)
            {

            }
        }
    }
    
    var
        //myInt : Integer;

    trigger OnBeforeOpen();
    begin
    end;
}