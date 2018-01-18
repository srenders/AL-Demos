page 50125 "Chicken Setup"
{
    PageType = Card;
    SourceTable = "Chicken Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Chicken Nos.";"Chicken Nos.")
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
            // action(ActionName)
            // {
            //     trigger OnAction();
            //     begin
            //     end;
            // }
        }
    }
    trigger OnOpenPage();
    begin
        IF NOT GET THEN INSERT;
    end;
}