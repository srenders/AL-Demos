page 50136 "Chicken Activities"
{
    PageType = CardPart;
    SourceTable = "Chicken Cue";

    layout
    {
        area(content)
        {
            cuegroup(Activities)
            {
                field(EggsInProduction;EggsInProduction)
                {
                    DrillDownPageId = "Egg Prodcution Lines";
                    Image = Calculator;
                    ApplicationArea = all;
                    //Style = ;
                }
                field(PostedEggs;PostedEggs)
                {
                    DrillDownPageId = "Chicken Ledger Entries";
                    Image = Chart;
                    ApplicationArea = all;
                }
                field(ProductionOrders;ProductionOrders)
                {
                    DrillDownPageId = "Egg. Production List";
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Set Up Cues")
            {
                ApplicationArea = all;
                trigger OnAction();
                var 
                    CueRecordRef : RecordRef;
                    CueSetup : Codeunit "Cue Setup";
                begin
                    CueRecordRef.GETTABLE(Rec);
                    CueSetup.OpenCustomizePageForCurrentUser(CueRecordRef.NUMBER);
                end;
            }
        }
    }
    
    var
        myInt : Integer;

    trigger OnOpenPage();
    var
        //myInt : Integer;
    begin
        RESET;
        IF NOT GET THEN BEGIN
            INIT;
            INSERT;
        END;
    end;    
}