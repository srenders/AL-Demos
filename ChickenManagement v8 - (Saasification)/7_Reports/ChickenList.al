report 50120 "Chicken List Report"
{
    //DefaultLayout = Word;
    DefaultLayout = RDLC;
    RDLCLayout = '7_Reports/layouts/ChickenList.rdl';
    WordLayout = '7_Reports/layouts/ChickenList.docx';

    dataset
    {
        dataitem(Chicken; Chicken)
        {
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(ChickenTypeCode; "Chicken Type Code")
            {
                IncludeCaption = true;
            }
            column(NoOfEggsOnDocument; "No Of Eggs On Document")
            {
                IncludeCaption = true;
            }
            column(NoOfEggsOnLedger; "No Of Eggs On Ledger")
            {
                IncludeCaption = true;
            }
            column(HideDetails;HideDetails)
            {
                
            }
        }
    }
    
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(HideDetails;HideDetails)
                    {
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                }
            }
        }
    }
    
    labels
    {
        label(mylabel;ENU='test',NLB='testje')
    }
    var
        HideDetails : Boolean;
}