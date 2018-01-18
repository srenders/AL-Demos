page 50101 "Rewards Level List" 
{ 
    PageType = List; 
    SourceTable = "Reward Level"; 
    SourceTableView = sorting ("Minimum Reward Points") order(ascending); 
    layout 
    { 
        area(content) 
        { 
            repeater(Group) 
            { 
                field(Level; Level) 
                { 
                    ApplicationArea = All; 
                } 
                field("Minimum Reward Points"; "Minimum Reward Points")
                { 
                    ApplicationArea = All; 
                } 
            } 
        } 
    } 

    trigger OnOpenPage(); 
    begin 
        if(not CustomerRewardsExtMgt.IsCustomerRewardsActivated) then 
            Error(NotActivatedTxt); 
    end; 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        NotActivatedTxt: Label 'Customer Rewards is not activated'; 
}