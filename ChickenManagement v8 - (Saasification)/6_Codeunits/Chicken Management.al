codeunit 50120 "Chicken Management"
{
  trigger OnRun();
  begin
  end;

  PROCEDURE AddChickenAsResource(Chicken : Record Chicken);
  var
    Resource : Record Resource;
    ErrorAlreadyExists : TextConst ENU='Resource %1 already exists!';
    MsgResourceAdded : TextConst ENU='Chicken %1 has been added as Resource: %2.';
  begin
    WITH Chicken DO BEGIN
      IF NOT Resource.GET(Chicken."No.") THEN BEGIN
        Resource."No."                := Chicken."No.";
        Resource.Name                 := Chicken.Description;
        Resource."Resource Group No." := Chicken."chicken Type Code";
        Resource.INSERT;
        MESSAGE(MsgResourceAdded,Chicken."No.",Resource."No.");
      END
      ELSE
        ERROR(ErrorAlreadyExists,Chicken."No.");
    END;
  end;

  PROCEDURE InitAssistedSetup(AssistedSetupPageID : Integer;DisplayNameOfMyAssistedSetup : Text;StartingIdOfFirstLicensedObject : Integer;LinkToYourOnlineHelp : Text);
  var
    AssistedSetup : Record "Assisted Setup";
  begin
    CLEAR(AssistedSetup);
    WITH AssistedSetup DO BEGIN
      IF GET(AssistedSetupPageID) THEN
        IF ("Assisted Setup Page ID" = 0) AND
           ("Item Type" <> "Item Type"::Group)
        THEN
          DELETE(TRUE)
        ELSE
          EXIT;

      "Page ID" := AssistedSetupPageID;
      "Assisted Setup Page ID" := AssistedSetupPageID;
      Name := DisplayNameOfMyAssistedSetup;
      Order := StartingIdOfFirstLicensedObject;
      Visible := TRUE;
      "Item Type" := "Item Type"::"Setup and Help";
      Parent := 0;
      "Help Url" := COPYSTR(LinkToYourOnlineHelp,1,MAXSTRLEN("Help Url"));
      Status := Status::"Not Started";
      Featured := FALSE;
      INSERT(TRUE);
    END;
  end;

  //[EventSubscriber(ObjectType::Page, PAGE::"Extension Details", 'OnAfterActionEvent', 'Install', false, false)]
  [EventSubscriber(ObjectType::Page, PAGE::"Assisted Setup", 'OnOpenPageEvent', '', false, false)]
  LOCAL PROCEDURE OnBeforeCompanyOpenSubscriber();
  begin
    InitAssistedSetup(50134,'Chicken Setup',50000,'');
    //message('test');
  end;
    
  [EventSubscriber(ObjectType::Page, page::"O365 Activities", 'OnOpenPageEvent', '', false, false)]
  procedure ShowChickenManagementSetupWarningOnBusinessManagerRoleCenter();
  var
    ChickenManagement : codeunit "Chicken Management";
  begin
    //message('test');
    ChickenManagement.ShowChickenManagementSetupWarning;    
  end;
  // [EventSubscriber(ObjectType::Page, page::"Order Processor Role Center", 'OnOpenPageEvent', '', false, false)]
  // procedure ShowChickenManagementSetupWarningOnOrderProcessorRoleCenter();
  // var
  //   ChickenManagement : codeunit "Chicken Management";
  // begin
  //   //message('test');
  //   ChickenManagement.ShowChickenManagementSetupWarning;    
  // end;
  [EventSubscriber(ObjectType::Page, page::"Chicken Activities", 'OnOpenPageEvent', '', false, false)]
  procedure ShowChickenManagementSetupWarningOnChickenList();
  var
    ChickenManagement : codeunit "Chicken Management";
  begin
    ChickenManagement.ShowChickenManagementSetupWarning;    
  end;

  PROCEDURE SetChickenAssistedSetupComplete();
  var
    AssistedSetup : Record "Assisted Setup";
  begin
    AssistedSetup.SetStatus(50134,AssistedSetup.Status::Completed);
  end;
  procedure ShowChickenManagementSetupWarning();
  var
    ChickenSetupOk : Boolean;
    txtChickenSetupNotSetup : TextConst ENU='You need to setup your Chickens.';
    txtChickenSetupChickens : TextConst ENU='Would you like to setup your Chickens?';
    MyNotification : Notification;
    ChickenSetup : Record "Chicken Setup";
  begin
    ChickenSetupOk := ChickenSetup.get;
    IF NOT ChickenSetupOk THEN 
    BEGIN
      MyNotification.MESSAGE(txtChickenSetupNotSetup);
      MyNotification.ADDACTION(txtChickenSetupChickens, CODEUNIT::"Chicken Management", 'SetupMyChickens');
      MyNotification.SEND;
    END;
  end;
  procedure SetupMyChickens(MyNotification : Notification);
  var
    ChickenSetupPage : page "Chicken Setup Wizard";
  begin
    ChickenSetupPage.run;
  end;

  procedure RunChickenQuery();
  var
    ChickensQuery : Query Chickens;
  begin
    if ChickensQuery.Open then
    while ChickensQuery.Read do
    begin
      Message('%1 %2 %3 %4',ChickensQuery.No,ChickensQuery.Description,ChickensQuery.No_Of_Eggs_On_Document,ChickensQuery.Quantity);
    end
  end;
}