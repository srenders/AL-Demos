pageextension 50122 MyItemPictureFactboxExtension extends "Item Picture"
{
    layout
    {
        // Add changes to page layout here
        addafter(Picture)
        {
            group("Item Picture")
            {
                field(MyItemPicture;ItemPicture)
                {
                    Visible = true;
                    Importance = Standard;
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