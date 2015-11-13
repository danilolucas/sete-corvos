unit UN7Corvos3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls;

type
  TFloresta01 = class(TForm)
    backGround: TImage;
    florestWall1: TImage;
    florestWall12: TImage;
    florestWall23: TImage;
    florestWall27: TImage;
    florestWall28: TImage;
    florestWall29: TImage;
    florestWall30: TImage;
    florestWall31: TImage;
    florestWall32: TImage;
    florestWall2: TImage;
    florestWall3: TImage;
    florestWall4: TImage;
    florestWall5: TImage;
    florestWall6: TImage;
    florestWall7: TImage;
    florestWall8: TImage;
    florestWall9: TImage;
    florestWall10: TImage;
    florestWall11: TImage;
    florestWall13: TImage;
    florestWall14: TImage;
    florestWall15: TImage;
    florestWall16: TImage;
    florestWall17: TImage;
    florestWall18: TImage;
    florestWall19: TImage;
    florestWall20: TImage;
    florestWall21: TImage;
    florestWall22: TImage;
    florestWall24: TImage;
    florestWall25: TImage;
    florestWall26: TImage;
    florestPortal: TImage;
    walkTimer: TTimer;
    florestMonster1: TImage;
    florestMonster2: TImage;
    florestMonster3: TImage;
    florestMonster4: TImage;
    florestMonster5: TImage;
    florestMonster6: TImage;
    florestMonster7: TImage;
    florestMonster8: TImage;
    florestMonster9: TImage;
    florestMonster10: TImage;
    monster1Walk: TTimer;
    monster2Walk: TTimer;
    monster3Walk: TTimer;
    monster4Walk: TTimer;
    monster5Walk: TTimer;
    monster6Walk: TTimer;
    monster7Walk: TTimer;
    monster8Walk: TTimer;
    monster9Walk: TTimer;
    monster10Walk: TTimer;
    girl: TImage;
    attackEffect: TImage;
    attackTimer: TTimer;
    hurtEffect10: TTimer;
    monster10Attacking: TTimer;
    procedure walkTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure monster10WalkTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure attackTimerTimer(Sender: TObject);
    procedure hurtEffect10Timer(Sender: TObject);
    procedure monster10AttackingTimer(Sender: TObject);
//    procedure monster10AttackingEffectTimer(Sender: TObject);
  private
    { Private declarations }
    function Colide(Obj1,Obj2:TImage):boolean;
    function PortalVillage(Obj1,Obj2:TImage):boolean;
    function colideMonster10 (Obj1:TImage; Obj2:TImage):boolean;
    function effectOfAttack():boolean;
    function colideOnAttack10 (Obj1:TImage; Obj2:TImage):boolean;
  public
    { Public declarations }
  end;

var
  Floresta01: TFloresta01;
  move: string;
  moveMonster1: string;
  moveMonster2: string;
  moveMonster3: string;
  moveMonster4: string;
  moveMonster5: string;
  moveMonster6: string;
  moveMonster7: string;
  moveMonster8: string;
  moveMonster9: string;
  moveMonster10: string;
  iNum: Integer;
  onAttack: string;
  effectAttack: string = '1';
  monster10Hurt: string = '0';
  onAttack10: boolean = false;
  attacking10: boolean = false;
  monster10AtkEffect: string = '0';
  canWalk10: boolean = true;
  canAtkEffect10: boolean = false;
  colideYes: boolean = false;

implementation

uses UN7Corvos2;

{$R *.dfm}

procedure TFloresta01.FormCreate(Sender: TObject);
begin
DoubleBuffered:=true;
end;

procedure TFloresta01.walkTimerTimer(Sender: TObject);
begin
// ###################
// Verificando Colisão
// ###################
Colide(girl,florestWall1);
Colide(girl,florestWall2);
Colide(girl,florestWall3);
Colide(girl,florestWall4);
Colide(girl,florestWall5);
Colide(girl,florestWall6);
Colide(girl,florestWall7);
Colide(girl,florestWall8);
Colide(girl,florestWall9);
Colide(girl,florestWall10);
Colide(girl,florestWall11);
Colide(girl,florestWall12);
Colide(girl,florestWall13);
Colide(girl,florestWall14);
Colide(girl,florestWall15);
Colide(girl,florestWall16);
Colide(girl,florestWall17);
Colide(girl,florestWall18);
Colide(girl,florestWall19);
Colide(girl,florestWall20);
Colide(girl,florestWall21);
Colide(girl,florestWall22);
Colide(girl,florestWall23);
Colide(girl,florestWall24);
Colide(girl,florestWall25);
Colide(girl,florestWall26);
Colide(girl,florestWall27);
Colide(girl,florestWall28);
Colide(girl,florestWall29);
Colide(girl,florestWall30);
Colide(girl,florestWall31);
Colide(girl,florestWall32);
PortalVillage(girl,florestPortal);
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

