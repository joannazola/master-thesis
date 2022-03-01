#include <vcl.h>
#pragma hdrstop

#include <vfw.h>
#include <vcl\Clipbrd.hpp>
#include <winuser.h>

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
HWND hWndC;
BOOL b,BW;
tagCaptureParms cp;
 int IMGDX=640,IMGDY=480;

TForm1 *Form1;



__int64 get_rdtsc();
__int64 t;

LRESULT CALLBACK capVideoStreamCallback(HWND hWndC, PVIDEOHDR lp)
{
t=get_rdtsc(); while( get_rdtsc()< t + 1000000 );
}

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{

hWndC = capCreateCaptureWindow ( "Capture Window", WS_CHILD |WS_VISIBLE, 0, 0, IMGDX,IMGDY, Form1->Panel1->Handle, 0);

  if (hWndC)   {
     b = capDriverConnect (hWndC, 0); // 0 ->means default driver.
     CAPSTATUS CapStatus;
      //*****
        BOOL bOK=capGetStatus(hWndC, &CapStatus, sizeof (CAPSTATUS));
        ::SetWindowPos(hWndC, NULL, 0, 0,CapStatus.uiImageWidth, CapStatus.uiImageHeight,SWP_NOZORDER | SWP_NOMOVE);
        IMGDX=CapStatus.uiImageWidth,IMGDY= CapStatus.uiImageHeight;
      //****
      BOOL bOk= capSetCallbackOnFrame(hWndC,capVideoStreamCallback);

     capPreviewRate( hWndC, 1 );
     capPreview( hWndC, TRUE );
    }
  else
  {
     ShowMessage("kamera jest nie podlaczona!");//error message box.
     exit(1);
  }


}
//---------------------------------------------------------------------------


#define Sx 400
#define Sy 300
#define Max_obj 100
#define M_pix 1000



int dist( unsigned a, unsigned b );
void go(int y, int x);
void displ( byte o[][Sx], TImage *t );
void putpixel( int x, int y, unsigned v, int s, TImage *t );
void scan( int x1, int y1, int x2, int y2);
void clear( TImage *im );

class obj
{
public:
unsigned px[M_pix], py[M_pix],  col[M_pix];


int n, bb;
float xx,yy,vv;
unsigned skol;

void oblicz_jasnosc(void);
void oblicz_sr_kolor(void);
void oblicz_polozenie_centum(void);
void oblicz_polozenie_centum1(void);
void displ( TImage *c );
void displ_symbol( TImage *c );
void displ_large( TImage *c, int pixsize );
void list( TMemo *m);


obj(void) {n=bb=0; vv=0;  xx=yy=1; }
};




unsigned int o[1000][2000];


unsigned cw= RGB(250,250,251);
int  ppp=0;
obj   *ooo;
int tr= 50;
obj  to[Max_obj];
int nn;







int dist( unsigned a, unsigned b )
{  int  dr= GetRValue(a)-GetRValue(b),   dg= GetGValue(a)-GetGValue(b),  db= GetBValue(a)-GetBValue(b); // ró¿nice pomiedzy intenzywnoscia skladowych barw
   return abs(dr)+abs(dg)+abs(db);
}




void obj::oblicz_jasnosc()
{
int i;
if(n<1) { vv=bb=0;  return; }
bb=0;
for(i=0;i<n;++i) bb+= ((int)GetRValue(col[i]) + GetGValue(col[i]) + GetBValue(col[i]))/3 ;
vv= (double)bb/n;
}


void obj::oblicz_sr_kolor()
{
int i, rrr=0,ggg=0,bbb=0;
if(n<1) { skol=0;  return; }
for(i=0;i<n;++i)
   {
   rrr+= GetRValue(col[i]);
   ggg+= GetGValue(col[i]);
   bbb+= GetBValue(col[i]);
   }
skol= RGB( rrr/n, ggg/n, bbb/n );
}

void obj::oblicz_polozenie_centum()
{
int i;
double sx=0,sy=0;
if(n<1)  return;

for(i=0;i<n;++i)
 {
 sx+= px[i];
 sy+= py[i];
 }
xx= (double)sx/n; yy= (double)sy/n;
}

void obj::oblicz_polozenie_centum1()
{

int i,g, sx=0,sy=0,sb=0;
if(n<1)  return;

for(i=0;i<n;++i)
 {
 g= ((int)GetRValue(col[i]) + GetGValue(col[i]) + GetBValue(col[i]))/3 ;
 sx+= px[i]*g;
 sy+= py[i]*g;
 sb+= g;
 }
if(sb<1) return;
xx= (double)sx/sb; yy= (double)sy/sb;
}


void obj::displ_large( TImage *im, int pixsize )
{

for(int i=0; i<n; ++i)
 putpixel( im->Width/2/pixsize  + px[i] -xx,  im->Height/2/pixsize + py[i] -yy, col[i], pixsize,  im  );

}

void clear( TImage *im )

{
 im->Canvas->Pen->Color = (TColor)RGB(170,200,200);
 im->Canvas->Brush->Color = im->Canvas->Pen->Color;
 im->Canvas->Rectangle(0,0,im->Width-1, im->Height-1);

}

void obj::displ( TImage *im )

{ clear(im);
for(int i=0; i<n; ++i)
 im->Canvas->Pixels [px[i]][py[i]]=  (TColor)col[i];
}


