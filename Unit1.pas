unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    Edit6: TEdit;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  hasil: string;
  a: string;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button4.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := True;

  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Edit3.Enabled := False;
  Edit4.Enabled := False;
  Edit5.Enabled := False;
  ComboBox1.Enabled := False;

  ComboBox1.Items.Add('yes');
  ComboBox1.Items.Add('no');
  ComboBox1.ItemIndex := -1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := False;
  Button4.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := True;

  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  Edit5.Enabled := True;
  ComboBox1.Enabled := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button4.Enabled := False;
  Button5.Enabled := True;
  Button6.Enabled := True;
  
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Edit3.Enabled := False;
  Edit4.Enabled := False;
  Edit5.Enabled := False;
  ComboBox1.Enabled := False;


  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  ComboBox1.ItemIndex := -1;


  Label8.Caption := '';


  ComboBox1.Text := '';
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text = 'yes' then
  begin
    hasil := '10%';
    Label8.Caption := hasil;
  end
  else if ComboBox1.Text = 'no' then
  begin
    Label8.Caption := '5%';
  end
  else
  begin
    Label8.Caption := '';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with DataModule2.tbKustomer do
  begin
    SQL.Clear;
    SQL.Add('insert into kustomer values(null,"' + Edit1.Text + '","' + Edit2.Text + '","' + Edit3.Text + '","' + Edit4.Text + '","' + Edit5.Text + '","' + ComboBox1.Text + '")');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kustomer');
    Open;
  end;
  ShowMessage('Data Berhasil DiSimpan');
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DataModule2.tbKustomer.Fields[1].AsString;
  Edit2.Text := DataModule2.tbKustomer.Fields[2].AsString;
  Edit3.Text := DataModule2.tbKustomer.Fields[3].AsString;
  Edit4.Text := DataModule2.tbKustomer.Fields[4].AsString;
  Edit5.Text := DataModule2.tbKustomer.Fields[5].AsString;
  ComboBox1.Text := DataModule2.tbKustomer.Fields[6].AsString;
  a := DataModule2.tbKustomer.Fields[0].AsString;

  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := True;
  Button4.Enabled := True;
  Button5.Enabled := True;
  Button6.Enabled := True;

  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  Edit5.Enabled := True;
  ComboBox1.Enabled := True;

  if ComboBox1.Text = 'yes' then
  begin
    hasil := '10%';
    Label8.Caption := hasil;
  end
  else if ComboBox1.Text = 'no' then
  begin
    Label8.Caption := '5%';
  end
  else
  begin
    Label8.Caption := '';
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with DataModule2.tbKustomer do
  begin
    SQL.Clear;
    SQL.Add('update kustomer set nik="' + Edit1.Text + '",nama="' + Edit2.Text + '",telp="' + Edit3.Text + '",email="' + Edit4.Text + '",alamat="' + Edit5.Text + '",member="' + ComboBox1.Text + '" where id="' + a + '"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kustomer');
    Open;
  end;
  ShowMessage('Data Berhasil DiEdit');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  with DataModule2.tbKustomer do
  begin
    SQL.Clear;
    SQL.Add('delete from kustomer where id ="' + a + '"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kustomer');
    Open;
  end;
  ShowMessage('Data Berhasil DiHapus');
end;

procedure TForm1.Edit6Change(Sender: TObject);
begin
  with DataModule2.tbKustomer do
  begin
    SQL.Clear;
    SQL.Add('select * from kustomer where nama like "%' + Edit6.Text + '%"');
    Open;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

end.

