table 50102 "Customer Rewards Mgt. Setup" 
{ 
    fields 
    { 
        field(1; "Primary Key"; Code[10])
        { 

        } 

        field(2; "Customer Rewards Ext. Mgt. Codeunit ID"; Integer) 
        { 
            TableRelation = "CodeUnit Metadata".ID; 
        } 
    } 

    keys 
    { 
        key(PK; "Primary Key") 
        { 
            Clustered = true; 
        } 
    } 
}