page 50100 VisibleControlTest
{    
    layout
    {
        area(Content)
        {
            field(Hello;'HelloWorld')
            {
                Visible=isVisible;
                ApplicationArea = all;
            }
        }
    }

    trigger OnOpenPage();
    begin
        //isVisible:=false;
    end;
    procedure SetVisible(VisibleValue : Boolean);
    var
        //myInt : Integer;
    begin
        isVisible := VisibleValue;
    end;
var
    [InDataSet]
    isVisible : Boolean;
}