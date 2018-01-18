page 50111 RunMyCodeunit{
    PageType = Card;
    //SourceTable = Customer;

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
            action(GetCustomers)
            {
                Promoted=true;
                Image=ExecuteBatch;
                ApplicationArea=All;
                trigger OnAction();
                var GetCustomers: Codeunit GetCustomers;
                begin
                    //Codeunit.Run(50101);
                    GetCustomers.Run;
                end;            
            }
            action(ShowResults)
            {
                Promoted=true;
                Image=ExecuteBatch;
                ApplicationArea=All;
                trigger OnAction();
                var MyDataTypeExamplesCodeunit: Codeunit MyDataTypeExamplesCodeunit;
                begin
                    MyDataTypeExamplesCodeunit.ShowResults;
                end;
            }
            action(ListOfCustomers)
            {
                Promoted=true;
                Image=ExecuteBatch;
                ApplicationArea=All;
                trigger OnAction();
                var MyTextbuilderExampleCodeunit: Codeunit MyTextbuilderExampleCodeunit;
                begin
                    MyTextbuilderExampleCodeunit.WorkWithListOfCustomers;
                end;
            }
        }
    }
}