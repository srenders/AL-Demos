pagecustomization MyPageCustomization customizes "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        moveafter("Blanket Orders"; "Aged Accounts Receivable")

        modify(NewSalesBlanketOrder)
        {
            Visible = false;
        }
    }
    
    //Variables, procedures and triggers are not allowed on Page Customizations
}