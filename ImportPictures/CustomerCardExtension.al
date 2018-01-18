pageextension 50100 CustomerCardPictures extends "Customer Card" 
{
    actions 
    {
        addfirst(Creation) 
        {
            action(Upload) 
            {
                RunObject = codeunit MyPictureCode;
                ApplicationArea = all;
            }
            action(View) 
            {
                RunObject = page ShowPictures;
                RunPageOnRec = false;
                ApplicationArea = all;
            }
        
        }
    }    
}