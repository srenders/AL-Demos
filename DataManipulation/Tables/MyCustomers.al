table 50101 MyCustomersTable
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;Name;Text[50])
        {}
        field(3;City;Text[100])
        {}
        field(4;"Search Name";Code[100])
        {}
    }

    keys
    {
        key(PK;"No.")
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