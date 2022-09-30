library mydll;
uses Windows;

procedure A2; export;
begin
  MessageBoxA(0, 'title','text',0);
end;

exports A2;

begin
end.
