unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, pngimage;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtPeso1: TEdit;
    Image1: TImage;
    Label2: TLabel;
    edtPeso2: TEdit;
    Label3: TLabel;
    edtLargura: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnlResultado: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtAy: TEdit;
    edtBy: TEdit;
    Image2: TImage;
    Image3: TImage;
    lblEC1: TLabel;
    lblEC2: TLabel;
    lblEC3: TLabel;
    lblMF1: TLabel;
    lblMF2: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var
  aY,
  bY,
  peso1,
  peso2,
  esfcort1,
  esfcort2,
  esfcort3,
  momento1,
  momento2,
  largura: real;
begin
  try
    peso1   := StrToFloat(edtPeso1.Text);
    peso2   := StrToFloat(edtPeso2.Text);
    largura := StrToFloat(edtLargura.Text);
    bY := ((peso1 * (largura / 3)) +
          (peso2 * (largura * 2 / 3))) / largura;
    aY := (peso1 + peso2) - bY;
    pnlResultado.Visible := true;
    edtAy.Text := FloatToStrF(ay, ffNumber, 5, 2);
    edtBy.Text := FloatToStrF(bY, ffNumber, 5, 2);
    esfcort1 := aY;
    esfcort2 := aY - peso1;
    esfcort3 := -(bY);
    momento1 := (aY * (largura / 3));
    momento2 := (bY * (largura / 3));
    lblEC1.Visible := true;
    lblEC1.Caption := FloatToStrF(esfcort1, ffNumber, 5, 2);
    lblEC2.Visible := true;
    lblEC2.Caption := FloatToStrF(esfcort2, ffNumber, 5, 2);
    lblEC3.Visible := true;
    lblEC3.Caption := FloatToStrF(esfcort3, ffNumber, 5, 2);
    lblMF1.Visible := true;
    lblMF1.Caption := FloatToStrF(momento1, ffNumber, 5, 2);
    lblMF2.Visible := true;
    lblMF2.Caption := FloatToStrF(momento2, ffNumber, 5, 2);
  except
    edtPeso1.SetFocus;
  end;
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  edtPeso1.Clear;
  edtPeso2.Clear;
  edtLargura.Clear;
  pnlResultado.Visible := false;
  lblEC1.Visible := false;
  lblEC2.Visible := false;
  lblEC3.Visible := false;
  lblMF1.Visible := false;
  lblMF2.Visible := false;
  edtPeso1.SetFocus;
end;

procedure TfrmPrincipal.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
