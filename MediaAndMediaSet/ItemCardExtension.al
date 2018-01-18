pageextension 50120 MyItemCardExtension extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Item)
        {
            group("Item Picture")
            {
                field(MyItemPicture;ItemPicture)
                {
                    Visible = true;
                    Importance = Standard;
                    ApplicationArea = all;
                }
                field(Picture;Picture){
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}