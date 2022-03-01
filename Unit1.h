//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TLabel *Label1;
        TImage *Image1;
        TLabel *Label2;
        TTimer *Timer1;
        TPanel *Panel2;
        TShape *Zle;
        TShape *Dobrze;
        TTimer *Timer2;
        TLabel *Label3;
        TLabel *Label4;
        TMemo *Memo2;
        TImage *Image2;
        TImage *Image3;
        TImage *Image4;
        TLabel *Label5;
        TLabel *Label6;
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall Timer2Timer(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