function TFloresta01.PortalVillage (Obj1:TImage; Obj2:TImage):boolean;
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
             if(move='left') then
                begin
                    Village.girl.Left := 864;
                    Village.girl.Top := 176;
                    Village.girl.Picture.LoadFromFile('animation/character/girl-back.png');
                    Floresta01.walkTimer.Enabled := false;
                    Floresta01.monster1Walk.Enabled := false;
                    Floresta01.monster2Walk.Enabled := false;
                    Floresta01.monster3Walk.Enabled := false;
                    Floresta01.monster4Walk.Enabled := false;
                    Floresta01.monster5Walk.Enabled := false;
                    Floresta01.monster6Walk.Enabled := false;
                    Floresta01.monster7Walk.Enabled := false;
                    Floresta01.monster8Walk.Enabled := false;
                    Floresta01.monster9Walk.Enabled := false;
                    Floresta01.monster10Walk.Enabled := false;
                    Village.Show;
                    Floresta01.Hide;
                    Village.walkTimer.Enabled := true;
                end
        end;
end;

// ###########################
// Inicio Colisões de Floresta
// ###########################
function TFloresta01.Colide (Obj1:TImage; Obj2:TImage):boolean;
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

function TFloresta01.colideMonster10 (Obj1:TImage; Obj2:TImage):boolean;
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
            if(moveMonster10='up')
                then
                    Obj1.Top:=Obj1.Top+5;
            if(moveMonster10='down')
                then
                    Obj1.Top:=Obj1.Top-5;
            if(moveMonster10='right')
                then
                    Obj1.Left:=Obj1.Left-5;
            if(moveMonster10='left')
                then
                    Obj1.Left:=Obj1.Left+5;
              end;
end;
// #######################
// Fim Colisões de floresta
// #######################

procedure TFloresta01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

