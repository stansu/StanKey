(
	HiddenDOSCommand "c:\\stankey-master\\key\\cc\\3dsMax\\ahk\\circleStartEdge.ahk" donotwait:true startpath:"c:\\stankey-master\\key\\cc\\3dsMax\\ahk\\"
	fn setCircle n =
	(
		n.steps = 1
		n.adaptive = off
	)
	a = startObjectCreation Circle newNodeCallback:setCircle
)
