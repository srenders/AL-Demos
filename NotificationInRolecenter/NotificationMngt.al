codeunit 50127 MyNotificationMngt
{
    trigger OnRun();
    begin
    end;
    
    [EventSubscriber(ObjectType::Page, page::"SO Processor Activities", 'OnOpenPageEvent', '', false, false)]
    //[EventSubscriber(ObjectType::Page, page::"Business Manager Role Center", 'OnOpenPageEvent', '', false, false)]
    procedure ShowSetupWarningOnBusinessManagerRoleCenter();
    var
        SetupOk : Boolean;
        txtSetupNotReady : TextConst ENU='You need to setup your ....';
        txtSetup : TextConst ENU='Would you like to setup your ...?';
        MyNotification : Notification;
    begin
        SetupOk := false;  //SetupOk := YourSetupTable.GET
        IF NOT SetupOk THEN 
        begin
            MyNotification.MESSAGE(txtSetupNotReady);
            MyNotification.ADDACTION(txtSetup, CODEUNIT::"Setup Management", 'DoSomething');
            MyNotification.SEND;
        end;    
    end;

    [EventSubscriber(ObjectType::Page, page::"Customer List", 'OnOpenPageEvent', '', false, false)]
    procedure ShowSetupWarningOnCustomerList();
    var
        SetupOk : Boolean;
        txtSetupNotReady : TextConst ENU='You need to setup your ....';
        txtSetup : TextConst ENU='Would you like to setup your ...?';
        MyNotification : Notification;
    begin
        SetupOk := false;  //SetupOk := YourSetupTable.GET
        IF NOT SetupOk THEN 
        begin
            MyNotification.MESSAGE(txtSetupNotReady);
            MyNotification.ADDACTION(txtSetup, CODEUNIT::"Setup Management", 'DoSomethingElse');
            MyNotification.SetData('Extra Info','Action baby');
            MyNotification.SEND;
        end;    
    end;

}
