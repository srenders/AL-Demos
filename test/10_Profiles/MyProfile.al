profile TheBoss 
{
    Description = 'The Boss';
    RoleCenter = "Business Manager Role Center";
    Customizations = MyCustomization;
}

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
        modify(Name) {
            Visible = false;
        }
    }
}
