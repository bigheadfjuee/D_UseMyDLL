unit UnitUseDll;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormExe = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExe: TFormExe;

implementation

{$R *.dfm}
// Explicit linking
function MyAdd(i, j: Integer): Integer; stdcall; external 'Delphi_DLL.dll';
function Test1(a, b: Integer): Integer; stdcall; external 'BCB6_DLL.dll';

procedure TFormExe.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add(IntToStr(Test1(33, 22)));
end;

procedure TFormExe.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add(IntToStr(MyAdd(1, 2)));
end;

procedure TFormExe.Button3Click(Sender: TObject);
var
  handle: Thandle;
  MyFunc: function(x, y: Integer): Integer; stdcall;
begin
  // Implicit linking
  handle := LoadLibrary('BCB6_DLL.DLL');
  if handle <> 0 then
  begin
    try
      MyFunc := GetProcAddress(handle, 'Test1');
      Memo1.Lines.Add(IntToStr(MyFunc(1, 3)));
    finally
      FreeLibrary(handle);
    end;
  end;

end;

end.
