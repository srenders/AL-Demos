codeunit 50139 MyTextbuilderExampleCodeunit
{
    trigger OnRun();
    begin
    end;
    procedure WorkWithListOfCustomers();
    var
         customerNames : List of [Text]; 
    begin
         // adding an element to a list 
         customerNames.Add('John');

         // checking if the list contains an element 
         if customerNames.Contains('John') then 
              Message('John is in the list.')
         else
              Message('John is not in the list.');

         // getting an element using its index
         Message('Element retrieved at index: ' + customerNames.Get(1));

         // setting an element at an index 
         customerNames.Set(1, 'Marc');

         // getting an element using its index
         Message('Element retrieved after updating element at index: ' + customerNames.Get(1));

         // inserting a new element at index 1 
         customerNames.Insert(1, 'Simon');

         // inserting  an element using its index
         Message('Element retrieved after inserting element at index: '  + customerNames.Get(1));

         // removing an element at index 1
         customerNames.RemoveAt(1);

         // getting an element using its index
         Message('Element retrieved after deleting element at index: '+   customerNames.Get(1));

         // checking    whether list has got any elements
         Message('Is List empty: ' + Format(customerNames.Count = 0));
    end;

    var
        myInt : Integer;
}