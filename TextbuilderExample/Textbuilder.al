pageextension 50100 MyCustomerListExtension extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
        addfirst("&Customer")
        {
            action(TextBuilderExample)
            {
                ApplicationArea = all;
                Promoted = true;
                trigger OnAction()
                begin
                    TextbuilderEx;
                end;
            }
        }
    }
    
local procedure TextbuilderEx()
var
    myTextBuilder: TextBuilder;
begin
    myTextBuilder.AppendLine('Hello %1, live at Modern Dev Bootcamp!');
    myTextBuilder.AppendLine('This is so awesome :)');
    myTextBuilder.Replace('%1',UserId);
    Message(myTextBuilder.ToText);
    myTextBuilder.Replace('Dev','Development');
    Message(myTextBuilder.ToText);
end;
}