void obj::displ_symbol( TImage *im )
{
clear(im);

 im->Canvas->Pen->Color = (TColor)RGB(170,170,170);
 im->Canvas->Brush->Color = (TColor)skol;
 im->Canvas->Ellipse(xx-10,yy-10, xx+10, yy+10);
}


void go(int x, int y)     
{
if(ppp>=M_pix) return;

ooo->px[ppp]= x;
ooo->py[ppp]= y;
ooo->col[ppp]= o[x][y];


o[x][y]=0;
++ppp;

       Form1->Image2->Canvas->Pixels[x][y]= (TColor)RGB(255,0,255);
       Form1->Image3->Canvas->Pixels[x][y]= (TColor)RGB(255,0,255);


if(dist( o[x+1][y],cw)<tr && x<Sx-1)   go(x+1,y);
if(dist( o[x][y+1],cw)<tr && y<Sy-1)   go(x,y+1);

if(dist( o[x-1][y],cw)<tr && x>0)      go(x-1,y);
if(dist( o[x][y-1],cw)<tr && y>0)      go(x,y-1);

}

void list_objects(TMemo *m)
{
int i;
obj *ooo= to;

m->Lines->Strings[0]= " numer il_pix  jas   x  y    RGB";

for(i=0; i<nn; ++i)
  {
  ooo= to+i;  // wsk do obiektu                                        rozne wersje funkcji do konwersji do ciagu znaków
  m->Lines->Strings[i+1]= IntToStr(i)+ "  " + IntToStr(ooo->n) + "   " +FloatToStrF(ooo->vv, TFloatFormat(3),3,1)+
  "      xy " + int(ooo->xx) + "  " + int(ooo->yy)+"      "+
  GetRValue(ooo->skol)+"  "+GetGValue(ooo->skol)+"  "+GetBValue(ooo->skol);
  }

}

void scan( int x1, int y1, int x2, int y2)
{
int x,y;
nn=0;

for(y=y1; y<=y2; y+=4)
 for(x=x1; x<=x2; x+=4)
   if( dist( o[x][y],cw)<tr )
      {
      ppp=0;  ooo= to+nn;
      go(x,y);
      ooo->n = ppp;

      ooo->oblicz_jasnosc();
      ooo->oblicz_polozenie_centum();
      ooo->oblicz_sr_kolor();
      ++nn;
      if(nn>=Max_obj) return;
      }



}


__int64 get_rdtsc()
{
__int64 ttt;
unsigned long aaxx,ddxx, *p= (unsigned long*)(&ttt);

asm {
push edx
push eax
rdtsc
mov aaxx, eax
mov ddxx, edx
pop eax
pop eax
}

*p     = aaxx;
*(p+1) = ddxx;       // pewnie i tak w eax:edx jest rezultat funkcji

return ttt*10/23552;
}

void get_all_obj( unsigned kolor, int trrr )
{
int i;

cw= kolor;
tr= trrr;
clear(Form1->Image3);
scan(10,10,Sx-10,Sy-10);



for(i=0;i<nn;++i)
 {
 to[i].displ_symbol( Form1->Image4 );
 }

list_objects(Form1->Memo2);

}
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
capGrabFrame(hWndC);
capEditCopy(hWndC);

 TClipboard *pCB = Clipboard();
  if (pCB->HasFormat(CF_BITMAP))
  {
    Graphics::TBitmap *pBitmap = new Graphics::TBitmap();
    try
    {
      pBitmap->LoadFromClipboardFormat(CF_BITMAP, pCB->GetAsHandle(CF_BITMAP), 0);

      pBitmap->Assign(Clipboard());
      Form1->Image1->Picture->Bitmap = pBitmap;
      pBitmap->SaveToFile("boz.bmp");
    }
    catch (...)
    {
    }
    delete pBitmap;
  }
capFileSaveDIB(hWndC, "C:\Builder\Pliki\Praca dyplomowa\dyplom\Calosc_v2");
capPreview( hWndC, TRUE );

{
int x,y;
Image2->Picture->LoadFromFile("boz.bmp");
TCanvas *cc= Image2->Canvas;

for(y=0;y<Sy;++y)
  for(x=0;x<Sx;++x) o[x][y]=  cc->Pixels[x][y];
}

{
int i,p,min_d;
obj *ooo;
unsigned kol= RGB(254,2,2);
get_all_obj( kol,  250 );




p=-1;
min_d= 10000;

for(i=0;i<nn;++i)
  {
  ooo= to+i;
  if( ooo->n>20 && ooo->n<500 && ooo->vv>70)
    if(  dist( ooo->skol, kol) < min_d )
       {
       p=i;
       min_d = dist( ooo->skol, kol);
       }
  }

 Label3->Caption = FloatToStr( ooo->xx ) ;
 Label4->Caption = FloatToStr( ooo->yy ) ;
}

}

//---------------------------------------------------------------------------

void __fastcall TForm1::Timer2Timer(TObject *Sender)
{


    int a, b, c ;
   a++;
  {b=ooo->xx;
  c=ooo->xx;
if((b > 12) &&  (c > 30))
{Zle->Brush->Color = clRed;
Dobrze->Brush->Color = clGray;}
else
{Dobrze->Brush->Color = clGreen;
Zle->Brush->Color = clGray;} }


}
//---------------------------------------------------------------------------




