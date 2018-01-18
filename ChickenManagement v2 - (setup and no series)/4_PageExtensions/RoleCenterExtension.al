//pageextension 50120 ChickenRCExtension extends "Business Manager Role Center"
pageextension 50120 ChickenRCExtension extends "Order Processor Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here

        addafter(Customers)
        {
            action(Chickens)
            {
                CaptionML=ENU='Chickens';
                RunObject=page "Chicken List";
                RunPageMode=View;
                Image=Add;
                ApplicationArea = All;
            }
            action(ChickenTypes)
            {
                CaptionML=ENU='ChickenTypes';
                RunObject=page "Chicken Types";
                RunPageMode=View;
                Image=Add;
                ApplicationArea = All;
            }         

            action(ChickenSetup)
            {
                CaptionML=ENU='ChickenSetup';
                RunObject=page "Chicken Setup";
                RunPageMode=Edit;
                Image=Setup;
                ApplicationArea = All;
            }
        }        
    }
}