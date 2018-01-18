pageextension 50123 MyCustListExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addfirst(PricesAndDiscounts)
        {
            action(RunMyFuncyion)
            {
                ApplicationArea = All;
                
                trigger OnAction();
                var MyAzureCodeunit : Codeunit MyAzureCodeunit;
                begin
                    MyAzureCodeunit.RunMyAzureFunction;
                end;
            }
        }
    }
    
    var
        //myInt : Integer;
}