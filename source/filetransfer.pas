{ +--------------------------------------------------------------------------+ }
{ | MMEEC v0.1.1 * Environment characteristics editor                        | }
{ | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@.szerafingomba.hu>         | }
{ | filetransfer.pas                                                         | }
{ | Download and upload remote file                                          | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.
//
//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

// select remote file for edit
function selectremotefile(direction: boolean): byte;
var
  b: byte;
  c: char;
  s: string;
begin
  background;
  if direction
    then header(APPNAME+' v'+VERSION+' * Select source file to edit')
    else header(APPNAME+' v'+VERSION+' * Select target file to upload');
  textcolor(white);
  for b:=0 to 15 do
  begin
    if b<9 then gotoxy(5,b+3) else gotoxy(4,b+3);
    write(b+1,': '+pathremotefiles[b]);
  end;
  textbackground(black); gotoxy(1,bottom); clreol;
  footer(bottom-1,'<Enter> accept  <Esc> exit from program');
  textcolor(lightgray);
  gotoxy(1,bottom); write('>');
  s:='';
  repeat
    c:=readkey;
    if isnumber(c) then
    begin
      if length(s)<3 then s:=s+c;
      if s='0' then s:='1';
      if strtoint(s)>16 then s:='16';
    end;
    if c=#8 then delete(s,length(s),1);
    gotoxy(1,bottom); clreol; write('>'+s);
  until ((c=#13) and (length(s)>0) and (length(pathremotefiles[strtoint(s)-1])>0)) or (c=#27);
  if c=#27 then quit(0,true,'');
  selectremotefile:=strtoint(s)-1;
  gotoxy(1,bottom); clreol;
end;

// download a file from remote unit
function download(remotefile:string): boolean;
var
  Process1: TProcess;
begin
  footer(bottom-1,'');
  textcolor(lightgray);textbackground(black);
  gotoxy(1,bottom); clreol; write('Downloading...');
  download:=true;
  Process1:=TProcess.Create(nil);
  Process1.Executable:=scp;
  Process1.Parameters.Add('-B');
  Process1.Parameters.Add('-q');
  Process1.Parameters.Add(remotefile);
  Process1.Parameters.Add(TMPFILE);
  Process1.Options:=[poWaitOnExit];
  try
    Process1.Execute;
  except
    download:=false;
  end;
  if Process1.ExitStatus<>0 then download:=false;
  if not download then
  begin
    background;
    header(APPNAME+' v'+VERSION+' * Select source file to edit');
    footer(bottom-1,'');
    textcolor(lightgray); textbackground(black); gotoxy(1,bottom); clreol;
    write('ERROR: Cannot download file, using default values.');
  end;
  Process1.Free;
  delay(3000);
end;

// upload a file to remote unit
function upload(remotefile:string): boolean;
var
  Process2: TProcess;

  function extractusername(rfn: string): string;
  var
    un: string;
    bb: byte;
  begin
    un:='';
    for bb:=1 to length(rfn) do
      if rfn[bb]<>':' then un:=un+rfn[bb] else break;
    extractusername:=un;
  end;

begin
  footer(bottom-1,'');
  textcolor(lightgray);textbackground(black);
  gotoxy(1,bottom); clreol; write('Uploading...');
  upload:=true;
  Process2:=TProcess.Create(nil);
  Process2.Executable:=scp;
  Process2.Parameters.Add('-B');
  Process2.Parameters.Add('-q');
  Process2.Parameters.Add(TMPFILE);
  Process2.Parameters.Add(remotefile);
  Process2.Options:=[poWaitOnExit];
  try
    Process2.Execute;
  except
    upload:=false;
  end;
  if Process2.ExitStatus<>0 then upload:=false;
  if not upload then
  begin
    background;
    header(APPNAME+' v'+VERSION+' * Select target file to upload');
    footer(bottom-1,'');
    textcolor(lightgray); textbackground(black); gotoxy(1,bottom); clreol;
    write('ERROR: Cannot upload file, try again!');
    delay(3000);
    Process2.Free;
    exit;
  end;
  Process2.Free;
  footer(bottom-1,'');
  textcolor(lightgray);textbackground(black);
  gotoxy(1,bottom); clreol; write('Restart daemon...');
  Process2:=TProcess.Create(nil);
  Process2.Executable:=ssh;
  Process2.Parameters.Clear;
  Process2.Parameters.Add('-q');
  Process2.Parameters.Add(extractusername(remotefile));
  Process2.Parameters.Add('mm3d-stopdaemon');
  Process2.Parameters.Add('> /dev/null');
  Process2.Options:=[poWaitOnExit];
  try
    Process2.Execute;
  except
    upload:=false;
  end;
  Process2.Free;
  Process2:=TProcess.Create(nil);
  Process2.Executable:=ssh;
  Process2.Parameters.Clear;
  Process2.Parameters.Add('-q');
  Process2.Parameters.Add(extractusername(remotefile));
  Process2.Parameters.Add('mm3d-startdaemon');
  Process2.Parameters.Add('> /dev/null');
  Process2.Options:=[poWaitOnExit];
  try
    Process2.Execute;
  except
    upload:=false;
  end;
  if Process2.ExitStatus<>0 then upload:=false;
  if not upload then
  begin
    background;
    header(APPNAME+' v'+VERSION+' * Select target file to upload');
    footer(bottom-1,'');
    textcolor(lightgray); textbackground(black); gotoxy(1,bottom); clreol;
    write('ERROR: Cannot upload file, try again!');
    delay(3000);
  end;
  Process2.Free;
end;
