codeunit 50125 "Seminar Reg.-Show Ledger"
{
    TableNo = "Chicken Register";
    trigger OnRun();
    begin
        ChickenLedgerEntry.SETRANGE("Entry No.","From Entry No.","To Entry No.");
        PAGE.RUN(PAGE::"Chicken Ledger Entries",ChickenLedgerEntry);
    end;
    
    var
        ChickenLedgerEntry : Record "Chicken Ledger Entry";
}