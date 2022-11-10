$regfile = "m16def.dat"
$crystal = 1000000
Config Portb = Output
Config Lcd = 16 * 2
 Config Lcdpin = Pin , Db4 = Portb.2 , Db5 = Portb.3 , Db6 = Portb.4 , Db7 = Portb.5 , E = Portb.1 , Rs = Portb.0
 Locate 1 , 3 : Lcd "Ms products"
Locate 2 , 1 : Lcd "proudly peresents"
 Wait 2
 Cls

Config Adc = Single , Prescaler = Auto , Reference = Off
Start Adc
Enable Adc
Dim A As Integer , B As Single , D As Single , M As Integer , F As single , R As Single

Config Single = Scientific , Digits = 2
Cursor Off
Do
A = Getadc(7)
B = A / 68.2
M = Getadc(1)
F = M / 204.6
D = F / 100

R = B / D
Locate 2 , 11 : Lcd "R="
Locate 2 , 13 : Lcd R ; "o"
Locate 2 , 1 : Lcd "I="
Locate 2 , 4 : Lcd D ; "A"
Locate 1 , 1 : Lcd "V= "
Locate 1 , 4 : Lcd B ; "Volt "
Wait 1
Cls
Loop
End
