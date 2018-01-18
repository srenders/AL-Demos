page 50100 RunMyCodeunit
{
    PageType = Card;
    //SourceTable = TableName;

    layout
    {
        area(content)
        {
            group(GroupName)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ShowResults)
            {
                Promoted=true;
                Image=ExecuteBatch;
                ApplicationArea=All;
                trigger OnAction();
                var MyDataTypeExamplesCodeunit:Codeunit MyFirstCodeunit;
                begin
                    MyDataTypeExamplesCodeunit.ShowResults;
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}