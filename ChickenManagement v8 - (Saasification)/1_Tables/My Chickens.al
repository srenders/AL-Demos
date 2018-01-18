table 50133 "My Chickens"
{

    fields
    {
        field(1;"User Id";Code[50])
        {
            TableRelation = User."User Name";
        }
        field(2;"Chicken No.";code[20])
        {
            TableRelation = Chicken;
        }
    }

    keys
    {
        key(PK;"User Id","Chicken No.")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

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