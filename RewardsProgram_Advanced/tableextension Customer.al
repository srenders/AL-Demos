tableextension 50100 "CustomerTable Ext." extends Customer 
{ 
    fields 
    { 
        field(10001; RewardPoints; Integer) 
        { 
            MinValue = 0; 
        } 
    } 
} 