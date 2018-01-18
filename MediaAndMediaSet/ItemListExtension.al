pageextension 50121 MyItemListExtension extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Item)
        {
            action(ImportPicture)
            {
                ApplicationArea = all;
                trigger OnAction();
                var ImportItemMedia : Codeunit ImportItemMedia;
                begin
                    ImportItemMedia.ImportMediaFromStream;
                end;
            }
        }
    }
}