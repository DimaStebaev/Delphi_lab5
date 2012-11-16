unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2, XPMan;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure update();
  private
    thread: TCalculator;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
edit1.Text := FloatToStr(pi);
edit2.Text := '';
edit3.Text := '0';

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
thread := TCalculator.Create(true);
thread.Init;
thread.FreeOnTerminate:=true;
thread.Resume;

button1.Enabled:= not button1.Enabled;
button2.Enabled:= not button2.Enabled;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//flag := true;
//thread.Suspend;
thread.Terminate;
//thread.Free;


button1.Enabled:= not button1.Enabled;
button2.Enabled:= not button2.Enabled;


end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if button2.Enabled then
  button2.Click;
end;

procedure TForm1.update;
begin

Edit2.Text := floattostr(thread.mypi);
Edit3.Text := inttostr(thread.i);

end;

end.
