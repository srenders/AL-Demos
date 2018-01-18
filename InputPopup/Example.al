pageextension 50132 MyCustListExtension extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addfirst(General)
        {
            action(ClickMe)
            {
                ApplicationArea = all;
                trigger OnAction();
                var MyInputPage : page MyInputPage;
                begin
                    clear(MyInputPage);
                    MyInputPage.SetInput('Hello');
                    MyInputPage.RunModal;
                    message(MyInputPage.GetInput);
                end;
            }
        }
    }
    

}