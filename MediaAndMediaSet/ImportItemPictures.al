codeunit 50120 ImportItemMedia
{
    trigger OnRun();
    begin
    end;
    procedure ImportMediaFromStream();
    var Item : Record Item;
    FileName : Text;
    ItemName : Text;
    InStr : InStream;
    ImportFile : File;
    FileMngt : Codeunit "File Management";
    begin
        File.UploadIntoStream('Upload pic', 'c:\temp', 'All files (*.*)|*.*', filename, instr);
        FileMngt.GetFileName(FileName);
        ItemName := GetFileName(FileName);
        if Item.Get(ItemName) then begin
            message('Found Item: %1',Item."No.");
            Item.ItemPicture.ImportStream(instr, filename);
            item.modify;
        end
        else
            message('Item %1 not found!',ItemName);        
    end;
    procedure GetFileName(FileName : Text) : Text;    
    begin
        exit(CopyStr(filename,
                     strpos(FileName,'1'),
                     strpos(FileName,'.') - strpos(FileName,'1')
                    )
            );
    end;
}