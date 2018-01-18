pageextension 50130 TestExtension extends "Company Information"
{
    layout
    {
    }

    actions
    {
        addlast(Navigation)
        {
            action(StreamPicture)
            {
                trigger OnAction();
                begin
                    IconManagement.CopyPictureToCompanyInformationUsingStreams;
                end;
            }

            action(AssignPicture)
            {
                trigger OnAction();
                begin
                    IconManagement.CopyPictureToCompanyInformationUsingSimpleAssignment;
                end;
            }

            action(StreamPictureToTempTable)
            {
                trigger OnAction();
                begin
                    TestTableTemp.Reset;
                    TestTableTemp.DeleteAll;
                    TestTableTemp.Init;
                    TestTableTemp.Insert;
                    IconManagement.CopyPictureToTempTableUsingStream(TestTableTemp);
                    TestTableTemp.FindFirst;
                    TestBlobTempPage.SetTableView(TestTableTemp);
                    TestBlobTempPage.SetRecord(TestTableTemp);
                    TestBlobTempPage.Run;
                end;
            }

            action(StreamPictureToTable)
            {
                trigger OnAction();
                begin
                    TestTable.Reset;
                    TestTable.DeleteAll;
                    TestTable.Init;
                    TestTable.Insert;
                    IconManagement.CopyPictureToTableUsingStream(TestTable);
                    TestTable.FindFirst;
                    TestBlobPage.SetTableView(TestTable);
                    TestBlobPage.SetRecord(TestTable);
                    TestBlobPage.Run;
                end;
            }
        }
    }
    
    var
        IconManagement : Codeunit IconManagementTest;
        TestTableTemp : Record TestTable temporary;
        TestTable : Record TestTable;
        TestBlobTempPage : Page TestBlobTempPage;
        TestBlobPage : Page TestBlobPage;
}