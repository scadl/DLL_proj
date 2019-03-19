unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
procedure MoveRight(target:TObject; step,refresh_speed,start_point,limit:integer); stdcall; external '../dll/externals.dll';
procedure MoveDown(target:TObject; step,refresh_speed,start_point,limit:integer);  stdcall; external '../dll/externals.dll';

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
MoveRight(Button1, 5, 50, button1.Left, form1.Width-(button1.Width+25));
MoveDown(Button1, 5, 50, button1.Top, form1.Height-(button1.Height+50));
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
showmessage('hello!');
end;

end.
