program prj7Corvos;

uses
  Forms,
  UN7Corvos in 'UN7Corvos.pas' {House},
  UN7Corvos2 in 'UN7Corvos2.pas' {Village},
  UN7Corvos3 in 'UN7Corvos3.pas' {Floresta01};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFloresta01, Floresta01);
  Application.CreateForm(THouse, House);
  Application.CreateForm(TVillage, Village);
  Application.Run;
end.
