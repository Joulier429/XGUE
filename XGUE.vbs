'�������
Dim x, y, m, n, map	'axle �� mapcreater�������ñ���
Dim player
player = 1
Dim act	'�ж�
Dim yy 'rules
Dim food, basicenemy, trap, dragon, zombie, kobold	'ʵ�壨��û����


'���庯��
Function enemy()	'����λ������
	basicenemy = Round(Rnd * 98)
	If basicenemy > x * y Or basicenemy = player Then
	enemy()
	End If
End Function

Function axle()	'��ͼ��С����
	randomize
	x = Round(Rnd * 9 + 1)
	y = Round(Rnd * 9 + 1)
	If x < 5 Then
	axle()
	End If
	If y < 3 Then
	axle()
	End If
End Function

Function mapcreater()	'��ͼ�����ߣ���д����ģ���д�ձ�ģ�
	map = ""
	n = 0
	m = 1
	yy = y - 1
	Do Until n = x * y
	n = n + 1
	If n = x * m and n = player Then	
	map = map & "[P]" & Chr(13)
	m = m + 1
	Else If n = x * m Then
		map = map & "[0]" & Chr(13)
		m = m + 1
		Else If n = player Then
			map = map & "[P]"
			Else map = map & "[0]"
			End If
		End If
	End If
	Loop
	mapout()
End Function

Function mapout()	'��ͼ���
	MsgBox map,0,"XGUE"
	ipact()
End Function

Function ipact()	'�ж�����
	act = ""
	act = InputBox("","XGUE")
	actdo()
End Function

Function actdo()	'�ж�ִ��
	If act = "a" Then
	player = player - 1
	Else If act = "s" Then
		player = player + x
		Else If act = "w" Then
			player = player - x
			Else If act = "d" Then
				player = player + 1
				End If
			End If
		End If
	End If
	rules()
End Function

Function rules()	'����
	If player > x * y Then
	player = player - x
	MsgBox"The End Of The Room"
	End If
	mapcreater()
End Function


'����
MsgBox"XGUE",0,"XGUE"
MsgBox"Ver.0.2.2"
MsgBox"Author: Lynxh",0,"XGUE"
axle()
mapcreater()