function TFloresta01.effectOfAttack():boolean;
begin
    if (move = 'up') then
        begin
            attackTimer.Enabled := true;
            attackEffect.Left:=girl.Left+4;
            attackEffect.Top:=girl.Top-24;
            girl.Picture.LoadFromFile('animation/character/girl-attack-back.png');

            if (effectAttack='1') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword1.png');
                effectAttack:='2';
            end

            else if (effectAttack='2') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword2.png');
                effectAttack:='3';
            end

            else if (effectAttack='3') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword3.png');
                effectAttack:='4';
            end

            else if (effectAttack='4') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword4.png');
                effectAttack:='5';
            end

            else if (effectAttack='5') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword5.png');
                effectAttack:='6';
            end

            else if (effectAttack='6') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword6.png');
                effectAttack:='0';
            end
            else if (effectAttack='0') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword0.png');
                effectAttack:='1';
                girl.Picture.LoadFromFile('animation/character/girl-back.png');
                attackTimer.Enabled := false;
            end;
        end;
     if (move = 'down') then
        begin
            attackTimer.Enabled := true;
            attackEffect.Left:=girl.Left+4;
            attackEffect.Top:=girl.Top+32;
            girl.Picture.LoadFromFile('animation/character/girl-attack-front.png');

            if (effectAttack='1') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword1.png');
                effectAttack:='2';
            end

            else if (effectAttack='2') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword2.png');
                effectAttack:='3';
            end

            else if (effectAttack='3') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword3.png');
                effectAttack:='4';
            end

            else if (effectAttack='4') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword4.png');
                effectAttack:='5';
            end

            else if (effectAttack='5') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword5.png');
                effectAttack:='6';
            end

            else if (effectAttack='6') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword6.png');
                effectAttack:='0';
            end
            else if (effectAttack='0') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword0.png');
                effectAttack:='1';
                girl.Picture.LoadFromFile('animation/character/girl-front.png');
                attackTimer.Enabled := false;
            end;
        end;
     if (move = 'left') then
        begin
            attackTimer.Enabled := true;
            attackEffect.Left:=girl.Left-24;
            attackEffect.Top:=girl.Top+4;
            girl.Picture.LoadFromFile('animation/character/girl-attack-left.png');

            if (effectAttack='1') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword1-left.png');
                effectAttack:='2';
            end

            else if (effectAttack='2') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword2-left.png');
                effectAttack:='3';
            end

            else if (effectAttack='3') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword3-left.png');
                effectAttack:='4';
            end

            else if (effectAttack='4') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword4-left.png');
                effectAttack:='5';
            end

            else if (effectAttack='5') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword5-left.png');
                effectAttack:='6';
            end

            else if (effectAttack='6') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword6-left.png');
                effectAttack:='0';
            end
            else if (effectAttack='0') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword0.png');
                effectAttack:='1';
                girl.Picture.LoadFromFile('animation/character/girl-left.png');
                attackTimer.Enabled := false;
            end;
        end;
     if (move = 'right') then
        begin
            attackTimer.Enabled := true;
            attackEffect.Left:=girl.Left+32;
            attackEffect.Top:=girl.Top+4;
            girl.Picture.LoadFromFile('animation/character/girl-attack-right.png');

            if (effectAttack='1') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword1.png');
                effectAttack:='2';
            end

            else if (effectAttack='2') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword2.png');
                effectAttack:='3';
            end

            else if (effectAttack='3') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword3.png');
                effectAttack:='4';
            end

            else if (effectAttack='4') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword4.png');
                effectAttack:='5';
            end

            else if (effectAttack='5') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword5.png');
                effectAttack:='6';
            end

            else if (effectAttack='6') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword6.png');
                effectAttack:='0';
            end
            else if (effectAttack='0') then
            begin
                attackEffect.Picture.LoadFromFile('animation/attacking/sword/sword0.png');
                effectAttack:='1';
                girl.Picture.LoadFromFile('animation/character/girl-right.png');
                attackTimer.Enabled := false;
            end;
        end;
end;

procedure TFloresta01.monster10WalkTimer(Sender: TObject);
begin

//Colide Monster 10
colideMonster10(florestMonster10,florestWall1);
colideMonster10(florestMonster10,florestWall2);
colideMonster10(florestMonster10,florestWall3);
colideMonster10(florestMonster10,florestWall4);
colideMonster10(florestMonster10,florestWall5);
colideMonster10(florestMonster10,florestWall6);
colideMonster10(florestMonster10,florestWall7);
colideMonster10(florestMonster10,florestWall8);
colideMonster10(florestMonster10,florestWall9);
colideMonster10(florestMonster10,florestWall10);
colideMonster10(florestMonster10,florestWall11);
colideMonster10(florestMonster10,florestWall12);
colideMonster10(florestMonster10,florestWall13);
colideMonster10(florestMonster10,florestWall14);
colideMonster10(florestMonster10,florestWall15);
colideMonster10(florestMonster10,florestWall16);
colideMonster10(florestMonster10,florestWall17);
colideMonster10(florestMonster10,florestWall18);
colideMonster10(florestMonster10,florestWall19);
colideMonster10(florestMonster10,florestWall20);
colideMonster10(florestMonster10,florestWall21);
colideMonster10(florestMonster10,florestWall22);
colideMonster10(florestMonster10,florestWall23);
colideMonster10(florestMonster10,florestWall24);
colideMonster10(florestMonster10,florestWall25);
colideMonster10(florestMonster10,florestWall26);
colideMonster10(florestMonster10,florestWall27);
colideMonster10(florestMonster10,florestWall28);
colideMonster10(florestMonster10,florestWall29);
colideMonster10(florestMonster10,florestWall30);
colideMonster10(florestMonster10,florestWall31);
colideMonster10(florestMonster10,florestWall32);
//se onAttack for falso ele anda se não ele leva dano

    if (canWalk10 = true) then
    begin
        Randomize;
        iNum := Random(80);
        case iNum of
            0: begin
                florestMonster10.Top:=florestMonster10.Top-5;
                florestMonster10.Picture.LoadFromFile('animation/monsters/poring-back.png');
                moveMonster10 := 'up';
                end;
            1: begin
                florestMonster10.Top:=florestMonster10.Top+5;
                florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                moveMonster10 := 'down';
                end;
            2: begin
                florestMonster10.Left:=florestMonster10.Left-5;
                florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                moveMonster10 := 'left';
                end;
            3: begin
                florestMonster10.Left:=florestMonster10.Left+5;
                florestMonster10.Picture.LoadFromFile('animation/monsters/poring-right.png');
                moveMonster10 := 'right';
               end;
            else begin

               end;
        end
    end;
   // else if (onAttack10 = true) then
   // begin
    
    //end;
