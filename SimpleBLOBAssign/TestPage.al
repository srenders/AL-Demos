page 50133 TestBlobTempPage
{
    PageType = List;
    SourceTable = TestTable;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(pk;pk)
                {
                }
                field(BlobField;BlobField)
                {
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}

page 50134 TestBlobPage
{
    PageType = List;
    SourceTable = TestTable;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(pk;pk)
                {
                }
                field(BlobField;BlobField)
                {
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}