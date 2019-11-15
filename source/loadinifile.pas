{ +--------------------------------------------------------------------------+ }
{ | MMEEC v0.1 * Environment characteristics editor                          | }
{ | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@.szerafingomba.hu>         | }
{ | loadinifile.pas                                                          | }
{ | Load configuration from ini file                                         | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.
//
//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

// load condfiguration file
function loadconfig(filename: string): boolean;
var
  iif: TINIFile;
  b: byte;
begin
  iif := TIniFile.Create(filename);
  loadconfig:=true;
  try
    pathssh:=iif.ReadString('local_paths','ssh','/usr/bin/ssh');
    pathscp:=iif.ReadString('local_paths','scp','/usr/bin/scp');
    for b:=0 to 15 do
      pathremotefiles[b]:=iif.ReadString('remote_paths','file'+inttostr(b),'');
  except
    loadconfig:=false;
  end;
  iif.Free;
end;

// load environment characteristics file
function loadenvirchar(filename: string): boolean;
var
  iif: TINIFile;
begin
  iif := TIniFile.Create(filename);
  loadenvirchar:=true;
  try
    hhummax:=strtoint(iif.ReadString('hyphae','humidity_max','0'));
    hhummin:=strtoint(iif.ReadString('hyphae','humidity_min','0'));
    hhumoff:=strtoint(iif.ReadString('hyphae','humidifier_off','0'));
    hhumon:=strtoint(iif.ReadString('hyphae','humidifier_on','0'));
    hhumdis[0]:=strtoint(iif.ReadString('hyphae','humidifier_disable_00','0'));
    hhumdis[1]:=strtoint(iif.ReadString('hyphae','humidifier_disable_01','0'));
    hhumdis[2]:=strtoint(iif.ReadString('hyphae','humidifier_disable_02','0'));
    hhumdis[3]:=strtoint(iif.ReadString('hyphae','humidifier_disable_03','0'));
    hhumdis[4]:=strtoint(iif.ReadString('hyphae','humidifier_disable_04','0'));
    hhumdis[5]:=strtoint(iif.ReadString('hyphae','humidifier_disable_05','0'));
    hhumdis[6]:=strtoint(iif.ReadString('hyphae','humidifier_disable_06','0'));
    hhumdis[7]:=strtoint(iif.ReadString('hyphae','humidifier_disable_07','0'));
    hhumdis[8]:=strtoint(iif.ReadString('hyphae','humidifier_disable_08','0'));
    hhumdis[9]:=strtoint(iif.ReadString('hyphae','humidifier_disable_09','0'));
    hhumdis[10]:=strtoint(iif.ReadString('hyphae','humidifier_disable_10','0'));
    hhumdis[11]:=strtoint(iif.ReadString('hyphae','humidifier_disable_11','0'));
    hhumdis[12]:=strtoint(iif.ReadString('hyphae','humidifier_disable_12','0'));
    hhumdis[13]:=strtoint(iif.ReadString('hyphae','humidifier_disable_13','0'));
    hhumdis[14]:=strtoint(iif.ReadString('hyphae','humidifier_disable_14','0'));
    hhumdis[15]:=strtoint(iif.ReadString('hyphae','humidifier_disable_15','0'));
    hhumdis[16]:=strtoint(iif.ReadString('hyphae','humidifier_disable_16','0'));
    hhumdis[17]:=strtoint(iif.ReadString('hyphae','humidifier_disable_17','0'));
    hhumdis[18]:=strtoint(iif.ReadString('hyphae','humidifier_disable_18','0'));
    hhumdis[19]:=strtoint(iif.ReadString('hyphae','humidifier_disable_19','0'));
    hhumdis[20]:=strtoint(iif.ReadString('hyphae','humidifier_disable_20','0'));
    hhumdis[21]:=strtoint(iif.ReadString('hyphae','humidifier_disable_21','0'));
    hhumdis[22]:=strtoint(iif.ReadString('hyphae','humidifier_disable_22','0'));
    hhumdis[23]:=strtoint(iif.ReadString('hyphae','humidifier_disable_23','0'));
    hhummax:=strtoint(iif.ReadString('hyphae','humidity_max','0'));
    hhummin:=strtoint(iif.ReadString('hyphae','humidity_min','0'));
    hhumoff:=strtoint(iif.ReadString('hyphae','humidifier_off','0'));
    hhumon:=strtoint(iif.ReadString('hyphae','humidifier_on','0'));
    htempmin:=strtoint(iif.ReadString('hyphae','temperature_min','0'));
    htempon:=strtoint(iif.ReadString('hyphae','heater_on','0'));
    htempoff:=strtoint(iif.ReadString('hyphae','heater_off','0'));
    htempmax:=strtoint(iif.ReadString('hyphae','temperature_max','0'));
    hheaterdis[0]:=strtoint(iif.ReadString('hyphae','heater_disable_00','0'));
    hheaterdis[1]:=strtoint(iif.ReadString('hyphae','heater_disable_01','0'));
    hheaterdis[2]:=strtoint(iif.ReadString('hyphae','heater_disable_02','0'));
    hheaterdis[3]:=strtoint(iif.ReadString('hyphae','heater_disable_03','0'));
    hheaterdis[4]:=strtoint(iif.ReadString('hyphae','heater_disable_04','0'));
    hheaterdis[5]:=strtoint(iif.ReadString('hyphae','heater_disable_05','0'));
    hheaterdis[6]:=strtoint(iif.ReadString('hyphae','heater_disable_06','0'));
    hheaterdis[7]:=strtoint(iif.ReadString('hyphae','heater_disable_07','0'));
    hheaterdis[8]:=strtoint(iif.ReadString('hyphae','heater_disable_08','0'));
    hheaterdis[9]:=strtoint(iif.ReadString('hyphae','heater_disable_09','0'));
    hheaterdis[10]:=strtoint(iif.ReadString('hyphae','heater_disable_10','0'));
    hheaterdis[11]:=strtoint(iif.ReadString('hyphae','heater_disable_11','0'));
    hheaterdis[12]:=strtoint(iif.ReadString('hyphae','heater_disable_12','0'));
    hheaterdis[13]:=strtoint(iif.ReadString('hyphae','heater_disable_13','0'));
    hheaterdis[14]:=strtoint(iif.ReadString('hyphae','heater_disable_14','0'));
    hheaterdis[15]:=strtoint(iif.ReadString('hyphae','heater_disable_15','0'));
    hheaterdis[16]:=strtoint(iif.ReadString('hyphae','heater_disable_16','0'));
    hheaterdis[17]:=strtoint(iif.ReadString('hyphae','heater_disable_17','0'));
    hheaterdis[18]:=strtoint(iif.ReadString('hyphae','heater_disable_18','0'));
    hheaterdis[19]:=strtoint(iif.ReadString('hyphae','heater_disable_19','0'));
    hheaterdis[20]:=strtoint(iif.ReadString('hyphae','heater_disable_20','0'));
    hheaterdis[21]:=strtoint(iif.ReadString('hyphae','heater_disable_21','0'));
    hheaterdis[22]:=strtoint(iif.ReadString('hyphae','heater_disable_22','0'));
    hheaterdis[23]:=strtoint(iif.ReadString('hyphae','heater_disable_23','0'));
    hlightson1:=strtoint(iif.ReadString('hyphae','light_on1','0'));
    hlightsoff1:=strtoint(iif.ReadString('hyphae','light_off1','0'));
    hlightson2:=strtoint(iif.ReadString('hyphae','light_on2','0'));
    hlightsoff2:=strtoint(iif.ReadString('hyphae','light_off2','0'));
    hventon:=strtoint(iif.ReadString('hyphae','vent_on','0'));
    hventoff:=strtoint(iif.ReadString('hyphae','vent_off','0'));
    hventdis[0]:=strtoint(iif.ReadString('hyphae','vent_disable_00','0'));
    hventdis[1]:=strtoint(iif.ReadString('hyphae','vent_disable_01','0'));
    hventdis[2]:=strtoint(iif.ReadString('hyphae','vent_disable_02','0'));
    hventdis[3]:=strtoint(iif.ReadString('hyphae','vent_disable_03','0'));
    hventdis[4]:=strtoint(iif.ReadString('hyphae','vent_disable_04','0'));
    hventdis[5]:=strtoint(iif.ReadString('hyphae','vent_disable_05','0'));
    hventdis[6]:=strtoint(iif.ReadString('hyphae','vent_disable_06','0'));
    hventdis[7]:=strtoint(iif.ReadString('hyphae','vent_disable_07','0'));
    hventdis[8]:=strtoint(iif.ReadString('hyphae','vent_disable_08','0'));
    hventdis[9]:=strtoint(iif.ReadString('hyphae','vent_disable_09','0'));
    hventdis[10]:=strtoint(iif.ReadString('hyphae','vent_disable_10','0'));
    hventdis[11]:=strtoint(iif.ReadString('hyphae','vent_disable_11','0'));
    hventdis[12]:=strtoint(iif.ReadString('hyphae','vent_disable_12','0'));
    hventdis[13]:=strtoint(iif.ReadString('hyphae','vent_disable_13','0'));
    hventdis[14]:=strtoint(iif.ReadString('hyphae','vent_disable_14','0'));
    hventdis[15]:=strtoint(iif.ReadString('hyphae','vent_disable_15','0'));
    hventdis[16]:=strtoint(iif.ReadString('hyphae','vent_disable_16','0'));
    hventdis[17]:=strtoint(iif.ReadString('hyphae','vent_disable_17','0'));
    hventdis[18]:=strtoint(iif.ReadString('hyphae','vent_disable_18','0'));
    hventdis[19]:=strtoint(iif.ReadString('hyphae','vent_disable_19','0'));
    hventdis[20]:=strtoint(iif.ReadString('hyphae','vent_disable_20','0'));
    hventdis[21]:=strtoint(iif.ReadString('hyphae','vent_disable_21','0'));
    hventdis[22]:=strtoint(iif.ReadString('hyphae','vent_disable_22','0'));
    hventdis[23]:=strtoint(iif.ReadString('hyphae','vent_disable_23','0'));
    hventdislowtemp[0]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_00','0'));
    hventdislowtemp[1]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_01','0'));
    hventdislowtemp[2]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_02','0'));
    hventdislowtemp[3]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_03','0'));
    hventdislowtemp[4]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_04','0'));
    hventdislowtemp[5]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_05','0'));
    hventdislowtemp[6]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_06','0'));
    hventdislowtemp[7]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_07','0'));
    hventdislowtemp[8]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_08','0'));
    hventdislowtemp[9]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_09','0'));
    hventdislowtemp[10]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_10','0'));
    hventdislowtemp[11]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_11','0'));
    hventdislowtemp[12]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_12','0'));
    hventdislowtemp[13]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_13','0'));
    hventdislowtemp[14]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_14','0'));
    hventdislowtemp[15]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_15','0'));
    hventdislowtemp[16]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_16','0'));
    hventdislowtemp[17]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_17','0'));
    hventdislowtemp[18]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_18','0'));
    hventdislowtemp[19]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_19','0'));
    hventdislowtemp[20]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_20','0'));
    hventdislowtemp[21]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_21','0'));
    hventdislowtemp[22]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_22','0'));
    hventdislowtemp[23]:=strtoint(iif.ReadString('hyphae','vent_disablelowtemp_23','0'));
    hventlowtemp:=strtoint(iif.ReadString('hyphae','vent_lowtemp','0'));
    mhummax:=strtoint(iif.ReadString('mushroom','humidity_max','0'));
    mhummin:=strtoint(iif.ReadString('mushroom','humidity_min','0'));
    mhumoff:=strtoint(iif.ReadString('mushroom','humidifier_off','0'));
    mhumon:=strtoint(iif.ReadString('mushroom','humidifier_on','0'));
    mhumdis[0]:=strtoint(iif.ReadString('mushroom','humidifier_disable_00','0'));
    mhumdis[1]:=strtoint(iif.ReadString('mushroom','humidifier_disable_01','0'));
    mhumdis[2]:=strtoint(iif.ReadString('mushroom','humidifier_disable_02','0'));
    mhumdis[3]:=strtoint(iif.ReadString('mushroom','humidifier_disable_03','0'));
    mhumdis[4]:=strtoint(iif.ReadString('mushroom','humidifier_disable_04','0'));
    mhumdis[5]:=strtoint(iif.ReadString('mushroom','humidifier_disable_05','0'));
    mhumdis[6]:=strtoint(iif.ReadString('mushroom','humidifier_disable_06','0'));
    mhumdis[7]:=strtoint(iif.ReadString('mushroom','humidifier_disable_07','0'));
    mhumdis[8]:=strtoint(iif.ReadString('mushroom','humidifier_disable_08','0'));
    mhumdis[9]:=strtoint(iif.ReadString('mushroom','humidifier_disable_09','0'));
    mhumdis[10]:=strtoint(iif.ReadString('mushroom','humidifier_disable_10','0'));
    mhumdis[11]:=strtoint(iif.ReadString('mushroom','humidifier_disable_11','0'));
    mhumdis[12]:=strtoint(iif.ReadString('mushroom','humidifier_disable_12','0'));
    mhumdis[13]:=strtoint(iif.ReadString('mushroom','humidifier_disable_13','0'));
    mhumdis[14]:=strtoint(iif.ReadString('mushroom','humidifier_disable_14','0'));
    mhumdis[15]:=strtoint(iif.ReadString('mushroom','humidifier_disable_15','0'));
    mhumdis[16]:=strtoint(iif.ReadString('mushroom','humidifier_disable_16','0'));
    mhumdis[17]:=strtoint(iif.ReadString('mushroom','humidifier_disable_17','0'));
    mhumdis[18]:=strtoint(iif.ReadString('mushroom','humidifier_disable_18','0'));
    mhumdis[19]:=strtoint(iif.ReadString('mushroom','humidifier_disable_19','0'));
    mhumdis[20]:=strtoint(iif.ReadString('mushroom','humidifier_disable_20','0'));
    mhumdis[21]:=strtoint(iif.ReadString('mushroom','humidifier_disable_21','0'));
    mhumdis[22]:=strtoint(iif.ReadString('mushroom','humidifier_disable_22','0'));
    mhumdis[23]:=strtoint(iif.ReadString('mushroom','humidifier_disable_23','0'));
    mhummax:=strtoint(iif.ReadString('mushroom','humidity_max','0'));
    mhummin:=strtoint(iif.ReadString('mushroom','humidity_min','0'));
    mhumoff:=strtoint(iif.ReadString('mushroom','humidifier_off','0'));
    mhumon:=strtoint(iif.ReadString('mushroom','humidifier_on','0'));
    mtempmin:=strtoint(iif.ReadString('mushroom','temperature_min','0'));
    mtempon:=strtoint(iif.ReadString('mushroom','heater_on','0'));
    mtempoff:=strtoint(iif.ReadString('mushroom','heater_off','0'));
    mtempmax:=strtoint(iif.ReadString('mushroom','temperature_max','0'));
    mheaterdis[0]:=strtoint(iif.ReadString('mushroom','heater_disable_00','0'));
    mheaterdis[1]:=strtoint(iif.ReadString('mushroom','heater_disable_01','0'));
    mheaterdis[2]:=strtoint(iif.ReadString('mushroom','heater_disable_02','0'));
    mheaterdis[3]:=strtoint(iif.ReadString('mushroom','heater_disable_03','0'));
    mheaterdis[4]:=strtoint(iif.ReadString('mushroom','heater_disable_04','0'));
    mheaterdis[5]:=strtoint(iif.ReadString('mushroom','heater_disable_05','0'));
    mheaterdis[6]:=strtoint(iif.ReadString('mushroom','heater_disable_06','0'));
    mheaterdis[7]:=strtoint(iif.ReadString('mushroom','heater_disable_07','0'));
    mheaterdis[8]:=strtoint(iif.ReadString('mushroom','heater_disable_08','0'));
    mheaterdis[9]:=strtoint(iif.ReadString('mushroom','heater_disable_09','0'));
    mheaterdis[10]:=strtoint(iif.ReadString('mushroom','heater_disable_10','0'));
    mheaterdis[11]:=strtoint(iif.ReadString('mushroom','heater_disable_11','0'));
    mheaterdis[12]:=strtoint(iif.ReadString('mushroom','heater_disable_12','0'));
    mheaterdis[13]:=strtoint(iif.ReadString('mushroom','heater_disable_13','0'));
    mheaterdis[14]:=strtoint(iif.ReadString('mushroom','heater_disable_14','0'));
    mheaterdis[15]:=strtoint(iif.ReadString('mushroom','heater_disable_15','0'));
    mheaterdis[16]:=strtoint(iif.ReadString('mushroom','heater_disable_16','0'));
    mheaterdis[17]:=strtoint(iif.ReadString('mushroom','heater_disable_17','0'));
    mheaterdis[18]:=strtoint(iif.ReadString('mushroom','heater_disable_18','0'));
    mheaterdis[19]:=strtoint(iif.ReadString('mushroom','heater_disable_19','0'));
    mheaterdis[20]:=strtoint(iif.ReadString('mushroom','heater_disable_20','0'));
    mheaterdis[21]:=strtoint(iif.ReadString('mushroom','heater_disable_21','0'));
    mheaterdis[22]:=strtoint(iif.ReadString('mushroom','heater_disable_22','0'));
    mheaterdis[23]:=strtoint(iif.ReadString('mushroom','heater_disable_23','0'));
    mlightson1:=strtoint(iif.ReadString('mushroom','light_on1','0'));
    mlightsoff1:=strtoint(iif.ReadString('mushroom','light_off1','0'));
    mlightson2:=strtoint(iif.ReadString('mushroom','light_on2','0'));
    mlightsoff2:=strtoint(iif.ReadString('mushroom','light_off2','0'));
    mventon:=strtoint(iif.ReadString('mushroom','vent_on','0'));
    mventoff:=strtoint(iif.ReadString('mushroom','vent_off','0'));
    mventdis[0]:=strtoint(iif.ReadString('mushroom','vent_disable_00','0'));
    mventdis[1]:=strtoint(iif.ReadString('mushroom','vent_disable_01','0'));
    mventdis[2]:=strtoint(iif.ReadString('mushroom','vent_disable_02','0'));
    mventdis[3]:=strtoint(iif.ReadString('mushroom','vent_disable_03','0'));
    mventdis[4]:=strtoint(iif.ReadString('mushroom','vent_disable_04','0'));
    mventdis[5]:=strtoint(iif.ReadString('mushroom','vent_disable_05','0'));
    mventdis[6]:=strtoint(iif.ReadString('mushroom','vent_disable_06','0'));
    mventdis[7]:=strtoint(iif.ReadString('mushroom','vent_disable_07','0'));
    mventdis[8]:=strtoint(iif.ReadString('mushroom','vent_disable_08','0'));
    mventdis[9]:=strtoint(iif.ReadString('mushroom','vent_disable_09','0'));
    mventdis[10]:=strtoint(iif.ReadString('mushroom','vent_disable_10','0'));
    mventdis[11]:=strtoint(iif.ReadString('mushroom','vent_disable_11','0'));
    mventdis[12]:=strtoint(iif.ReadString('mushroom','vent_disable_12','0'));
    mventdis[13]:=strtoint(iif.ReadString('mushroom','vent_disable_13','0'));
    mventdis[14]:=strtoint(iif.ReadString('mushroom','vent_disable_14','0'));
    mventdis[15]:=strtoint(iif.ReadString('mushroom','vent_disable_15','0'));
    mventdis[16]:=strtoint(iif.ReadString('mushroom','vent_disable_16','0'));
    mventdis[17]:=strtoint(iif.ReadString('mushroom','vent_disable_17','0'));
    mventdis[18]:=strtoint(iif.ReadString('mushroom','vent_disable_18','0'));
    mventdis[19]:=strtoint(iif.ReadString('mushroom','vent_disable_19','0'));
    mventdis[20]:=strtoint(iif.ReadString('mushroom','vent_disable_20','0'));
    mventdis[21]:=strtoint(iif.ReadString('mushroom','vent_disable_21','0'));
    mventdis[22]:=strtoint(iif.ReadString('mushroom','vent_disable_22','0'));
    mventdis[23]:=strtoint(iif.ReadString('mushroom','vent_disable_23','0'));
    mventdislowtemp[0]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_00','0'));
    mventdislowtemp[1]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_01','0'));
    mventdislowtemp[2]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_02','0'));
    mventdislowtemp[3]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_03','0'));
    mventdislowtemp[4]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_04','0'));
    mventdislowtemp[5]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_05','0'));
    mventdislowtemp[6]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_06','0'));
    mventdislowtemp[7]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_07','0'));
    mventdislowtemp[8]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_08','0'));
    mventdislowtemp[9]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_09','0'));
    mventdislowtemp[10]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_10','0'));
    mventdislowtemp[11]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_11','0'));
    mventdislowtemp[12]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_12','0'));
    mventdislowtemp[13]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_13','0'));
    mventdislowtemp[14]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_14','0'));
    mventdislowtemp[15]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_15','0'));
    mventdislowtemp[16]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_16','0'));
    mventdislowtemp[17]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_17','0'));
    mventdislowtemp[18]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_18','0'));
    mventdislowtemp[19]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_19','0'));
    mventdislowtemp[20]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_20','0'));
    mventdislowtemp[21]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_21','0'));
    mventdislowtemp[22]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_22','0'));
    mventdislowtemp[23]:=strtoint(iif.ReadString('mushroom','vent_disablelowtemp_23','0'));
    mventlowtemp:=strtoint(iif.ReadString('mushroom','vent_lowtemp','0'));
  except
    loadenvirchar:=false;
  end;
  iif.Free;
end;
