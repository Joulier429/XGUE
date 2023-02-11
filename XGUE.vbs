'定义变量
Dim x, y, m, n, map	'axle 和 mapcreater函数所用变量
Dim player
player = 1
Dim act	'行动
Dim yy 'rules
Dim food, basicenemy, trap, dragon, zombie, kobold	'实体（还没做）


'定义函数
Function enemy()	'敌人位置生成
	basicenemy = Round(Rnd * 98)
	If basicenemy > x * y Or basicenemy = player Then
	enemy()
	End If
End Function

Function axle()	'地图大小定义
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

Function mapcreater()	'地图构建者（先写特殊的，再写普遍的）
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

Function mapout()	'地图输出
	MsgBox map,0,"XGUE"
	ipact()
End Function

Function ipact()	'行动输入
	act = ""
	act = InputBox("","XGUE")
	actdo()
End Function

Function actdo()	'行动执行
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

Function rules()	'规则
	If player > x * y Then
	player = player - x
	MsgBox"The End Of The Room"
	End If
	mapcreater()
End Function


'正文
MsgBox"XGUE",0,"XGUE"
MsgBox"Ver.0.2.2"
MsgBox"Author: Lynxh",0,"XGUE"
axle()
mapcreater()