page 50111 GetTheNumbers
{
  layout
  {
    area(content)
    {
      group(xx)
      {
        CaptionML=ENU='Enter Text';
        field(Input;Input)
        {
          ApplicationArea = All;
        }
      }
    }
  }

  actions
  {
    area(processing)
    {
      action(ShowNumbers)
      {
        Image=Note;
        Promoted=true;
        PromotedIsBig=true;
        ApplicationArea = All;

        trigger OnAction();
        begin
          CLEAR(Result);

          FOR I:= 1 TO STRLEN(Input) DO
          BEGIN
            temp := COPYSTR(Input,I,1);
            IF temp IN ['0'..'9'] THEN
              Result += temp;
          END;

          MESSAGE(Result);
        end;
      }
    }
  }

  var
    Input : Text;
    I : Integer;
    Result : Text;
    temp : Text;
}

