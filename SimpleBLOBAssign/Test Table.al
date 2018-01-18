table 50132 TestTable
{

    fields
    {
        field(1;pk;Integer)
        {
        }
        field(2;BlobField;Blob)
        {
        }
    }

    keys
    {
        key(PK;pk)
        {
            Clustered = true;
        }
    }
    
    var

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