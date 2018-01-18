page 50137 "My Chickens"
{
    PageType = ListPart;
    SourceTable = "My Chickens";
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Chicken No.";"Chicken No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        GetChicken;
                    end;
                }
                field("Chicken Description";Chicken.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                Image = Edit;
                ShortcutKey = Return;

                trigger OnAction();
                begin
                    OpenChickenCard;
                end;
            }
        }
    }
    var
        Chicken : record Chicken;
    local procedure GetChicken();
    var
        //myInt : Integer;
    begin
        if Chicken.get("Chicken No.") then;
    end;
    local procedure OpenChickenCard();
    var
        myInt : Integer;
    begin
        IF Chicken.GET("Chicken No.") THEN
            PAGE.RUN(PAGE::"Chicken Card",Chicken);
    end;
    trigger OnOpenPage();
    begin
        SETRANGE("User ID",USERID);
    end;
    trigger OnAfterGetRecord();
    begin
        GetChicken;
    end;
    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        clear(Chicken);
    end;
}