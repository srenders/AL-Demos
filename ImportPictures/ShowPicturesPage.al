page 50101 ShowPictures 
{
    SourceTable = PictureTable;
    PageType = List;

    layout 
    {
        area(Content) 
        {
            repeater(Pics) 
            {
                field(Id;Id) 
                { 
                    ApplicationArea = all;
                }
                field(PicSomething;Picture) 
                {
                    ShowCaption=false;
                    ApplicationArea = all;
                }            
            }
        }
    }
}