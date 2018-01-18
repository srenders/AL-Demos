pageextension 50100 MyCustomerListExtension extends "Customer List"
{

layout { }
 
actions
{
    addafter("&Customer")
    {
        action("Run Visible")
        {
            Promoted=true;
            PromotedCategory=New;
            ApplicationArea = all;
                    
            trigger OnAction();
            var VisibleControlTest : page VisibleControlTest;
            begin
                VisibleControlTest.SetVisible(true);
                VisibleControlTest.RunModal;
            end;
        }
        action("Run Not Visible")
        {
            Promoted=true;
            PromotedCategory=New;
            ApplicationArea = all;
                    
            trigger OnAction();
            var VisibleControlTest : page VisibleControlTest;
            begin
                VisibleControlTest.SetVisible(false);
                VisibleControlTest.RunModal;
            end;
        }

    }
}
}

