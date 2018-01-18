table 50132 "Chicken Cue"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
        }
        field(2;EggsInProduction;Decimal)
        {
            FieldClass = FlowField;
            CalcFormula=Sum("Egg. Production Line".Quantity);
            Editable = false;
        }
        field(3;PostedEggs;Decimal)
        {
            FieldClass = FlowField;
            CalcFormula=Sum("Chicken Ledger Entry".Quantity);
            Editable = false;
        }
        field(4;ProductionOrders;Integer)
        {
            FieldClass = FlowField;
            CalcFormula=Count("Egg. Production Header");
            Editable = false;
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