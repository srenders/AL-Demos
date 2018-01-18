codeunit 50103 "Customer Rewards Test" 
{ 
    // [FEATURE] [Customer Rewards] 
    Subtype = Test; 
    TestPermissions = Disabled; 
    var 
        Assert: Codeunit Assert; 
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions"; 
        LibrarySales: Codeunit "Library - Sales"; 
        MockCustomerRewardsExtMgt: Codeunit MockCustomerRewardsExtMgt; 
        ActivatedTxt: TextConst ENU = 'Customer Rewards should be activated'; 
        NotActivatedTxt: TextConst ENU = 'Customer Rewards should not be activated'; 
        BronzeLevelTxt: TextConst ENU = 'BRONZE'; 
        SilverLevelTxt: TextConst ENU = 'SILVER'; 
        GoldLevelTxt: TextConst ENU = 'GOLD'; 
        NoLevelTxt: TextConst ENU = 'NONE'; 
    [Test] 
    procedure TestOnInstallLogic(); 
    var 
        CustomerRewardsExtMgtSetup: Record "Customer Rewards Mgt. Setup"; 
        CustomerRewardsInstallLogic: Codeunit "Customer Rewards Install Logic"; 
    begin 
        // [Scenario] Check default codeunit is specified for handling events on install 
        // [Given] Customer Rewards Mgt. Setup table 
        Initialize; 

        // [When] Install logic is run 
        CustomerRewardsInstallLogic.SetDefaultCustomerRewardsExtMgtCodeunit; 

        // [Then] Default Customer Rewards Ext. Mgt codeunit is specified 
        Assert.AreEqual(1, CustomerRewardsExtMgtSetup.Count, 'CustomerRewardsExtMgtSetup must have exactly one record.'); 
        CustomerRewardsExtMgtSetup.Get; 
        Assert.AreEqual(Codeunit::"Customer Rewards Ext. Mgt.", CustomerRewardsExtMgtSetup."Customer Rewards Ext. Mgt. Codeunit ID", 'Codeunit does not match default'); 
    end; 

    [Test] 
    procedure TestCustomerRewardsWizardTermsPage(); 
    var 
        CustomerRewardsWizardTestPage: TestPage "Customer Rewards Wizard"; 
    begin 
        // [Scenario] Check Terms Page on Wizard 
        // [Given] The Customer Rewards Wizard 
        Initialize; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 

        // [When] The Wizard is opnened 
        CustomerRewardsWizardTestPage.OpenView; 

        // [Then] The terms page and fields behave as expected 
        Assert.IsFalse(CustomerRewardsWizardTestPage.EnableFeature.AsBoolean, 'Enable feature should be unchecked'); 
        Assert.IsFalse(CustomerRewardsWizardTestPage.ActionNext.Visible, 'Next should not be visible'); 
        Assert.IsFalse(CustomerRewardsWizardTestPage.ActionBack.Visible, 'Back should not be visible'); 
        Assert.IsFalse(CustomerRewardsWizardTestPage.ActionFinish.Enabled, 'Finish should be disabled'); 

        CustomerRewardsWizardTestPage.EnableFeature.SetValue(true); 

        Assert.IsTrue(CustomerRewardsWizardTestPage.EnableFeature.AsBoolean, 'Enable feature should be checked'); 
        Assert.IsTrue(CustomerRewardsWizardTestPage.ActionNext.Visible, 'Next should be visible'); 
        Assert.IsFalse(CustomerRewardsWizardTestPage.ActionFinish.Enabled, 'Finish should be disabled'); 

        CustomerRewardsWizardTestPage.Close; 
    end; 

    [Test] 
    procedure TestCustomerRewardsWizardActivationPageErrorsWhenNoActivationCodeEntered(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerRewardsWizardTestPage: TestPage "Customer Rewards Wizard";
    begin 
        // [Scenario] Error message when user tries to activate Customer Rewards without activation code. 
        // [Given] The Customer Rewards Wizard 
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 

        // [When] User invokes activate action without entering activation code 
        OpenCustomerRewardsWizardActivationPage(CustomerRewardsWizardTestPage); 
        Assert.IsTrue(CustomerRewardsWizardTestPage.ActionBack.Visible, 'Back should be visible'); 
        Assert.IsFalse(CustomerRewardsWizardTestPage.ActionFinish.Enabled, 'Finish should be disabled'); 

        // [Then] Error message displayed 
        asserterror CustomerRewardsWizardTestPage.ActionActivate.Invoke; 
        Assert.AreEqual(GETLASTERRORTEXT, 'Activation code cannot be blank.', 'Invalid error message.'); 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
    end; 

    [Test] 
    procedure TestCustomerRewardsWizardActivationPageErrorsWhenShorterActivationCodeEntered(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerRewardsWizardTestPage: TestPage "Customer Rewards Wizard";
    begin 
        // [Scenario] Error message when user tries to activate Customer Rewards with short activation code. 
        // [Given] The Customer Rewards Wizard 
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 

        // [When] User invokes activate action after entering short activation code 
        OpenCustomerRewardsWizardActivationPage(CustomerRewardsWizardTestPage); 
        CustomerRewardsWizardTestPage.Activationcode.SetValue('123456'); 

        // [Then] Error message displayed 
        asserterror CustomerRewardsWizardTestPage.ActionActivate.Invoke; 
        Assert.AreEqual(GETLASTERRORTEXT, 'Activation code must have 14 digits.', 'Invalid error message.'); 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
    end; 

    [Test] 
    procedure TestCustomerRewardsWizardActivationPageErrorsWhenLongerActivationCodeEntered(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerRewardsWizardTestPage: TestPage "Customer Rewards Wizard"; 
    begin 
        // [Scenario] Error message when user tries to activate Customer Rewards with long activation code. 
        // [Given] The Customer Rewards Wizard 
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 

        // [When] User invokes activate action after entering long activation code 
        OpenCustomerRewardsWizardActivationPage(CustomerRewardsWizardTestPage); 
        CustomerRewardsWizardTestPage.Activationcode.SetValue('123456789012345');

        // [Then] Error message displayed 
        asserterror CustomerRewardsWizardTestPage.ActionActivate.Invoke; 
        Assert.AreEqual(GETLASTERRORTEXT, 'Activation code must have 14 digits.', 'Invalid error message.'); 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
    end; 

    [Test] 
    procedure TestCustomerRewardsWizardActivationPageErrorsWhenInvalidActivationCodeEntered(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerRewardsWizardTestPage: TestPage "Customer Rewards Wizard"; 
    begin 
        // [Scenario] Error message when user tries to activate Customer Rewards with invalid activation code. 
        // [Given] The Customer Rewards Wizard 
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
        MockCustomerRewardsExtMgt.MockActivationResponse(false); 

        // [When] User invokes activate action after entering invalid but correct length activation code 
        OpenCustomerRewardsWizardActivationPage(CustomerRewardsWizardTestPage); 
        CustomerRewardsWizardTestPage.Activationcode.SetValue('12345678901234'); 

        // [Then] Error message displayed 
        asserterror CustomerRewardsWizardTestPage.ActionActivate.Invoke; 
        Assert.AreEqual(GETLASTERRORTEXT, 'Activation failed. Please check the activtion code you entered.', 'Invalid error message.'); 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
    end; 

    [Test] 
    procedure TestCustomerRewardsWizardActivationPageDoesNotErrorWhenValidActivationCodeEntered(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerRewardsWizardTestPage: TestPage "Customer Rewards Wizard"; 
    begin 
        // [Scenario] Customer Rewards is activate when user enters valid activation code. 
        // [Given] The Customer Rewards Wizard 
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
        MockCustomerRewardsExtMgt.MockActivationResponse(true); 

        // [When] User invokes activate action after entering valid activation code 
        OpenCustomerRewardsWizardActivationPage(CustomerRewardsWizardTestPage); 
        CustomerRewardsWizardTestPage.Activationcode.SetValue('12345678901234'); 
        CustomerRewardsWizardTestPage.ActionActivate.Invoke; 
        CustomerRewardsWizardTestPage.Close; 

        // [Then] Customer Rewards is activated 
        Assert.IsTrue(CustomerRewardsExtMgt.IsCustomerRewardsActivated, ActivatedTxt); 
    end; 

    [Test] 
    procedure TestRewardsLevelListPageDoesNotOpenWhenNotActivated(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        RewardLevelListTestPage: TestPage "Rewards Level List"; 
    begin 
        // [Scenario] Error opening Reward Level Page when Customer Rewards is not activated 
        // [Given] Unactivated Customer Rewards  
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 

        // [When] User opens Reward Level Page 
        // [Then] Error message    
        asserterror RewardLevelListTestPage.OpenView; 
        Assert.AreEqual(GETLASTERRORTEXT, 'Customer Rewards is not activated', 'Invalid error message.');
    end; 

    [Test] 
    procedure TestRewardsLevelListPageOpensWhenActivated(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        RewardLevelListTestPage: TestPage "Rewards Level List"; 
    begin 
        // [Scenario] Reward Level Page opens when Customer Rewards is activated 
        // [Given] Activated Customer Rewards  
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
        ActivateCustomerRewards; 
        Assert.IsTrue(CustomerRewardsExtMgt.IsCustomerRewardsActivated, ActivatedTxt); 

        // [When] User opens Reward Level Page 
        // [Then] No error 
        RewardLevelListTestPage.OpenView; 
    end; 

    [Test] 
    procedure TestRewardLevelsActionExistsOnCustomerListPage(); 
    var 
        CustomerListTestPage: TestPage "Customer List"; 
    begin 
        // [Scenario] Reward Level action exists on customer list page 
        // [Given] Customer List Page  
        CustomerListTestPage.OpenView; 
        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        // [Then] Reward levels action exists on custome list page 
        Assert.IsTrue(CustomerListTestPage."Reward Levels".Visible, 'Reward Levels action should be visible'); 
    end; 

    [Test] 
    [HandlerFunctions('CustomerRewardsWizardModalPageHandler')] 
    procedure TestRewardLevelsActionOnCustomerListPageOpensCustomerRewardsWizardWhenNotActivated(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerListTestPage: TestPage "Customer List"; 
    begin 
        // [Scenario] Reward Levels Action Opens Customer Rewards Wizard When Not Activated 
        // [Given] Unactivated Customer Rewards 
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 

        // [When] User opens Customer List page and invokes action 
        CustomerListTestPage.OpenView; 
        CustomerListTestPage."Reward Levels".Invoke; 

        // [Then] Wizard opens. Caught by CustomerRewardsWizardModalPageHandler 
    end; 

    [Test] 
    [HandlerFunctions('RewardsLevelListlPageHandler')] 
    procedure TestRewardLevelsActionOnCustomerListPageOpensRewardsLevelListPageWhenActivated(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerListTestPage: TestPage "Customer List";
    begin 
        // [Scenario] Reward Levels Action Opens Reward Level Page When Activated 
        // [Given] Activated Customer Rewards 

        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        Assert.IsFalse(CustomerRewardsExtMgt.IsCustomerRewardsActivated, NotActivatedTxt); 
        ActivateCustomerRewards; 
        Assert.IsTrue(CustomerRewardsExtMgt.IsCustomerRewardsActivated, ActivatedTxt); 

        // [When] User opens Customer List page and invokes action 
        CustomerListTestPage.OpenView; 
        CustomerListTestPage."Reward Levels".Invoke;

        // [Then] Wizard opens. Caught by RewardsLevelListlPageHandler 
    end; 

    [Test] 
    procedure TestCustomerCardPageHasRewardsFields();
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerCardTestPage: TestPage "Customer Card"; 
    begin 
        // [Scenario] Customer Card Page Has Reward Fields When Opened 
        // [Given] Customer Card Page 
        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 

        // [When] Customer card page is opened 
        CustomerCardTestPage.OpenView; 

        // [Then] Reward fiels are exist 
        Assert.IsTrue(CustomerCardTestPage.RewardLevel.Visible, 'Reward Level should be visible');
        Assert.IsFalse(CustomerCardTestPage.RewardLevel.Editable, 'Reward Level should not be editable'); 
        Assert.IsTrue(CustomerCardTestPage.RewardPoints.Visible, 'Reward Points should be visible'); 
        Assert.IsFalse(CustomerCardTestPage.RewardPoints.Editable, 'Reward Points should not be editable'); 
    end; 

    [Test] 
    procedure TestNewCustomerHasZeroRewardPointsAndNoRewardLevel(); 
    var 
        Customer: Record Customer; 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerCardTestPage: TestPage "Customer Card"; 
    begin 
        // [Scenario] A new customer Has Zero Reward Points And No Reward Level 
        // [Given] Activated Customer Rewards 

        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        ActivateCustomerRewards; 

        // [When] New Customer 
        LibrarySales.CreateCustomer(Customer); 
        CustomerCardTestPage.OpenView; 
        CustomerCardTestPage.GoToRecord(Customer); 

        // [Then] No Reward level 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, NoLevelTxt); 

        // [Then] Reward Point is zero 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 0); 
    end; 

    [Test] 
    procedure TestCustomerHasCorrectRewardPointsAfterPostedSalesOrders();
    var 
        Customer: Record Customer; 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerCardTestPage: TestPage "Customer Card"; 
    begin 
        // [Scenario] Customer Has Correct Reward Points After 4 Posted Sales Orders 
        // [Given] Activated Customer Rewards and Customer         

        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        ActivateCustomerRewards; 

        // New Customer 
        LibrarySales.CreateCustomer(Customer); 

        // [When] 4 Sales Orders 
        CreateAndPostSalesOrder(Customer."No."); 
        CreateAndPostSalesOrder(Customer."No."); 
        CreateAndPostSalesOrder(Customer."No."); 
        CreateAndPostSalesOrder(Customer."No."); 

        // [Then] Customer has 4 reward points 
        CustomerCardTestPage.OpenView; 
        CustomerCardTestPage.GoToRecord(Customer); 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 4); 
    end; 

    [Test] 
    procedure TestCustomerHasNoRewardLevelAfterPostedSalesOrders(); 
    var 
        Customer: Record Customer; 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerCardTestPage: TestPage "Customer Card"; 
    begin 
        // [Scenario] Customer Has 1 Reward Point and No Reward Level After 1 Posted Sales Orders 
        // [Scenario] Because Lowest Level requires at least 2 points 
        // [Given] Activated Customer Rewards,  Customer, Bronze level for 2 points and above 

        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        ActivateCustomerRewards; 
        AddRewardLevel(BronzeLevelTxt, 2); // 2 points required for BRONZE level 

        // New Customer 
        LibrarySales.CreateCustomer(Customer); 
        CustomerCardTestPage.OpenView; 
        CustomerCardTestPage.GoToRecord(Customer); 

        // Verify 0 points and no reward level before sales order 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 0); 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, NoLevelTxt); 

        // [When] 1 Sales Order 
        CreateAndPostSalesOrder(Customer."No."); 

        // [Then] Customer has 1 points and no reward level after sales order 
        CustomerCardTestPage.GoToRecord(Customer); 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 1); 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, NoLevelTxt); 
    end; 

    [Test] 
    procedure TestCustomerHasBronzeRewardLevelAfterPostedSalesOrders(); 
    var 
        Customer: Record Customer; 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerCardTestPage: TestPage "Customer Card"; 
    begin 
        // [Scenario] Customer Has 2 Reward Points and Bronze Reward Level After 2 Posted Sales Orders 
        // [Scenario] Because Bronze Level requires at least 2 points 
        // [Given] Activated Customer Rewards,  Customer, Bronze level for 2 points and above 

        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        ActivateCustomerRewards; 
        AddRewardLevel(BronzeLevelTxt, 2); // 2 points required for BRONZE level 

        // New Customer 
        LibrarySales.CreateCustomer(Customer); 

        // [When] 2 Sales Order 
        CreateAndPostSalesOrder(Customer."No."); 
        CreateAndPostSalesOrder(Customer."No."); 

        // [Then] Customer has 2 points and bronze reward level  
        CustomerCardTestPage.OpenView; 
        CustomerCardTestPage.GoToRecord(Customer); 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 2); 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, BronzeLevelTxt); 
    end; 

    [Test] 
    procedure TestCustomerHasSilverRewardLevelAfterPostedSalesOrders(); 
    var 
        Customer: Record Customer; 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerCardTestPage: TestPage "Customer Card"; 
    begin 
        // [Scenario] Customer Has 3 Reward Points and Silver Reward Level After 3 Posted Sales Orders 
        // [Scenario] Because Silver Level requires at least 3 points 
        // [Given] Activated Customer Rewards,  Customer, Bronze level from 2 points, Silver level from 3 points 
        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        ActivateCustomerRewards; 
        AddRewardLevel(BronzeLevelTxt, 2); // 2 points required for BRONZE level 
        AddRewardLevel(SilverLevelTxt, 3); // 3 points required for SILVER level 

        // New Customer 
        LibrarySales.CreateCustomer(Customer); 

        // 2 Sales Order 
        CreateAndPostSalesOrder(Customer."No."); 
        CreateAndPostSalesOrder(Customer."No."); 

        // Verify 2 points and bronze reward level 
        CustomerCardTestPage.OpenView; 
        CustomerCardTestPage.GoToRecord(Customer); 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 2); 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, BronzeLevelTxt); 

        // [When] 3rd Sales Order 
        CreateAndPostSalesOrder(Customer."No."); 

        // [Then] Customer has 3 points and silver reward level  
        CustomerCardTestPage.GoToRecord(Customer); 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 3); 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, SilverLevelTxt); 
    end; 

    [Test] 
    procedure TestCustomerHasGoldRewardLevelAfterPostedSalesOrders(); 
    var 
        Customer: Record Customer; 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        CustomerCardTestPage: TestPage "Customer Card"; 
    begin 
        // [Scenario] Customer Has 4 Reward Points and Gold Reward Level After 4 Posted Sales Orders 
        // [Scenario] Because Gold Level requires at least 4 points 
        // [Given] Activated Customer Rewards,  Customer 
        // [Given] Bronze level from 2 points, Silver level from 3 points, Gold level from 4 points       

        Initialize; 
        Commit; 

        // Using permissions that do not inlcude SUPER 
        LibraryLowerPermissions.SetO365BusFull; 
        ActivateCustomerRewards; 

        AddRewardLevel(BronzeLevelTxt, 2); // 2 points required for BRONZE level 
        AddRewardLevel(SilverLevelTxt, 3); // 3 points required for SILVER level 
        AddRewardLevel(GoldLevelTxt, 4); // 4 points required for GOLD level 

        // New Customer 
        LibrarySales.CreateCustomer(Customer); 

        // 3 Sales Order 
        CreateAndPostSalesOrder(Customer."No."); 
        CreateAndPostSalesOrder(Customer."No."); 
        CreateAndPostSalesOrder(Customer."No."); 

        // Verify 3 points and silver reward level  
        CustomerCardTestPage.OpenView; 
        CustomerCardTestPage.GoToRecord(Customer); 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 3); 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, SilverLevelTxt); 

        // [When] 4th Sales Order 
        CreateAndPostSalesOrder(Customer."No."); 

        // [Then] Customer has 4 points and gold reward level 
        CustomerCardTestPage.GoToRecord(Customer); 
        VerifyCustomerRewardPoints(CustomerCardTestPage.RewardPoints.AsInteger, 4); 
        VerifyCustomerRewardLevel(CustomerCardTestPage.RewardLevel.Value, GoldLevelTxt); 
    end; 

    local procedure OpenCustomerRewardsWizardActivationPage(VAR CustomerRewardsWizardTestPage: TestPage "Customer Rewards Wizard");
    begin 
        CustomerRewardsWizardTestPage.OpenView; 
        CustomerRewardsWizardTestPage.EnableFeature.SetValue(true); 
        CustomerRewardsWizardTestPage.ActionNext.Invoke; 
    end; 

    local procedure Initialize();
    var 
        ActivationCodeInfo: Record "Activation Code Information"; 
        RewardLevel: Record "Reward Level"; 
        Customer: Record Customer; 
    begin 
        Customer.ModifyAll(RewardPoints, 0); 
        ActivationCodeInfo.DeleteAll; 
        RewardLevel.DeleteAll; 
        UnbindSubscription(MockCustomerRewardsExtMgt); 
        BindSubscription(MockCustomerRewardsExtMgt); 
        MockCustomerRewardsExtMgt.Setup; 
    end; 



    local procedure ActivateCustomerRewards(); 
    var 
        ActivationCodeInfo: Record "Activation Code Information"; 
    begin 
        ActivationCodeInfo.Init; 
        ActivationCodeInfo.ActivationCode := '12345678901234'; 
        ActivationCodeInfo."Date Activated" := Today; 
        ActivationCodeInfo."Expiration Date" := CALCDATE('<1Y>', Today); 
        ActivationCodeInfo.Insert; 
    end; 

    local procedure CreateAndPostSalesOrder(SellToCustomerNo: Code[20]); 
    var 
        SalesHeader: Record "Sales Header"; 
        SalesLine: Record "Sales Line"; 
        LibraryRandom: Codeunit "Library - Random"; 
        SalesOrderTestPage: TestPage "Sales Order"; 
    begin 

        LibrarySales.CreateSalesHeader(SalesHeader, SalesHeader."Document Type"::Order, SellToCustomerNo); 
        LibrarySales.CreateSalesLine(SalesLine, SalesHeader, SalesLine.Type::Item, '', 1); 
        SalesLine.VALIDATE("Unit Price", LibraryRandom.RandIntInRange(5000, 10000)); 
        SalesLine.MODIFY(TRUE); 
        LibrarySales.PostSalesDocument(SalesHeader, true, true); 
    end; 

    local procedure AddRewardLevel(Level: Text; MinPoints: Integer); 
    var 
        RewardLevel: Record "Reward Level"; 
    begin 
        if RewardLevel.Get(Level) then begin 
            RewardLevel."Minimum Reward Points" := MinPoints; 
            RewardLevel.Modify; 
        end else begin 
            RewardLevel.Init; 
            RewardLevel.Level := Level; 
            RewardLevel."Minimum Reward Points" := MinPoints; 
            RewardLevel.Insert; 
        end; 
    end;

    local procedure VerifyCustomerRewardLevel(ExpectedLevel: Text; ActualLevel: Text);
    begin
        Assert.AreEqual(ExpectedLevel, ActualLevel, 'Reward Level should be the same.');
    end;

    local procedure VerifyCustomerRewardPoints(ExpectedPoints: Integer; ActualPoints: Integer);
    begin
        Assert.AreEqual(ExpectedPoints, ActualPoints, 'Reward Points should be the same.');
    end;

    [ModalPageHandler]
    procedure CustomerRewardsWizardModalPageHandler(var CustomerRewardsWizard: TestPage "Customer Rewards Wizard");
    begin
    end;

    [PageHandler]
    procedure RewardsLevelListlPageHandler(var RewardsLevelList: TestPage "Rewards Level List");
    begin
    end;

}