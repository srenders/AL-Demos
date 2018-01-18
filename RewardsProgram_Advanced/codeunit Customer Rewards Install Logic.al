codeunit 50100 "Customer Rewards Install Logic" 
{ 
    // Customer Rewards Install Logic 
    Subtype = Install; 

    trigger OnInstallAppPerCompany(); 
    begin 
        SetDefaultCustomerRewardsExtMgtCodeunit; 
    end; 

    procedure SetDefaultCustomerRewardsExtMgtCodeunit();
    var 
        CustomerRewardsExtMgtSetup: Record "Customer Rewards Mgt. Setup";
    begin 
        CustomerRewardsExtMgtSetup.DeleteAll; 
        CustomerRewardsExtMgtSetup.Init; 
        // Default Customer Rewards Ext. Mgt codeunit to use for handling events 
        CustomerRewardsExtMgtSetup."Customer Rewards Ext. Mgt. Codeunit ID" := Codeunit::"Customer Rewards Ext. Mgt."; 
        CustomerRewardsExtMgtSetup.Insert; 
    end; 
}