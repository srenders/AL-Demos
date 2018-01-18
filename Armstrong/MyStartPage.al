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
            action(FindArmstrongNumbers)
            {
                ApplicationArea = all;
                trigger OnAction();
                var Armstrong:Codeunit Armstrong;
                begin
                    Armstrong.FindArmstrong;
                end;

            }
        }
    }
}   