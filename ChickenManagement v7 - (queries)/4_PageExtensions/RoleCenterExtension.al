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
            action(EggProduction)
            {
                CaptionML=ENU='Egg. Production';
                RunObject=page "Egg. Production List";
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
            action(PostedEggProduction)
            {
                CaptionML=ENU='Posted Egg. Production';
                RunObject=page "Posted Egg Production List";
                RunPageMode=View;
                Image=Add;
                ApplicationArea = All;
            } 
            action(ChickenLedgers)
            {
                CaptionML=ENU='Chicken Ledger Entries';
                RunObject=page "Chicken Ledger Entries";
                RunPageMode=View;
                Image=Add;
                ApplicationArea = All;
            } 
            action(ChickenListReport)
            {
                CaptionML=ENU='Chicken List Report';
                RunObject=report "Chicken List Report";
                RunPageMode=View;
                Image=Report;
                ApplicationArea = All;
            }   
            // action("Export Chickens")
            // {
            //     CaptionML=ENU='Export Chickens';
            //     Image=Export;
            //     Promoted=true;
            //     PromotedCategory=Process;
            //     PromotedIsBig=true;
            //     //RunObject=XMLport "Export Chickens";
            //     trigger OnAction();
            //     var
            //         ExportChickens : XmlPort "Export Chickens";
            //     begin
            //         ExportChickens.Run;
            //     end;
            // }         
        }        
    }
}