end;

procedure TFloresta01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_F1) then
    begin
         if (colideOnAttack10(florestMonster10,attackEffect)) then
         begin
              attackTimerTimer(attackTimer);
              //attacking10 := true;
              //onAttack10 := true;
              hurtEffect10.Enabled := true;
              canWalk10 := false; 
         end;
    end;
end;

procedure TFloresta01.attackTimerTimer(Sender: TObject);
begin                             
     effectOfAttack();
     hurtEffect10.Enabled:=false;
end;

function TFloresta01.colideOnAttack10(Obj1: TImage; Obj2: TImage):boolean;
begin
    if (Obj1.Left+Obj1.Width<Obj2.Left) or
        (Obj1.Left>Obj2.Width+Obj2.Left) or
        (Obj1.Top+Obj1.Height<Obj2.Top) or
        (Obj1.Top> Obj2.Top+Obj2.Height) then
          begin
             colideYes := false;
          end
          else
          begin
              colideYes := true;
              attacking10 := true;
              onAttack10 := true;
          end;

    end;
procedure TFloresta01.hurtEffect10Timer(Sender: TObject);
begin
colideOnAttack10(florestMonster10, attackEffect);

if (onAttack10 = true) then
begin
        if (moveMonster10 = 'up') then //se o monstro estiver olhando pra cima
        begin
            if (move = 'up') then //se a menina estiver atacando de baixo e olhando pra cima /\
            begin
                 if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-back-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'down';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'down') then  //se a menina estiver atacando de cima e olhando pra baixo  \/
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-back-right.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-back.png');
                    moveMonster10 := 'up';
                    monster10Hurt := '0'; 
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'left') then  //se a menina estiver atacando da direita e olhando pra esquerda <<
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-back-right.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-right.png');
                    moveMonster10 := 'right';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'right') then   //se a menina estiver atacando da esquerda e olhando pra direita >>
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-back-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'left';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end
        end
       // ########################
       // ######### Down #########
       // ########################
       else if (moveMonster10 = 'down') then  //se o monstro estiver olhando pra baixo
       begin
            if (move = 'up') then //se a menina estiver atacando de baixo e olhando pra cima /\
            begin
                 if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'down';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'down') then  //se a menina estiver atacando de cima e olhando pra baixo  \/
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-right.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-back.png');
                    moveMonster10 := 'up';
                    monster10Hurt := '0'; 
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'left') then  //se a menina estiver atacando da direita e olhando pra esquerda <<
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-right.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-right.png');
                    moveMonster10 := 'right';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'right') then   //se a menina estiver atacando da esquerda e olhando pra direita >>
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'left';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end
       end

       // ######################
       // ######## Left ########
       // ######################
       else if (moveMonster10 = 'left') then  //se o monstro estiver olhando pra esquerda
       begin
            if (move = 'up') then //se a menina estiver atacando de baixo e olhando pra cima /\
            begin
                 if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'down';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'down') then  //se a menina estiver atacando de cima e olhando pra baixo  \/
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-back.png');
                    moveMonster10 := 'up';
                    monster10Hurt := '0'; 
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'left') then  //se a menina estiver atacando da direita e olhando pra esquerda <<
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-right.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-right.png');
                    moveMonster10 := 'right';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'right') then   //se a menina estiver atacando da esquerda e olhando pra direita >>
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'left';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end
       end

       // #####################
       // ####### Right #######
       // #####################
       else if (moveMonster10 = 'right') then   //se o monstro estiver olhando pra direita
       begin
            if (move = 'up') then //se a menina estiver atacando de baixo e olhando pra cima /\
            begin
                 if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'down';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'down') then  //se a menina estiver atacando de cima e olhando pra baixo  \/
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-back.png');
                    moveMonster10 := 'up';
                    monster10Hurt := '0'; 
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'left') then  //se a menina estiver atacando da direita e olhando pra esquerda <<
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-right.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-right.png');
                    moveMonster10 := 'right';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end

            else if (move = 'right') then   //se a menina estiver atacando da esquerda e olhando pra direita >>
            begin
                if (monster10Hurt = '0') then
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-hurt-left.png');
                    monster10Hurt := '1';
                end
                else
                begin
                    florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
                    moveMonster10 := 'left';
                    monster10Hurt := '0';
                    //attacking10 := false;
                    onAttack10 := false;
                end
            end
       end;
       monster10Attacking.Enabled := true;
