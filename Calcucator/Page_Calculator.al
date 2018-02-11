page 50100 Calculator
{
    PageType = Card;
    UsageCategory = Tasks;
    //SourceTable = TableName;
    
    layout
    {
        area(content)
        {
            group(Input)
            {
                
                field(First; First)
                {
                    ApplicationArea = All;
                }
                field(Second; Second)
                {
                    ApplicationArea = All;
                }
            }
            group(Results)
            {
                Editable = false;
                field(Result; Result)
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
            action(Plus)
            {
                ApplicationArea = All;
                Image = Calculate;
                trigger OnAction()
                begin
                    Result := First + Second;
                end;
            }
            action(CalcSum)
            {
                ApplicationArea = All;
                Image = Calculate;
                trigger OnAction()
                var CalcMngt :Codeunit CalculationMngt;
                begin
                    Result := CalcMngt.CalculateSum(First,Second);
                end;
            }
            action(Clear)
            {
                ApplicationArea = All;
                Image = ClearLog;
                trigger OnAction()
                begin
                    ClearAll;
                end;
            }
        }
    }
    
    var
        First: decimal;
        Second: Decimal;
        Result : Decimal;
}