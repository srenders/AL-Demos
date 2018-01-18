codeunit 50103 MyPictureCode
{
    trigger OnRun();    
    var 
        instr : InStream;
        filename : Text;
        pictab : record PictureTable;
    begin        
        File.UploadIntoStream('Upload pic', 'c:\temp', 'All files (*.*)|*.*', filename, instr);
        pictab.Init();
        pictab.Picture.ImportStream(instr, filename);
        pictab.Insert(true);
    end;
}