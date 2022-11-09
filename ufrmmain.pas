unit ufrmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls{, WinCRT};

const
  cWindowHeight=768;
  cWindowWidth=768;
  mpHeight=16;
  mpWidth=16;
  cBlockHeight=cWindowHeight div mpHeight;
  cBlockWidth=cWindowWidth div mpWidth;
  cMapCount=8;

  cTips:array[0..15] of String =(
    'For Tarcadia!',
    'I''m a BOY!',
    'Be Careful with your keyboard...',
    'TAT! A sad story! QAQ!',
    '**** * ******* *****!',
    'All English but MADE IN CHINA.',
    'Notch the GOD.',
    'I love mine and craft!',
    'I use pascal, which you say is useless.',
    '"I hate it when people talk with their mouth full"',
    'Up Up Down Down Left Right Left Right',
    'Do you know Zhenjiang? That''s my hometown.',
    'im in world - XuKe',
    'Funny!',
    'X',
    'Do you know what does this mean?'
  );
  cMapList:array[0..cMapCount-1] of array[1..mpHeight,1..mpWidth] of Byte=(
    (
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0),
      (0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0),
      (0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
    ),
    (
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,1,1,1,1,0,0,0,0,1,1,1,1,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,1,1,1,1,0,0,0,0,1,1,1,1,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
    ),
    (
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0),
      (0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0),
      (0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0),
      (0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0),
      (0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0),
      (0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0),
      (0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0),
      (0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0),
      (0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
    ),
    (
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,1,1,1,0,1,1,1,1,1,0,0,0,0,0,1),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
      (1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
    ),
    (
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,1,1,1,0,1,0,0,1,0,0,0,1,0,0),
      (0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0),
      (0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0),
      (0,0,0,1,0,0,1,0,0,0,1,1,1,0,0,0),
      (0,0,1,1,1,0,1,1,1,0,0,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0),
      (0,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0),
      (0,0,1,1,1,1,1,0,1,0,0,0,1,0,0,0),
      (0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0),
      (0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0),
      (0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
    ),
    (
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,1,1,1,0,0,1,0,0,1,1,0,0,1,1,0),
      (0,0,1,0,0,1,1,1,0,1,1,1,0,1,1,0),
      (0,0,1,0,0,1,1,1,0,1,1,1,0,1,1,0),
      (0,0,1,0,0,1,1,1,0,1,1,1,0,1,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0),
      (0,0,1,1,0,0,1,0,0,1,1,0,0,1,1,0),
      (0,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0),
      (0,1,0,0,0,1,1,1,0,1,1,1,0,1,1,0),
      (0,0,1,1,0,1,1,1,0,1,1,0,0,1,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0),
      (0,1,1,1,0,0,1,0,0,0,1,1,1,1,1,0),
      (0,0,1,0,0,1,1,1,0,0,1,1,1,1,1,0),
      (0,0,1,0,0,1,1,1,0,0,1,1,1,1,1,0),
      (0,1,1,1,0,1,1,1,0,0,1,1,1,1,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
    ),
    (
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1),
      (1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1),
      (0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
    ),
    (
      (0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
      (0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0),
      (0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0),
      (0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1),
      (0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0),
      (0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,0),
      (0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),
      (0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
      (1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
      (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
      (1,0,0,1,0,0,1,0,0,1,0,0,1,1,1,1)
    )
  );

  cDescribe:array[0..2] of array[0..3] of String=(
    (
      'Poor! That''s EASY MODE!',
      'Not so bad..',
      'Well done!',
      'Wow, You''ve finished it!'
    ),
    (
      '...What can I say...',
      'Good!',
      'Wonderful!',
      'I''ve found a CRAZY PLAYER'
    ),
    (
      'Well... Not bad yet...',
      'TAT',
      '!!!Fantastic',
      'Nothing to describe now!'
    )
  );

type
  { TfrmMain }

  TfrmMain = class(TForm)
    imgMdlCu: TImage;
    imgMdlAg: TImage;
    imgMdlAu: TImage;
    imgMdlQAQ: TImage;
    imgMedal: TImage;
    imgHelp: TImage;
    imgGoBack1: TImage;
    imgGoBack2: TImage;
    imgGameBack1: TImage;
    imgGameBack2: TImage;
    lblNum: TLabel;
    tmrCheck: TTimer;
    tmrCurtain: TTimer;
    vFood: TImage;
    imgNil: TImage;
    imgFood1: TImage;
    imgFood2: TImage;
    imgFood3: TImage;
    imgFood4: TImage;
    imgWall: TImage;
    imgGround: TImage;
    imgCurtain: TImage;
    imgGameOver: TImage;
    imgEasy1: TImage;
    imgBack2: TImage;
    imgCon2: TImage;
    imgEasy2: TImage;
    imgHead: TImage;
    imgBody: TImage;
    imgTail: TImage;
    imgNormal2: TImage;
    imgNormal1: TImage;
    imgExt1: TImage;
    imgExt2: TImage;
    imgGO1: TImage;
    imgBack1: TImage;
    imgGO2: TImage;
    imgCon1: TImage;
    imgIntro: TImage;
    imgDeveloper: TImage;
    imgHard1: TImage;
    imgHard2: TImage;
    imgShow: TImage;
    lblScore: TLabel;
    SenseHelp: TPanel;
    SenseCurtain: TPanel;
    SenseGameOver: TPanel;
    pnlLevel: TPanel;
    SenseMenu: TPanel;
    SenseGame: TPanel;
    SenseShow: TPanel;
    tmrMain: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormWindowChange(Sender: TObject);
    procedure GameOverClick(Sender: TObject);
    procedure imgConClick(Sender: TObject);
    procedure imgEasyClick(Sender: TObject);
    procedure HelpMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure imgNormalClick(Sender: TObject);
    procedure imgHardClick(Sender: TObject);
    procedure imgExtClick(Sender: TObject);
    procedure imgGOClick(Sender: TObject);
    procedure imgGoBackClick(Sender: TObject);
    procedure imgGameBackClick(Sender: TObject);

    procedure imgGOMouseLeave(Sender: TObject);
    procedure imgGOMouseEnter(Sender: TObject);
    procedure imgConMouseLeave(Sender: TObject);
    procedure imgConMouseEnter(Sender: TObject);
    procedure imgExtMouseLeave(Sender: TObject);
    procedure imgExtMouseEnter(Sender: TObject);

    procedure imgEasyMouseLeave(Sender: TObject);
    procedure imgEasyMouseEnter(Sender: TObject);
    procedure imgNormalMouseLeave(Sender: TObject);
    procedure imgNormalMouseEnter(Sender: TObject);
    procedure imgHardMouseLeave(Sender: TObject);
    procedure imgHardMouseEnter(Sender: TObject);

    procedure imgGoBackMouseEnter(Sender: TObject);
    procedure imgGoBackMouseLeave(Sender: TObject);
    procedure imgGameBackMouseEnter(Sender: TObject);
    procedure imgGameBackMouseLeave(Sender: TObject);

    procedure HelpClick(Sender: TObject);
    procedure ShowClick(Sender: TObject);
    procedure tmrCheckTimer(Sender: TObject);
    procedure tmrCurtainTimer(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

  TPos=record
    X:Longint;
    Y:Longint;
  end;

  TMap=array[1..mpHeight,1..mpWidth] of (Nothing, SnakeBody, Wall, Food);

  TDir=(tdNo, tdUp, tdDown, tdLeft, tdRight);

const
  mvdX:array[tdNo..tdRight] of Longint=( 0, 0, 0,-1,+1);
  mvdY:array[tdNo..tdRight] of Longint=( 0,-1,+1, 0, 0);
  KeyAble:array[tdNo..tdRight,tdNo..tdRight] of Boolean=(
    (False, True, True, True, True),
    ( True,False,False, True, True),
    ( True,False,False, True, True),
    ( True, True, True,False,False),
    ( True, True, True,False,False)
  );

var
  frmMain: TfrmMain;

  vSnake:array[1..mpHeight*mpWidth]of TPos;
  vBody:array[1..mpHeight*mpWidth]of TImage;
  vWall:array[1..mpHeight*mpWidth]of TImage;
  vMap:TMap;
  vHead:TPos;
  vDir:TDir;
  vLength:Longint;
  vLeft:Longint;
  vLastKey:TDir;
  vNowKey:TDir;
  vFoodIndex:Longint;
  vFoodList:array[1..mpHeight*mpWidth] of TPos;

  sOnGame:Boolean;
  vLevel:String;

  vCurtainSpeed:Longint;
  vCurtain:TPanel;

  pN:Longint;
  pW:Longint;

implementation

{$R *.lfm}

{ TfrmMain }

function LongToStr(A:Longint):String;
var
  ans:String;
begin
  Str(A,ans);
  LongToStr:=Trim(ans);
end;

function GameDescribe:String;
var
  lvl:Longint;
  stt:Longint;
begin
  if vLevel[1]='E' then lvl:=0;
  if vLevel[1]='N' then lvl:=1;
  if vLevel[1]='H' then lvl:=2;
  if vLength<=5 then begin
    stt:=0;
    frmMain.imgMedal.Picture:=frmMain.imgMdlCu.Picture;
  end;
  if (vLength>5)and(vLength<20) then begin
    stt:=1;
    frmMain.imgMedal.Picture:=frmMain.imgMdlAg.Picture;
  end;
  if (vLength>=20)and(vLength+pW<mpHeight*mpWidth) then begin
    stt:=2;
    frmMain.imgMedal.Picture:=frmMain.imgMdlAu.Picture;
  end;
  if vLength+pW>=mpHeight*mpWidth then begin
    stt:=3;
    frmMain.imgMedal.Picture:=frmMain.imgMdlQAQ.Picture;
  end;
  GameDescribe:=cDescribe[lvl,stt];
  frmMain.lblNum.Caption:=LongToStr(vLength*(lvl+1)*100 div (mpHeight*mpWidth+1-pW));
end;

function BlockTop(A:Longint):Longint;
begin
  BlockTop:=(a-1)*cBlockHeight;
end;

function BlockLeft(A:Longint):Longint;
begin
  BlockLeft:=(a-1)*cBlockWidth;
end;

procedure NewBody(A:Longint);
begin
  if vBody[A]=nil then begin
    vBody[A]:=TImage.Create(frmMain);
    vBody[A].Name:='iB_'+LongToStr(A);
    vBody[A].Parent:=frmMain.SenseGame;
    vBody[A].Stretch:=true;
    vBody[A].Picture:=frmmain.imgHead.Picture;
    vBody[A].Top:=BlockTop(vHead.Y);
    vBody[A].Left:=BlockLeft(vHead.X);
    vBody[A].Height:=cBlockHeight;
    vBody[A].Width:=cBlockWidth;
    vBody[A].Show;
  end else begin
    vBody[A].Picture:=frmmain.imgHead.Picture;
    vBody[A].Top:=BlockTop(vHead.Y);
    vBody[A].Left:=BlockLeft(vHead.X);
    vBody[A].Show;
  end;
end;

procedure NewWall(A,T,L:Longint);
begin
  if vWall[A]=nil then begin
    vWall[A]:=TImage.Create(frmMain);
    vWall[A].Name:='iW_'+LongToStr(A);
    vWall[A].Parent:=frmMain.SenseGame;
    vWall[A].Stretch:=true;
    vWall[A].Picture:=frmmain.imgWall.Picture;
    vWall[A].Top:=BlockTop(T);
    vWall[A].Left:=BlockLeft(L);
    vWall[A].Height:=cBlockHeight;
    vWall[A].Width:=cBlockWidth;
    vWall[A].Show;
  end else begin
    vWall[A].Picture:=frmmain.imgWall.Picture;
    vWall[A].Top:=BlockTop(T);
    vWall[A].Left:=BlockLeft(L);
    vWall[A].Show;
  end;
end;

procedure InitData;
var
  i,j:Longint;
  cM:Longint;
  FoodPut:Boolean;
  PutNum:Longint;
  pX,pY:Longint;
  tmp:TPos;
begin
  sOnGame:=False;
  for i:=1 to mpHeight do for j:=1 to mpWidth do vMap[i,j]:=Nothing;
  for i:=1 to mpHeight*mpWidth do begin
    randomize;
    FoodPut:=False;
    PutNum:=0;
    pX:=trunc(random(mpWidth))+1;
    pY:=trunc(random(mpHeight))+1;
    while (not FoodPut)and(vMap[pY,pX]<>Nothing)and(PutNum<mpWidth*mpHeight*100) do begin
      pX:=trunc(random(mpWidth))+1;
      pY:=trunc(random(mpHeight))+1;
      PutNum:=PutNum+1;
    end;
    if Not FoodPut then begin
      pX:=0;
      while (pX<mpWidth)and(not FoodPut) do begin
        pX:=px+1;
        pY:=0;
        while (py<mpHeight)and(not FoodPut) do begin
          pY:=pY+1;
          if vMap[pY,pX]=Nothing then begin
            FoodPut:=True;
          end;
        end;
      end;
    end;
    vFoodList[i].X:=pX;
    vFoodList[i].Y:=pY;
    vMap[pY,pX]:=Food;
  end;
  randomize;
  for i:=1 to mpHeight*mpWidth*2 do begin
    pX:=trunc(random(mpHeight*mpWidth))+1;
    pY:=trunc(random(mpHeight*mpWidth))+1;
    tmp:=vFoodList[pX];
    vFoodList[pX]:=vFoodList[pY];
    vFoodList[pY]:=tmp;
  end;
  pN:=0;

  for i:=1 to mpHeight do for j:=1 to mpWidth do vMap[i,j]:=Nothing;

  cM:=trunc(random(cMapCount));
  pW:=0;

  for i:=1 to mpHeight*mpWidth do begin
    if vWall[i]<>nil then vWall[i].Hide;
    if vBody[i]<>nil then vBody[i].Hide;
  end;

  for i:=1 to mpHeight do for j:=1 to mpWidth do
    if cMapList[cM][i,j]=0 then vMap[i,j]:=Nothing else begin
      vMap[i,j]:=Wall;
      pW:=pW+1;
      NewWall(pW,i,j);
    end;

  for i:=1 to mpHeight*mpWidth do begin
      vSnake[i].X:=0;
      vSnake[i].Y:=0;
  end;

  vSnake[1].X:=mpWidth div 2;
  vSnake[1].Y:=mpHeight div 2;
  vHead:=vSnake[1];
  vLength:=1;
  vLeft:=1;
  vDir:=tdRight;
  vLastKey:=tdRight;
  vNowKey:=tdRight;
  vMap[vHead.Y,vHead.X+1]:=Food;

  NewBody(1);
end;

procedure CurtainDown(Pnl:TPanel);
begin
  Pnl.Top:=-768;
  Pnl.Enabled:=False;
  vCurtain:=Pnl;
  vCurtainSpeed:=200;
  frmMain.tmrCurtain.Enabled:=True;
end;

procedure CurtainUp(Pnl:TPanel);
begin
  Pnl.Top:=0;
  Pnl.Enabled:=False;
  vCurtain:=Pnl;
  vCurtainSpeed:=-200;
  frmMain.tmrCurtain.Enabled:=True;
end;

procedure spLoad;
//var
//  i:Longint;
begin
  randomize;
  frmMain.Caption:='Crazy Snake - '+cTips[trunc(random(16))];
  InitData;

  frmMain.Top:=(Screen.Height-cWindowHeight)div 2;
  frmMain.Left:=(Screen.Width-cWindowWidth)div 2;

  frmMain.Show;
  frmMain.SenseShow.Show;
  CurtainDown(frmMain.SenseShow);
end;

procedure spShow;
begin
  if frmMain.imgShow.Visible then
  begin
    frmMain.imgShow.Hide;
    frmMain.imgDeveloper.Show;
  end
  else
  if frmMain.imgDeveloper.Visible then
  begin
    frmMain.imgDeveloper.Hide;
    frmMain.imgIntro.Show;
  end
  else
  if frmMain.imgIntro.Visible then
  begin
    frmMain.SenseMenu.Show;
    CurtainDown(frmMain.SenseMenu);
  end;
end;

procedure GameOver;
begin
  sOnGame:=false;
  CurtainDown(frmMain.SenseGameOver);
  frmMain.lblScore.Caption:='You''ve got '+LongToStr(vLength)+' Scores'+#13
    +'There are '+LongToStr(pW)+' Walls'+#13
    +'You''ve choosen '+vLevel+#13
    +GameDescribe;
  frmMain.SenseGameOver.Show;
  InitData;
  frmMain.SenseMenu.Show;
  frmMain.SenseGame.Hide;
end;

procedure Paint;
begin
end;

procedure NewFood;
var
  FoodPut:Boolean;
  PutNum:Longint;
begin
  randomize;
  frmMain.vFood.Hide;
  FoodPut:=False;
  PutNum:=0;
  pN:=pN+trunc(random(mpWidth*mpHeight))+1;
  if pN>mpWidth*mpHeight then pN:=pN-mpWidth*mpHeight;
  while (not FoodPut)and(vMap[vFoodList[pN].Y,vFoodList[pN].X]<>Nothing)and(PutNum<mpWidth*mpHeight*100) do begin
    pN:=pN+trunc(random(mpWidth*mpHeight))+1;
    if pN>mpWidth*mpHeight then pN:=pN-mpWidth*mpHeight;
    PutNum:=PutNum+1;
  end;
  if Not FoodPut then begin
    while (pN<mpHeight*mpWidth)and(not FoodPut) do begin
      pN:=pN+1;
      if pN>mpWidth*mpHeight then pN:=pN-mpWidth*mpHeight;
      if vMap[vFoodList[pN].Y,vFoodList[pN].X]=Nothing then begin
        FoodPut:=True;
      end;
    end;
  end;
  randomize;
  vFoodIndex:=trunc(random(3))+1;
  if FoodPut then begin
    vMap[vFoodList[pN].Y,vFoodList[pN].X]:=Food;
    frmMain.vFood.Top:=BlockTop(vFoodList[pN].Y);
    frmMain.vFood.Left:=BlockLeft(vFoodList[pN].X);
    frmMain.vFood.Height:=cBlockHeight;
    frmMain.vFood.Width:=cBlockWidth;
    if vFoodIndex=1 then frmMain.vFood.Picture:=frmMain.imgFood1.Picture;
    if vFoodIndex=2 then frmMain.vFood.Picture:=frmMain.imgFood2.Picture;
    if vFoodIndex=3 then frmMain.vFood.Picture:=frmMain.imgFood3.Picture;
    if vFoodIndex=4 then frmMain.vFood.Picture:=frmMain.imgFood4.Picture;
    frmMain.vFood.Show;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmMain.Height:=cWindowHeight;
  frmMain.Width:=cWindowWidth;
  spLoad;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: char);
begin
  if not sOnGame then Exit;
  if Key='w' then vNowKey:=tdUp;
  if Key='a' then vNowKey:=tdLeft;
  if Key='s' then vNowKey:=tdDown;
  if Key='d' then vNowKey:=tdRight;
end;

procedure TfrmMain.FormWindowChange(Sender: TObject);
begin
  if frmMain.WindowState=wsFullScreen then begin
    frmMain.WindowState:=wsNormal;
  end;
  if frmMain.WindowState=wsMaximized then begin
    frmMain.WindowState:=wsNormal;
  end;
  if frmMain.WindowState=wsNormal then begin
    frmMain.tmrMain.Enabled:=true;
  end;
  if frmMain.WindowState=wsMinimized then begin
    frmMain.tmrMain.Enabled:=false;
  end;
  frmMain.Height:=cWindowHeight;
  frmMain.Width:=cWindowWidth;
end;

//Click


procedure TfrmMain.imgEasyClick(Sender: TObject);
begin
  CurtainDown(frmMain.SenseGame);
  tmrMain.Interval:=1000;
  tmrMain.Enabled:=true;
  frmMain.SenseGame.Show;
  vLevel:='EASY'+#13+'(!$#%%&#%)';
  sOnGame:=true;
  //CurtainUp;
end;

procedure TfrmMain.HelpMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgHelp.Top:=round((cWindowHeight-imgHelp.Height)*(Y/imgHelp.Height));
  imgHelp.Left:=round((cWindowWidth-imgHelp.Width)*(X/imgHelp.Width));
end;

procedure TfrmMain.GameOverClick(Sender: TObject);
begin
  CurtainDown(SenseMenu);
  SenseGameOver.Hide;
end;

procedure TfrmMain.imgConClick(Sender: TObject);
begin
  CurtainDown(frmMain.SenseHelp);
  frmMain.SenseHelp.Show;
end;

procedure TfrmMain.imgNormalClick(Sender: TObject);
begin
  CurtainDown(frmMain.SenseGame);
  tmrMain.Interval:=500;
  tmrMain.Enabled:=true;
  frmMain.SenseGame.Show;
  vLevel:='NORMAL'+#13+'(Not EASY!)';
  sOnGame:=true;
  //CurtainUp;
end;

procedure TfrmMain.imgHardClick(Sender: TObject);
begin
  CurtainDown(frmMain.SenseGame);
  tmrMain.Interval:=200;
  tmrMain.Enabled:=true;
  frmMain.SenseGame.Show;
  vLevel:='HARD'+#13+'(You must be CRAZY!)';
  sOnGame:=true;
  //CurtainUp;
end;

procedure TfrmMain.imgExtClick(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.imgGOClick(Sender: TObject);
begin
  CurtainDown(frmMain.PnlLevel);
  frmMain.PnlLevel.Show;
  //CurtainUp;
end;

procedure TfrmMain.imgGoBackClick(Sender: TObject);
begin
  CurtainDown(SenseGame);
  frmMain.pnlLevel.Hide;
  //CurtainUp;
end;

procedure TfrmMain.ShowClick(Sender: TObject);
begin
  spShow;
end;

procedure TfrmMain.tmrCheckTimer(Sender: TObject);
var
  i,j:Longint;
  sHaveFood:Boolean;
begin
  if sOnGame then begin
    sHaveFood:=false;
    //if vFood.Visible=false then begin
    for i:=1 to mpHeight do for j:=1 to mpWidth do if vMap[i,j]=Food then begin
      if sHaveFood then begin
        vMap[i,j]:=Nothing;
      end
      else
      begin
        vFood.Top:=BlockTop(i);
        vFood.Left:=BlockLeft(j);
        vFood.Visible:=true;
        sHaveFood:=true;
      end;
    end;
    if not sHaveFood then NewFood;
    //end;
  end;
end;

procedure TfrmMain.tmrCurtainTimer(Sender: TObject);
begin
  if vCurtain=nil then exit;
  vCurtain.Top:=vCurtain.Top+vCurtainSpeed;
  if vCurtain.Top>0 then begin
    frmMain.tmrCurtain.Enabled:=false;
    vCurtain.Top:=0;
    vCurtain.Enabled:=true;
    vCurtain:=Nil;
  end
  else
  if vCurtain.Top<-cWindowHeight then begin
    frmMain.tmrCurtain.Enabled:=false;
    vCurtain.Top:=-cWindowHeight;
    vCurtain.Enabled:=true;
    vCurtain:=Nil;
  end;
  if (abs(vCurtainSpeed)>1) then vCurtainSpeed:=vCurtainspeed div 5 *4;
end;

procedure TfrmMain.imgGameBackClick(Sender: TObject);
begin
  GameOver;
end;


//Mouse effects


procedure TfrmMain.imgGoBackMouseEnter(Sender: TObject);
begin
  imgGoBack1.Hide;
  imgGoBack2.Show;
end;

procedure TfrmMain.imgGoBackMouseLeave(Sender: TObject);
begin
  imgGoBack1.Show;
  imgGoBack2.Hide;
end;

procedure TfrmMain.imgGameBackMouseEnter(Sender: TObject);
begin
  imgGameBack1.Hide;
  imgGameBack2.Show;
end;

procedure TfrmMain.imgGameBackMouseLeave(Sender: TObject);
begin
  imgGameBack1.Show;
  imgGameBack2.Hide;
end;

procedure TfrmMain.HelpClick(Sender: TObject);
begin
  frmMain.SenseHelp.Hide;
  CurtainDown(frmMain.SenseHelp);
end;

procedure TfrmMain.imgGOMouseLeave(Sender: TObject);
begin
  frmMain.imgGo1.Show;
  frmMain.imgGo2.Hide;
end;

procedure TfrmMain.imgGOMouseEnter(Sender: TObject);
begin
  frmMain.imgGo1.Hide;
  frmMain.imgGO2.Show;
end;

procedure TfrmMain.imgConMouseLeave(Sender: TObject);
begin
  frmMain.imgCon1.Show;
  frmMain.imgCon2.Hide;
end;

procedure TfrmMain.imgConMouseEnter(Sender: TObject);
begin
  frmMain.imgCon1.Hide;
  frmMain.imgCon2.Show;
end;

procedure TfrmMain.imgExtMouseLeave(Sender: TObject);
begin
  frmMain.imgExt1.Show;
  frmMain.imgExt2.Hide;
end;

procedure TfrmMain.imgExtMouseEnter(Sender: TObject);
begin
  frmMain.imgExt1.Hide;
  frmMain.imgExt2.Show;
end;

procedure TfrmMain.imgEasyMouseLeave(Sender: TObject);
begin
  frmMain.imgEasy1.Hide;
  frmMain.imgEasy2.Show;
end;

procedure TfrmMain.imgEasyMouseEnter(Sender: TObject);
begin
  frmMain.imgEasy1.Show;
  frmMain.imgEasy2.Hide;
end;

procedure TfrmMain.imgNormalMouseLeave(Sender: TObject);
begin
  frmMain.imgNormal1.Hide;
  frmMain.imgNormal2.Show;
end;

procedure TfrmMain.imgNormalMouseEnter(Sender: TObject);
begin
  frmMain.imgNormal1.Show;
  frmMain.imgNormal2.Hide;
end;

procedure TfrmMain.imgHardMouseLeave(Sender: TObject);
begin
  frmMain.imgHard1.Hide;
  frmMain.imgHard2.Show;
end;

procedure TfrmMain.imgHardMouseEnter(Sender: TObject);
begin
  frmMain.imgHard1.Show;
  frmMain.imgHard2.Hide;
end;


procedure TfrmMain.tmrMainTimer(Sender: TObject);
var
  tTail:Longint;
begin
  if not sOnGame then Exit;
  if KeyAble[vNowKey,vLastKey] then begin
    vDir:=vLastKey;
    vLastKey:=vNowKey;
  end;
  vHead.X:=vHead.X+mvdX[vDir];
  vHead.Y:=vHead.Y+mvdY[vDir];
  if vHead.X>mpWidth then vHead.X:=1;
  if vHead.X<1 then vHead.X:=mpWidth;
  if vHead.Y>mpHeight then vHead.Y:=1;
  if vHead.Y<1 then vHead.Y:=mpHeight;
  if (vHead.X in [1..mpWidth])and(vHead.Y in [1..mpHeight]) then begin
    if vMap[vHead.Y,vHead.X]=Nothing then
    begin
      vLeft:=vLeft+vLength-1;
      if vLeft>mpHeight*mpWidth then vLeft:=vLeft-mpHeight*mpWidth;
      vMap[vSnake[vLeft].Y,vSnake[vLeft].X]:=Nothing;
      vBody[vLeft].Hide;
      vLeft:=vLeft+1-vLength;
      if vLeft<1 then vLeft:=vLeft+mpHeight*mpWidth;
      if vBody[vLeft]<>Nil then vBody[vLeft].Picture:=frmMain.imgBody.Picture;
      //tTail:=vLeft+vLength-1;
      //if tTail>mpHeight*mpWidth then tTail:=tTail-mpHeight*mpWidth;
      //if vBody[tTail]<>Nil then vBody[tTail].Picture:=frmMain.imgTail.Picture;
      vLeft:=vLeft-1;
      if vLeft<1 then vLeft:=vLeft+mpHeight*mpWidth;
      vSnake[vLeft]:=vHead;
      vMap[vHead.Y,vHead.X]:=SnakeBody;
      NewBody(vLeft);
      vBody[vLeft].Picture:=frmMain.imgHead.Picture;
    end
    else if vMap[vHead.Y,vHead.x]=SnakeBody then
    begin
      tTail:=vLeft+vLength-1;
      if tTail>mpHeight*mpWidth then tTail:=tTail-mpHeight*mpWidth;
      if (vSnake[tTail].X=vHead.X)and(vSnake[tTail].Y=vHead.Y) then begin
        vLeft:=vLeft+vLength-1;
        if vLeft>mpHeight*mpWidth then vLeft:=vLeft-mpHeight*mpWidth;
        vMap[vSnake[vLeft].Y,vSnake[vLeft].X]:=Nothing;
        vBody[vLeft].Hide;
        vLeft:=vLeft+1-vLength;
        if vLeft<1 then vLeft:=vLeft+mpHeight*mpWidth;
        if vBody[vLeft]<>Nil then vBody[vLeft].Picture:=frmMain.imgBody.Picture;
        //if vBody[tTail]<>Nil then vBody[tTail].Picture:=frmMain.imgTail.Picture;
        vLeft:=vLeft-1;
        if vLeft<1 then vLeft:=vLeft+mpHeight*mpWidth;
        vSnake[vLeft]:=vHead;
        vMap[vHead.Y,vHead.X]:=SnakeBody;
        NewBody(vLeft);
        vBody[vLeft].Picture:=frmMain.imgHead.Picture;
      end else begin
        GameOver;
      end;
    end
    else if vMap[vHead.Y,vHead.X]=Food then
    begin
      if vBody[vLeft]<>Nil then vBody[vLeft].Picture:=frmMain.imgBody.Picture;
      vLeft:=vLeft-1;
      if vLeft<1 then vLeft:=vLeft+mpHeight*mpWidth;
      vLength:=vLength+1;
      vSnake[vLeft]:=vHead;
      vMap[vHead.Y,vHead.X]:=SnakeBody;
      NewBody(vLeft);
      vBody[vLeft].Picture:=frmMain.imgHead.Picture;
      NewFood;
    end
    else if vMap[vHead.Y,vHead.X]=Wall then
    begin
      GameOver;
    end;
    //Paint;
  end;
end;

end.