end;
end;

procedure TFloresta01.monster10AttackingTimer(Sender: TObject);
begin
hurtEffect10.Enabled := false;
canWalk10 := false;
     if (attacking10 = true) then
     begin
     colideOnAttack10(florestMonster10, attackEffect);
          if (girl.Top + girl.Height < florestMonster10.Top) then
          begin
             florestMonster10.Top := florestMonster10.top-5;
             florestMonster10.Picture.LoadFromFile('animation/monsters/poring-back.png');
             moveMonster10 := 'up';

             if (florestMonster10.Left+florestMonster10.Width<girl.Left) or
                (florestMonster10.Left>girl.Width+girl.Left) or
                (florestMonster10.Top+florestMonster10.Height<girl.Top) or
                (florestMonster10.Top> girl.Top+girl.Height) then
                begin
                end
             else
                 begin
                     if colideOnAttack10(florestMonster10, girl) then
                     begin
                          if (GetKeyState(VK_F1) < 0) then
                          begin
                               onAttack10 := true;
                               hurtEffect10.Enabled := true;
                          end;
                     end

                       //ataca e tira hp
                 end
          end

          else if (girl.Top > florestMonster10.Top+florestMonster10.Height) then
          begin
             florestMonster10.Top := florestMonster10.Top+5;
             florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
             moveMonster10 := 'down';

             if (florestMonster10.Left+florestMonster10.Width<girl.Left) or
                (florestMonster10.Left>girl.Width+girl.Left) or
                (florestMonster10.Top+florestMonster10.Height<girl.Top) or
                (florestMonster10.Top> girl.Top+girl.Height) then
                begin
                end
              else
                 begin
                     if colideOnAttack10(florestMonster10, girl) then
                     begin
                          if (GetKeyState(VK_F1) < 0) then
                          begin
                               onAttack10 := true;
                               hurtEffect10.Enabled := true;
                          end;
                     end

                       //ataca e tira hp
                 end
          end

          else if (girl.Left + girl.Width<florestMonster10.Left) then
          begin
             florestMonster10.Left := florestMonster10.Left-5;
             florestMonster10.Picture.LoadFromFile('animation/monsters/poring-front.png');
             moveMonster10 := 'left';

             if (florestMonster10.Left+florestMonster10.Width<girl.Left) or
                (florestMonster10.Left>girl.Width+girl.Left) or
                (florestMonster10.Top+florestMonster10.Height<girl.Top) or
                (florestMonster10.Top> girl.Top+girl.Height) then
                begin
                end
             else
                 begin
                     if colideOnAttack10(florestMonster10, girl) then
                     begin
                          if (GetKeyState(VK_F1) < 0) then
                          begin
                               onAttack10 := true;
                               hurtEffect10.Enabled := true;
                          end;
                     end

                       //ataca e tira hp
                 end
          end

          else if (girl.Left > florestMonster10.Width + florestMonster10.Left) then
          begin
             florestMonster10.Left := florestMonster10.Left+5;
             florestMonster10.Picture.LoadFromFile('animation/monsters/poring-right.png');
             moveMonster10 := 'right';

             if (florestMonster10.Left+florestMonster10.Width<girl.Left) or
                (florestMonster10.Left>girl.Width+girl.Left) or
                (florestMonster10.Top+florestMonster10.Height<girl.Top) or
                (florestMonster10.Top> girl.Top+girl.Height) then
                begin

                end
             else
                 begin
                     if colideOnAttack10(florestMonster10, girl) then
                     begin
                          if (GetKeyState(VK_F1) < 0) then
                          begin
                               onAttack10 := true;
                               hurtEffect10.Enabled := true;
                          end;
                     end

                       //ataca e tira hp
                 end
          end;
     end;
end;

end.


