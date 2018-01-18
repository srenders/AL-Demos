page 50140 MyTestPage
{
    PageType = Card;
    //SourceTable = TableName;

    layout
    {
        area(content)
        {
            group(Input)
            {
                field(myInput;myInput)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                 editable = false;
                 //CaptionML = ENU ='The Output', NLB='De resultaten';
                field(myResult;myResult)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(DoSomething)
            {
                ApplicationArea = All;
                Image = ExecuteBatch;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    myResult := myInput;
                    message(myWarning,myResult);
                end;
            }
        }
    }
    
    var
        myInput : Text;
        myResult : text;
        myWarning : TextConst  ENU='The result is now: %1.';
}