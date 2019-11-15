{ +--------------------------------------------------------------------------+ }
{ | MMEEC v0.1 * Environment characteristics editor                          | }
{ | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@.szerafingomba.hu>         | }
{ | cmdlineparams.inc                                                        | }
{ | Handle command line parameters                                           | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.
//
//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

// handle command line parameters
procedure cmdlineparams;
var
  appmode: byte;
  b: byte;
  fe, fn: string;
  params: array[1..2,1..3] of string=
  (
    ('-h','--help','show help'),
    ('-v','--version','show version and build information')
  );

  // show useable parameters
  procedure help(mode: boolean);
  var
    b: byte;
  begin
  if mode
  then
    quit(1,false,'ERROR: There are one or more bad parameter in command line.')
  else
    begin
      writeln('Usage:');
      writeln(' ',fn,{$IFDEF WIN32}'.',fe,{$ENDIF}' [parameter]');
      writeln;
      writeln('parameters:');
      for b:=1 to 2 do
      begin
        write('  ',params[b,1]);
        gotoxy(8,wherey); write(params[b,2]);
        gotoxy(30,wherey); writeln(params[b,3]);
      end;
    end;
  quit(0,false,'');
end;

// write version and build information
procedure verinfo;
begin
  writeln(APPNAME+' v'+VERSION);
  writeln;
  writeln('This application was compiled at ',{$I %TIME%},' on ',{$I %DATE%},
    ' by ',{$I %USER%});
  writeln('FPC version: ',{$I %FPCVERSION%});
  writeln('Target OS:   ',{$I %FPCTARGETOS%});
  writeln('Target CPU:  ',{$I %FPCTARGETCPU%});
  quit(0,false,'');
end;

begin
  fn:=extractfilename(paramstr(0));
  appmode:=0;
  if length(paramstr(1))=0 then appmode:=1 else
  begin
    for b:=1 to 2 do
      if paramstr(1)=params[b,1] then appmode:=10*b;
    for b:=1 to 2 do
      if paramstr(1)=params[b,2] then appmode:=10*b;
  end;
  case appmode of
     0: help(true);
    10: help(false);
    20: verinfo;
  end;
end;
