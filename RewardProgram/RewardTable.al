table 50100 Reward
{
    LookupPageId = "Reward List";
    DrillDownPageId = "Reward List";
    fields
    {
        // The "Reward ID" field represents the unique identifier 
        // of the reward and can contain up to 30 Code characters. 
        field(1;"Reward ID";Code[30])
        {
        }

        // The "Description" field can contain a string 
        // with up to 250 characters.
        field(2;Description;Text[250])
        {
            // This property specified that 
            // this field cannot be left empty.
            NotBlank = true;
        }

        // The "Discount Percentage" field is a Decimal numeric value
        // that represents the discount that will 
        // be applied for this reward.
        field(3;"Discount Percentage";Decimal)
        {
            // The "MinValue" property sets the minimum value for the "Discount Percentage" 
            // field.
            MinValue = 0;

            // The "MaxValue" property sets the maximum value for the "Discount Percentage"
            // field.
            MaxValue = 100;

            // The "DecimalPlaces" property is set to 2 to display discount values with  
            // exactly 2 decimals.
            DecimalPlaces = 2;
        }
        field(4;"Minimum Purchase";Decimal)
        {
            MinValue = 0;
            DecimalPlaces = 2;
        }

        field(5;"Last Modified Date";Date)
        {
            // The "Editable" property sets a value that indicates whether the field can be edited 
            // through the UI.
            Editable = false;
        }
    }

    keys
    {
        // The field "Reward ID" is used as the primary key of this table.
        key(PK;"Reward ID")
        {
            // Create a clustered index from this key.
            Clustered = true;
        }
    }
    // "OnInsert" trigger executes when a new record is inserted into the table.
    trigger OnInsert();
    begin
        SetLastModifiedDate();
    end;

    // "OnModify" trigger executes when a record in the table is modified.
    trigger OnModify();
    begin
        SetLastModifiedDate();
    end;

    // "OnDelete" trigger executes when a record in the table is deleted.
    trigger OnDelete();
    begin
    end;

    // "OnRename" trigger executes when a record in a primary key field is modified.
    trigger OnRename();
    begin
        SetLastModifiedDate();
    end;

    // On the current record, the the value of the "Last Modified Date" field to the current 
    // date.
    local procedure SetLastModifiedDate();
    begin
        Rec."Last Modified Date" := Today();
    end;
}