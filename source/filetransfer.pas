{ +--------------------------------------------------------------------------+ }
{ | MMEEC v0.1 * Environment characteristics editor                          | }
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
function selectremotefile: byte;
begin
end;

// download a file from remote unit
function download(remotefile:string): boolean;
var
  Process1: TProcess;
begin
  download:=true;
  Process1:=TProcess.Create(nil);
  Process1.Executable:=scp;
  Process1.Parameters.Add(remotefile);
  Process1.Parameters.Add(TMPFILE);
  try
    Process1.Execute;
  except
    download:=false;
  end;
  if Process1.ExitCode<>0 then download:=false;
  Process1.Free
end;

// upload a file to remote unit
function upload(remotefile:string): boolean;
var
  Process2: TProcess;
begin
  upload:=true;
  Process2:=TProcess.Create(nil);
  Process2.Executable:=scp;
  Process2.Parameters.Add(TMPFILE);
  Process2.Parameters.Add(remotefile);
  try
    Process2.Execute;
  except
    upload:=false;
  end;
  if Process2.ExitCode<>0 then upload:=false;
  Process2.Free
end;
