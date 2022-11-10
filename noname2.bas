$regfile = "m16def.dat"
$crystal = 1000000
Config Portc = Output
Config Lcd = 16 * 2
 Config Lcdpin = Pin , Db4 = Portd.2 , Db5 = Portd.3 , Db6 = Portd.4 , Db7 = Portd.5 , E = Portd.1 , Rs = Portd.0

Config Adc = Single , Prescaler = Auto , Reference = Off
Start Adc
Enable Adc
Dim A As Word , B As Single , D As Single , M As Word , F As Word , R As Single , K As Word , P As Single , Y As Single , X As Single

Config Single = Scientific , Digits = 2
Cursor Off
Do
A = Getadc(0)
K = Getadc(2)
B = A - K
P = B / 100

M = Getadc(1)
F = M / 204.6

D = F / 100
R = P / D

Locate 2 , 10 : Lcd R ; "R"
Locate 2 , 1 : Lcd "I="
Locate 2 , 4 : Lcd D ; "A"
Locate 1 , 1 : Lcd "V= "
Locate 1 , 4 : Lcd P ; "Volt "
Wait 1

'------------------------------------------------------------------------------------------------------------'

Cls
Loop
End