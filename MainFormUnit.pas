unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList;

type
  TMainForm = class(TForm)
    edtPrice: TEdit;
    cbbNDS: TComboBox;
    lblPrice: TLabel;
    lblPrice1: TLabel;
    btnCalculate: TButton;
    lblPriceNDS: TLabel;
    edtPriceNDS: TEdit;
    lblPriceWNDS: TLabel;
    edtPriceWNDS: TEdit;
    btnCheck: TButton;
    edtPriceCheck: TEdit;
    lblPriceNDS1: TLabel;
    lblPriceNDS2: TLabel;
    lstActList: TActionList;
    actCalculate: TAction;
    actCheck: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actCalculateExecute(Sender: TObject);
    procedure actCalculateUpdate(Sender: TObject);
    procedure actCheckUpdate(Sender: TObject);
    procedure actCheckExecute(Sender: TObject);
    procedure edtPriceKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  NDS;

{$R *.dfm}

procedure TMainForm.actCalculateExecute(Sender: TObject);
var
  vCorrectedPriceWithNDS, vCorrectedPriceWithoutNDS: double;
  vNDS: Double;
begin
  try
    vNDS := StrToFloat(edtPrice.Text);
  except on E: Exception do
    MessageDlg('Ошибка конвертации числа', mtError, [mbOk], 0);
  end;

  try
    CalcPrices(vNDS, TProcNDS(cbbNDS.ItemIndex), vCorrectedPriceWithNDS, vCorrectedPriceWithoutNDS);
    edtPriceNDS.Text := vCorrectedPriceWithNDS.ToString;
    edtPriceWNDS.Text := vCorrectedPriceWithoutNDS.ToString;
  except on E: Exception do
    MessageDlg('Ошибка вычисления:' + Chr(13) + E.Message, mtError, [mbOk], 0);
  end;
end;

procedure TMainForm.actCalculateUpdate(Sender: TObject);
begin
  actCalculate.Enabled := edtPrice.Text <> '';
end;

procedure TMainForm.actCheckExecute(Sender: TObject);
begin
  edtPriceCheck.Text := (StrToFloat(edtPriceWNDS.Text) * (1 + TProcNDS(cbbNDS.ItemIndex)/100)).ToString;
end;

procedure TMainForm.actCheckUpdate(Sender: TObject);
begin
  actCheck.Enabled := edtPriceWNDS.Text <> '';
end;

procedure TMainForm.edtPriceKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in [#8, '0'..'9', FormatSettings.DecimalSeparator]) then
  begin
    Key := #0;
  end
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := Low(TProcNDS) to High(TProcNDS) do
    cbbNDS.Items.Add(IntToStr(TProcNDS(i)));
  cbbNDS.ItemIndex := 0;
end;

end.
