table 50124 "Chicken Setup"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {}
        field(2;"Chicken Nos.";Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}