codeunit 50131 IconManagementTest
{
    var
    trigger OnRun();
    begin
    end;
 
    procedure CopyPictureToCompanyInformationUsingStreams();
    var
        lTempBlob : record TempBlob temporary;
        CompanyInformation : record "Company Information";
        Instr : InStream;
        Outstr : OutStream;
    begin
        lTempBlob.Init;
        lTempBlob.FromBase64String(ReturnGreenAsBase64);
        lTempBlob.Insert;
        lTempBlob.CalcFields(Blob);
        lTempBlob.Blob.CreateInStream(Instr);
        CompanyInformation.Picture.CreateOutStream(Outstr);
        CopyStream(Outstr,Instr);
        lTempBlob.Delete;
        CompanyInformation.Modify;
    end;

    procedure CopyPictureToCompanyInformationUsingSimpleAssignment();
    var
        lTempBlob : record TempBlob temporary;
        CompanyInformation : record "Company Information";
    begin
        lTempBlob.Init;
        lTempBlob.FromBase64String(ReturnGreenAsBase64);
        lTempBlob.Insert;
        lTempBlob.CalcFields(Blob);
        CompanyInformation.Picture := lTempBlob.Blob;
        lTempBlob.Delete;
        CompanyInformation.Modify;
    end;

    procedure CopyPictureToTempTableUsingStream(var TestTable : record TestTable temporary);
    var
        lTempBlob : record TempBlob temporary;
        Instr : InStream;
        Outstr : OutStream;
    begin
        lTempBlob.Init;
        lTempBlob.FromBase64String(ReturnGreenAsBase64);
        lTempBlob.Insert;
        lTempBlob.CalcFields(Blob);
        lTempBlob.Blob.CreateInStream(Instr);
        TestTable.BlobField.CreateOutStream(Outstr);
        CopyStream(Outstr,Instr);
        lTempBlob.Delete;
        TestTable.Modify;
    end;

    procedure CopyPictureToTableUsingStream(var TestTable : record TestTable);
    var
        lTempBlob : record TempBlob temporary;
        Instr : InStream;
        Outstr : OutStream;
    begin
        lTempBlob.Init;
        lTempBlob.FromBase64String(ReturnGreenAsBase64);
        lTempBlob.Insert;
        lTempBlob.CalcFields(Blob);
        lTempBlob.Blob.CreateInStream(Instr);
        TestTable.BlobField.CreateOutStream(Outstr);
        CopyStream(Outstr,Instr);
        lTempBlob.Delete;
        TestTable.Modify;
    end;

    local procedure ReturnGreenAsBase64()  Base64String : Text
    var
    begin
        Base64String := 'iVBORw0KGgoAAAANSUhEUgAAABYAAAAVCAYAAABCIB6VAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwAAADsABataJCQAAABl0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuODc7gF0AAANCSURBVEhLrVVLTxNRFO5OXBoenZbeO9NCH1BLW6DEaAIY48JENGiQjYi6koiRmT4oTZCCUsASeZNoazBqAsgjAR8kGhEsFIW4Ev8CJriQNWqO55YBQwCx4JecZDK595vTr9/5jmInpN9IPyBUC/mpTiJyEq1LqlqrFHzm8J3gFgr4cj5BPr47+Do+gbppCeciIU6kn421WjjWpoeCDlYGyG83gKlWgCSRLuKZMHEKF9gd+fr20NakKDVO2qhx02V7cxoUPzBC5YAZascscOe5BZpYjVugZjATLoaN4GhJA7WHX1ZLNKCt0Splms3gXTynEkm3zsf/PNllhJtDh6Ft2g7hjzkQiubAo6gdnmINzGXD+EI2DM3YoGnUDOd69JCGd5QS7TH5qEqmW4PJa0pELVu0Pn719H0T1L/Jhs5oLrRH7ND53g69kWwIRWzQh/Vkxg79WCNRG7yax+d3WXAlZIB0vKty8kGDZEiSaRUKwUvL8Od/P95pgFtI2jbrgOB0DrQh6U7EQ7M2GMF6vWCD4aksKOnWg8pFV4hHKI+R6up0KWqJDNtQ02vDFriLpC3Tuf9MPIadTyJ517gZjqLm6JqRmN7EK5xB4qWicAY0IFkASeMlnvhghbdYlX1G4ESyhDY9q1A7qdvk10J5vwUCUQc0TuXETfxyzgqzn2wQHM6ArHot4B/pUaiqSL3jngEqRq1wO7J34ql5K4RfZMKJjnRIFEmDgsNpOoKmvz7GiHP3Rfx4wgynuvRwSCT+WMd5Gx3vj3hTx+saX/4PGreixtZ1jbe6In5i5orJP674GnMF85zauebjin34uFv2cbJERzdyQ6gml3DyVvY0efPy5GFmsMkTvPLkMbD5xqwI6nzCahFmRUMcWTGAWXE1jFlRw/9QSbR1U1YwUEwmlUR6YunWbYQqlIWlW+gv6daM6XYeO0XSX0qR9m5Jt3UwbTQuGtB4MI9Rr+IQ5vHg5jxuxjz2PcuEMszjPDyT6uG/obOaMOw5mWZ7sG1A3KQU9XqIG2TRxDZI+9oGKcQNUoDDlME2SBX5wuEZ4hZKNaLmoHx9d7APsL2mdvGS0sn7k3Ga0Pj+ZCfxs3d8NV+480pSKH4DIjo6f38YOmwAAAAASUVORK5CYII=';
    end;
}


