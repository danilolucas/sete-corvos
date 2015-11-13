unit UN7Corvos2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage;

type
  TVillage = class(TForm)
    backGround: TImage;
    girl: TImage;
    villagePortal: TImage;
    walkTimer: TTimer;
    villageWall1: TImage;
    villageWall2: TImage;
    villageWall3: TImage;
    villageWall4: TImage;
    villageWall5: TImage;
    villageWall6: TImage;
    villageWall7: TImage;
    villageWall8: TImage;
    villageWall9: TImage;
    villageWall10: TImage;
    villageWall11: TImage;
    villageWall12: TImage;
    villageWall13: TImage;
    villageWall14: TImage;
    villageWall16: TImage;
    villageWall17: TImage;
    villageWall18: TImage;
    villageWall21: TImage;
    villageWall24: TImage;
    villageWall22: TImage;
    villageWall23: TImage;
    villageWall25: TImage;
    villageWall26: TImage;
    villageWall27: TImage;
    villageWall28: TImage;
    villageWall29: TImage;
    villageWall15: TImage;
    villageWall19: TImage;
    villagePortal2: TImage;
    villageWall20: TImage;
    smoke: TImage;
    smokeTimer: TTimer;
    procedure walkTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure smokeTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    function Colide21(Obj1,Obj2:TImage):boolean;
    function Colide22(Obj1,Obj2:TImage):boolean;
    function Colide23(Obj1,Obj2:TImage):boolean;
    function Colide24(Obj1,Obj2:TImage):boolean;
    function Colide25(Obj1,Obj2:TImage):boolean;
    function Colide26(Obj1,Obj2:TImage):boolean;
    function Colide27(Obj1,Obj2:TImage):boolean;
    function Colide28(Obj1,Obj2:TImage):boolean;
    function Colide29(Obj1,Obj2:TImage):boolean;
    function PortalHouse(Obj1,Obj2:TImage):boolean;
    function PortalFloresta01(Obj1,Obj2:TImage):boolean;
  public
    { Public declarations }
  end;

var
  Village: TVillage;
  move: string;
  smokeInd: string = '1';

implementation

uses UN7Corvos, UN7Corvos3;

{$R *.dfm}

procedure TVillage.smokeTimerTimer(Sender: TObject);
begin
// #############
// Gif da Fumaça
// #############
    if (smokeInd = '1') then
        begin
            smoke.Picture.LoadFromFile('animation/smoke/smoke2.png');
            smokeInd := '2';
        end
    else if (smokeInd = '2') then
        begin
            smoke.Picture.LoadFromFile('animation/smoke/smoke3.png');
            smokeInd := '3';
        end
    else if (smokeInd = '3') then
        begin
            smoke.Picture.LoadFromFile('animation/smoke/smoke.png');
            smokeInd := '1';
        end;
end;

procedure TVillage.walkTimerTimer(Sender: TObject);
begin
// ###################
// Verificando Colisão
// ###################
Colide1(girl,villageWall1);
Colide2(girl,villageWall2);
Colide3(girl,villageWall3);
Colide4(girl,villageWall4);
Colide5(girl,villageWall5);
Colide6(girl,villageWall6);
Colide7(girl,villageWall7);
Colide8(girl,villageWall8);
Colide9(girl,villageWall9);
Colide10(girl,villageWall10);
Colide11(girl,villageWall11);
Colide12(girl,villageWall12);
Colide13(girl,villageWall13);
Colide14(girl,villageWall14);
Colide15(girl,villageWall15);
Colide16(girl,villageWall16);
Colide17(girl,villageWall17);
Colide18(girl,villageWall18);
Colide19(girl,villageWall19);
Colide20(girl,villageWall20);
Colide21(girl,villageWall21);
Colide22(girl,villageWall22);
Colide23(girl,villageWall23);
Colide24(girl,villageWall24);
Colide25(girl,villageWall25);
Colide26(girl,villageWall26);
Colide27(girl,villageWall27);
Colide28(girl,villageWall28);
Colide29(girl,villageWall29);
PortalHouse(girl,villagePortal);
PortalFloresta01(girl,villagePortal2);
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

function TVillage.PortalHouse (Obj1:TImage; Obj2:TImage):boolean;
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
             if(move='up') then
                begin
                    House.girl.Left := 664;
                    house.girl.Top := 416;
                    House.girl.Picture.LoadFromFile('animation/character/girl-back.png');
                    Village.walkTimer.Enabled := false;
                    House.Show;
                    Village.Hide;
                    House.walkTimer.Enabled := true;
                end
        end;
end;

function TVillage.PortalFloresta01 (Obj1:TImage; Obj2:TImage):boolean;
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
             if(move='right') then
                begin
                    Floresta01.girl.Left := 72;
                    Floresta01.girl.Top := 192;
                    Floresta01.girl.Picture.LoadFromFile('animation/character/girl-right.png');
                    Village.walkTimer.Enabled := false;
                    Floresta01.Show;
                    Village.Hide;
                    Floresta01.monster1Walk.Enabled := true;
                    Floresta01.monster2Walk.Enabled := true;
                    Floresta01.monster3Walk.Enabled := true;
                    Floresta01.monster4Walk.Enabled := true;
                    Floresta01.monster5Walk.Enabled := true;
                    Floresta01.monster6Walk.Enabled := true;
                    Floresta01.monster7Walk.Enabled := true;
                    Floresta01.monster8Walk.Enabled := true;
                    Floresta01.monster9Walk.Enabled := true;
                    Floresta01.monster10Walk.Enabled := true;
                    Floresta01.walkTimer.Enabled := true;
                end
        end;
end;
// ###########################
// Inicio Colisões de Village
// ###########################
function TVillage.Colide1 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide2 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide3 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide4 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide5 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide6 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide7 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide8 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide9 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide10 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide11 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide12 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide13 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide14 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide15 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide16 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide17 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide18 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide19 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide20 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide21 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide22 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide23 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide24 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide25 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide26 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide27 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide28 (Obj1:TImage; Obj2:TImage):boolean;
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

function TVillage.Colide29 (Obj1:TImage; Obj2:TImage):boolean;
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
// #######################
// Fim Colisões de Village
// #######################
procedure TVillage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;



procedure TVillage.FormCreate(Sender: TObject);
begin
DoubleBuffered:=true;
//Floresta01.walkTimer.Enabled:=false;
Floresta01.monster1Walk.Enabled := false;
Floresta01.monster2Walk.Enabled := false;
Floresta01.monster3Walk.Enabled := false;
Floresta01.monster4Walk.Enabled := false;
Floresta01.monster5Walk.Enabled := false;
Floresta01.monster6Walk.Enabled := false;
Floresta01.monster7Walk.Enabled := false;
Floresta01.monster8Walk.Enabled := false;
Floresta01.monster9Walk.Enabled := false;
//Floresta01.monster10Walk.Enabled := false;
end;

end.
