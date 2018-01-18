codeunit 50140 MyAzureCodeunit
{
    trigger OnRun();
    begin
    end;
    procedure RunMyAzureFunction();
    var
        myURI : TextBuilder;
        myHttpClient : HttpClient;
        myHttpRequestMessage : HttpRequestMessage;
        myHttpResponseMessage : HttpResponseMessage;
        MyHttpContent : HttpContent;
        MyText : Text;
    begin
        myURI.Append('https://myfunctionappsre1.azurewebsites.net/api/HttpTriggerJS1'); 
        myuri.Append('?name=Steven');
        myHttpClient.Get(myURI.ToText,myHttpResponseMessage);
        myHttpContent := myHttpResponseMessage.Content();
        MyHttpContent.ReadAs(MyText);
        Message('%1',MyText);
        //Message('%1',myHttpResponseMessage.HttpStatusCode);
    end;
    var
        myInt : Integer;
}