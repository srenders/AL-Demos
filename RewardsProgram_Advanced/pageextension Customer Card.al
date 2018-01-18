pageextension 50100 "Customer Card Ext." extends "Customer Card" 
{ 
    layout 
    { 
        addafter(Name) 
        { 
            field(RewardLevel; RewardLevel) 
            { 
                ApplicationArea = All; 
                Caption = 'Reward Level'; 
                Description = 'Reward level of the customer.'; 
                Editable = false; 
            } 

            field(RewardPoints; RewardPoints) 
            { 
                ApplicationArea = All; 
                Caption = 'Reward Points'; 
                Description = 'Reward points accrued by customer'; 
                Editable = false; 
            } 
        } 
    } 

    trigger OnAfterGetRecord(); 
    var 
        CustomerRewardsMgtExt: Codeunit "Customer Rewards Ext. Mgt."; 
    begin 
        // Get the reward level associated with reward points 
        RewardLevel := CustomerRewardsMgtExt.GetRewardLevel(RewardPoints); 
    end; 
    var 
     RewardLevel: Text; 

}