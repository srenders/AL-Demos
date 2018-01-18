codeunit 50100 MyCopyCustomers
{
    trigger OnRun();
    begin
    end;
    procedure CopyCustomersToMyCustomers();
    var
        MyCustomersTable : Record MyCustomersTable;
        Customer : record Customer;
    begin
        //MyCustomersTable.DELETEALL;

        //Loopen over Customers uit Londen
        Customer.SETFILTER(City,'A*');
        IF Customer.FINDSET THEN
        REPEAT
            IF NOT MyCustomersTable.GET(Customer."No.") THEN
            BEGIN
                //Veldjes kopieren naar MijnKlant
                MyCustomersTable."No."         := Customer."No.";
                MyCustomersTable.Name          := Customer.Name;
                MyCustomersTable.City          := Customer.City;
                MyCustomersTable."Search Name" := Customer."Search Name";
                //Bijvoegen/Inserten
                MyCustomersTable.INSERT;
            END;
        UNTIL Customer.NEXT = 0;
        MESSAGE('Ready! %1', MyCustomersTable.Count);
    end;
}