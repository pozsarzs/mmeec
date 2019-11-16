{ +--------------------------------------------------------------------------+ }
{ | MMEEC v0.1 * Environment characteristics editor                          | }
{ | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@.szerafingomba.hu>         | }
{ | page2screen.pas                                                          | }
{ | Show screen content of page #2                                           | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.
//
//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

// show page #2
procedure page2screen;
begin
  header(APPNAME+' v'+VERSION+' * Settings page 2/8: Growing hyphae - heating');
  textcolor(white);
  gotoxy(4,3); writeln('Minimal temperature:');
  gotoxy(4,4); writeln('Heating switch-on temperature:');
  gotoxy(4,5); writeln('Heating switch-off temperature:');
  gotoxy(4,6); writeln('Maximal temperature:');
  if htempmin>9 then gotoxy(45,3) else gotoxy(46,3); writeln(htempmin,' °C');
  if htempon>9 then gotoxy(45,4) else gotoxy(46,4); writeln(htempon,' °C');
  if htempoff>9 then gotoxy(45,5) else gotoxy(46,5); writeln(htempoff,' °C');
  if htempmax>9 then gotoxy(45,6) else gotoxy(46,6); writeln(htempmax,' °C');
  gotoxy(4,9); writeln('Disable heater (0/1):');
  gotoxy(4,10); writeln(' 0.00...0.59 ',hheaterdis[0]);
  gotoxy(4,11); writeln(' 1.00...1.59 ',hheaterdis[1]);
  gotoxy(4,12); writeln(' 2.00...2.59 ',hheaterdis[2]);
  gotoxy(4,13); writeln(' 3.00...3.59 ',hheaterdis[3]);
  gotoxy(4,14); writeln(' 4.00...4.59 ',hheaterdis[4]);
  gotoxy(4,15); writeln(' 5.00...5.59 ',hheaterdis[5]);
  gotoxy(4,16); writeln(' 6.00...6.59 ',hheaterdis[6]);
  gotoxy(4,17); writeln(' 7.00...7.59 ',hheaterdis[7]);
  gotoxy(4,18); writeln(' 8.00...8.59 ',hheaterdis[8]);
  gotoxy(4,19); writeln(' 9.00...9.59 ',hheaterdis[9]);
  gotoxy(4,20); writeln('10.00..10.59 ',hheaterdis[10]);
  gotoxy(4,21); writeln('11.00..11.59 ',hheaterdis[11]);
  gotoxy(22,10); writeln('12.00..12.59 ',hheaterdis[12]);
  gotoxy(22,11); writeln('13.00..13.59 ',hheaterdis[13]);
  gotoxy(22,12); writeln('14.00..14.59 ',hheaterdis[14]);
  gotoxy(22,13); writeln('15.00..15.59 ',hheaterdis[15]);
  gotoxy(22,14); writeln('16.00..16.59 ',hheaterdis[16]);
  gotoxy(22,15); writeln('17.00..17.59 ',hheaterdis[17]);
  gotoxy(22,16); writeln('18.00..18.59 ',hheaterdis[18]);
  gotoxy(22,17); writeln('19.00..19.59 ',hheaterdis[19]);
  gotoxy(22,18); writeln('20.00..20.59 ',hheaterdis[20]);
  gotoxy(22,19); writeln('21.00..21.59 ',hheaterdis[21]);
  gotoxy(22,20); writeln('22.00..22.59 ',hheaterdis[22]);
  gotoxy(22,21); writeln('23.00..23.59 ',hheaterdis[23]);
end;
