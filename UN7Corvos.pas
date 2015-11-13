unit UN7Corvos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage;

type
  THouse = class(TForm)
    walkTimer: TTimer;
    backGround: TImage;
    housePortal: TImage;
    houseWall1: TImage;
    houseWall10: TImage;
    houseWall11: TImage;
    houseWall12: TImage;
    houseWall13: TImage;
    houseWall14: TImage;
    houseWall15: TImage;
    houseWall16: TImage;
    houseWall17: TImage;
    houseWall18: TImage;
    houseWall19: TImage;
    houseWall2: TImage;
    houseWall20: TImage;
    houseWall3: TImage;
    houseWall4: TImage;
    houseWall5: TImage;
    houseWall6: TImage;
    houseWall7: TImage;
    houseWall8: TImage;
    houseWall9: TImage;
    girl: TImage;
    procedure walkTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function Colide1(Obj1,Obj2:TImage):boolean;
    function Colide2(Obj1,Obj2:TImage):boolean;
    function Colide3(Obj1,Obj2:TImage):boolean;
    function Colide4(Obj1,Obj2:TImage):boolean;
    function Colide5(Obj1,Obj2:TImage):boolean;
    function Colide6(Obj1,Obj2:TImage):boolean;
    function Colide7(Obj1,Obj2:TImage):boolean;
    function Colide8(Obj1,Obj2:TImage):boolean;
    function Colide9(Obj1,Obj2:TImage):boolean;
    function Colide10(Obj1,Obj2:TImage):boolean;
    function Colide11(Obj1,Obj2:TImage):boolean;
    function Colide12(Obj1,Obj2:TImage):boolean;
    function Colide13(Obj1,Obj2:TImage):boolean;
    function Colide14(Obj1,Obj2:TImage):boolean;
    function Colide15(Obj1,Obj2:TImage):boolean;
    function Colide16(Obj1,Obj2:TImage):boolean;
    function Colide17(Obj1,Obj2:TImage):boolean;
    function Colide18(Obj1,Obj2:TImage):boolean;
    function Colide19(Obj1,Obj2:TImage):boolean;
    function Colide20(Obj1,Obj2:TImage):boolean;
    function Portal(Obj1,Obj2:TImage):boolean;

  public
    { Public declarations }
  end;

var
  House: THouse;
  move: string;
  colide: Boolean;

implementation

uses UN7Corvos2, UN7Corvos3;

{$R *.dfm}


procedure THouse.walkTimerTimer(Sender: TObject);
begin
// ###################
// Verificando Colisão
// ###################
Colide1(girl,houseWall1);
Colide2(girl,houseWall2);
Colide3(girl,houseWall3);
Colide4(girl,houseWall4);
Colide5(girl,houseWall5);
Colide6(girl,houseWall6);
Colide7(girl,houseWall7);
Colide8(girl,houseWall8);
Colide9(girl,houseWall9);
Colide10(girl,houseWall10);
Colide11(girl,houseWall11);
Colide12(girl,houseWall12);
Colide13(girl,houseWall13);
Colide14(girl,houseWall14);
Colide15(girl,houseWall15);
Colide16(girl,houseWall16);
Colide17(girl,houseWall17);
Colide18(girl,houseWall18);
Colide19(girl,houseWall19);
Colide20(girl,houseWall20);
Portal(girl,housePortal);
// #########################
//Movimentação do Personagem
// #########################

    if (GetKeyState(vk_up) < 0) then
        begin
            girl.Top := girl.Top - 5;
            girl.Picture.LoadFromFile('animation/character/girl-back.png');
            move := 'up';
        end
    else if (GetKeyState(VK_DOWN) < 0) then
        begin
            girl.Top := girl.Top + 5;
            girl.Picture.LoadFromFile('animation/character/girl-front.png');
            move := 'down';
        end
    else if (GetKeyState(VK_LEFT) < 0) then
        begin
            girl.Left := girl.Left - 5;
            girl.Picture.LoadFromFile('animation/character/girl-left.png');
            move := 'left';
        end
    else if (GetKeyState(VK_RIGHT) < 0) then
        begin
            girl.Left := girl.Left + 5;
            girl.Picture.LoadFromFile('animation/character/girl-right.png');
            move := 'right';
        end;

end;
// ########################
// Inicio Colisão da House
// ########################
function THouse.Portal (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
             if(move='down') then
                begin
                    Village.girl.Left := 192;
                    Village.girl.Top := 256;
                    Village.girl.Picture.LoadFromFile('animation/character/girl-front.png');
                    Village.walkTimer.Enabled := true;
                    Village.Visible := true;
                    Village.Show;
                    House.Hide;
                    House.walkTimer.Enabled := false;
                end
        end;
end;
function THouse.Colide1 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide2 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide3 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide4 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide5 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide6 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide7 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide8 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide9 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide10 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide11 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide12 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide13 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide14 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide15 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide16 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide17 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide18 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide19 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;

function THouse.Colide20 (Obj1:TImage; Obj2:TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height)
          then
          begin

          end
    else
        begin
            if(move='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(move='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(move='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(move='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;
// #####################
// Fim Colisões de House
// #####################
procedure THouse.FormCreate(Sender: TObject);
begin
DoubleBuffered:=true;
end;

procedure THouse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.
