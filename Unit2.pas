unit Unit2;

interface

uses
  Classes;

type
  TCalculator = class(TThread)
    procedure Init();
  protected
    procedure Execute; override;
  public
    mypi: double;
    i: integer;
  end;

implementation

uses Unit1, sysutils;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TCalculator.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TCalculator }

procedure TCalculator.Execute;
var
old, sl: double;
begin
old := mypi;
repeat
  sl := 4/(3+2*i);
  if i mod 2 = 0 then sl:=sl*-1;
  inc(i);
  mypi:=mypi + sl;
  if Terminated then break;
  if i mod 10001 = 0 then
  Synchronize(form1.Update);
until old=mypi;
end;

procedure TCalculator.Init;
begin
  mypi := 4;
  i:=0;
end;

end.

