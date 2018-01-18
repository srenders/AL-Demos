page 50136 MyStartPage
{
    PageType = Card;
    //SourceTable = TableName;

    layout
    {
        area(content)
        {
            group(Information)
            {
                
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ShowDialog)
            {
                ApplicationArea = all;
                trigger OnAction();
                var DialogMngt:Codeunit DialogMngt;
                begin
                    DialogMngt.Run;
                end;

            }
        }
    }
}   