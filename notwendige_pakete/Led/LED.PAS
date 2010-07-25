unit Led;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TLEDState=(LEDOn,LEDOff);
  TLEDColor=(LEDRed,LEDGreen,LEDBlue,LEDYellow,LEDMagenta,LEDCyan,LEDGray);
  TLED = class(TGraphicControl)
  private
  protected
     FState:TLEDState;
     FOnColor:TLEDColor;
     FOffColor:TLEDColor;
     FOldHeight:Integer;
     FOldWidth:Integer;
     procedure SetOnColor(Value:TLEDColor);
     procedure SetOffColor(Value:TLEDColor);
     procedure SetState(Value:TLEDState);
 public
     constructor Create(AOwner:TComponent);override;
     procedure   Paint;override;
 published
     property Align;
     property DragCursor;
     property DragMode;
     property Enabled;
     property Height default 16;
     property LEDOffColor:TLEDColor read FOffColor write SetOffColor
        default LEDGray;
     property LEDOnColor:TLEDColor read FOnColor write SetOnColor
        default LEDRed;
     property OnClick;
     property OnDblClick;
     property OnDragDrop;
     property OnDragOver;
     property OnEndDrag;
     property OnMouseDown;
     property OnMouseMove;
     property OnMouseUp;
     property ParentShowHint;
     property ShowHint;
     property State:TLEDState read FState write SetState default LEDOff;
     property Visible;
     property Width default 16;
  end;

procedure Register;

implementation

constructor TLED.Create(AOwner:TComponent);
{Standardwerte setzen}
begin
     inherited Create(AOwner);
     Height:=16;
     Width:=16;
     LEDOnColor:=LEDRed;
     LEDOffColor:=LEDGray;
     State:=LEDOff;
     Visible:=true;
     Enabled:=True;
end;

procedure TLED.Paint;
{Bringt die LED auf den Bildschirm}
var a,b,w,h:real;
    phi,diag:real;
    x,y:integer;

    procedure GetDarkColor;
    {Stift mit 'Dunkler Farbe'}
    begin
         if State=LEDOn then begin
            case FOnColor of
                 LEDRed: Canvas.Pen.Color:=clMaroon;
                 LEDGreen: Canvas.Pen.Color:=clGreen;
                 LEDBlue: Canvas.Pen.Color:=clNavy;
                 LEDYellow: Canvas.Pen.Color:=clOlive;
                 LEDMagenta: Canvas.Pen.Color:=clPurple;
                 LEDCyan: Canvas.Pen.Color:=clTeal;
                 LEDGray: Canvas.Pen.Color:=clGray;
            end;
         end else begin
             case FOffColor of
                 LEDRed: Canvas.Pen.Color:=clMaroon;
                 LEDGreen: Canvas.Pen.Color:=clGreen;
                 LEDBlue: Canvas.Pen.Color:=clNavy;
                 LEDYellow: Canvas.Pen.Color:=clOlive;
                 LEDMagenta: Canvas.Pen.Color:=clPurple;
                 LEDCyan: Canvas.Pen.Color:=clTeal;
                 LEDGray: Canvas.Pen.Color:=clGray;
            end;
        end;
        Canvas.Brush.Color:=Canvas.Pen.Color;
    end;

    procedure GetLightColor;
    {Stift mit 'Heller Farbe'}
    begin
         if FState=LEDOn then begin
             case FOnColor of
                  LEDRed: Canvas.Pen.Color:=clRed;
                  LEDGreen: Canvas.Pen.Color:=clLime;
                  LEDBlue: Canvas.Pen.Color:=clBlue;
                  LEDYellow: Canvas.Pen.Color:=clYellow;
                  LEDMagenta: Canvas.Pen.Color:=clFuchsia;
                  LEDCyan: Canvas.Pen.Color:=clAqua;
                  LEDGray: Canvas.Pen.Color:=clSilver;
             end;
         end else begin
             case FOffColor of
                  LEDRed: Canvas.Pen.Color:=clRed;
                  LEDGreen: Canvas.Pen.Color:=clLime;
                  LEDBlue: Canvas.Pen.Color:=clBlue;
                  LEDYellow: Canvas.Pen.Color:=clYellow;
                  LEDMagenta: Canvas.Pen.Color:=clFuchsia;
                  LEDCyan: Canvas.Pen.Color:=clAqua;
                  LEDGray: Canvas.Pen.Color:=clSilver;
             end;
        end;
        Canvas.Brush.Color:=Canvas.Pen.Color;
    end;

begin
     with Canvas do begin
          {Umrandung der LED}
          Pen.Color:=clBlack;
          {auﬂen unten}
          Arc(0,0,Width,Height,Width+1,0,0,Height+1);
          {innen oben}
          Arc(1,1,Width-1,Height-1,0,Height,Width,0);
          Pen.Color:=clWhite;
          {auﬂen oben}
          Arc(0,0,Width,Height,0,Height,Width,0);
          {innen unten}
          Arc(1,1,Width-1,Height-1,Width+1,0,0,Height+1);
          {dunkler Keises}
          GetDarkColor;
          Ellipse(2,2,Width-2,Height-2);
          {Schatten}
          if ((FState=LEDOn)and(FOnColor=LEDGray))or
             ((FState=LEDOff)and(FOffColor=LEDGray)) then Pen.Color:=clBlack
                                                   else Pen.Color:=clGray;
          Arc(2,2,Width-2,Height-2,Width div 2,Height-2,Width-2,Height div 2);
          Arc(6,6,Width-3,Height-3,Width div 2,Height-2,Width-2,Height div 2);
          {heller Kreis}
          GetLightColor;
          phi:=arctan(Height/Width);
          diag:=sqrt(sqr((Width-4)*cos(phi))+sqr((Height-4)*sin(phi)));
          a:=2*sqrt(sqr(0.5*(Height-4))+sqr(0.5*(Width-4)))-diag;
          b:=sqrt(sqr(0.625*(Height-4))+sqr(0.625*(Width-4)))-0.625*diag;
          w:=sin(0.5*Pi*phi)*0.5*(a-b);
          h:=sin(phi)*0.5*(a-b);
          Ellipse(trunc(2+w),trunc(2+h),trunc(2+w+5/8*Width),
             trunc(2+h+5/8*Height));
          {weiﬂer Lichtpunkt}
          Pen.Color:=clWhite;
          Brush.Color:=Pen.Color;
          x:=round(0.3*Width);
          y:=round(0.3*Height);
          Ellipse(x-1,y-1,x+1,y+1);
     end;
end;

procedure TLED.SetOffColor(Value:TLEDColor);
{Farbe, wenn LED ausgeschaltet}
begin
     if Value<>FOffColor then begin
        FOffColor:=Value;
        Invalidate;
     end;
end;

procedure TLED.SetOnColor(Value:TLEDColor);
{Farbe, wenn LED eingeschaltet}
begin
     if Value<>FOnColor then begin
        FOnColor:=Value;
        Invalidate;
     end;
end;

procedure TLED.SetState(Value:TLEDState);
{Ein- oder Ausschalten der LED}
begin
     if Value<>FState then begin
        FState:=Value;
        Invalidate;
     end;
end;

procedure Register;
begin
  RegisterComponents('MPA', [TLED]);
end;

end.

