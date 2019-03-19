library externals;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  dialogs,
  forms,
  extctrls,
  Classes;

procedure MoveRight(target:TForm; step,refresh_speed,start_point,limit:integer); stdcall; export;
var i:integer;
begin
  i:=start_point;
  repeat
    target.Left:=target.Left+step;
    i:=i+step;
    target.Repaint;
    sleep(refresh_speed);
  until i>=limit ;

end;

procedure MoveDown(target:TForm; step,refresh_speed,start_point,limit:integer); stdcall; export;
var i:integer;
begin
  i:=start_point;
  repeat
    target.Top:=target.Top+step;
    i:=i+step;
    target.Repaint;
    sleep(refresh_speed);
  until i>=limit ;

end;

exports
MoveRight, MoveDown;
//MoveIt;

begin
end.
