-- "Graphic" notifications by v_Sado
-- UIListLayout is required
--
local Limit=5
local YSize=24
local Smoothing=math.floor((YSize/36)*10)
--
local Notif={}
local Notifications={}
--
local Copy=script.Notif:Clone() script.Notif:Destroy()
local NotifFrame=script.Parent.Body.Notifications
local NotifFramePos=NotifFrame.Position
local GUI=script.Parent
--
Notif.new=function(Text,Duration)
	assert(Text,"no text given")
	Duration=Duration or 2
	local C=Copy:Clone()
	C.TexT.Text=Text
	C.BG.Frame.UICorner.CornerRadius=UDim.new(0,Smoothing)
	C.LayoutOrder=1
	C.Parent=NotifFrame
	C.Size=UDim2.new(0,C.TexT.TextBounds.X+20,0,YSize)
	table.insert(Notifications,1,{C,Text,Duration,tick()})
	if #Notifications>Limit then Notifications[#Notifications][3]=0 end
	Notif:Update()
	game:GetService("Debris"):AddItem(C,Duration)
end
Notif.Remove=function(Index)
	if not Notifications[Index] then return end
	Notifications[Index][3]=0
	Notif:Update()
end
Notif.Update=function()
	NotifFrame.Position=NotifFramePos+UDim2.new(0,0,0,math.clamp(#game:GetService("Players"):GetPlayers()*60,0,GUI.AbsoluteSize.Y/2-36))
	if #Notifications<1 then return end
	for i=1,#Notifications do
		if not Notifications[i] then continue end
		Notifications[i][5]=i
		local v=Notifications[i]
		local C,Dur,ST=v[1],v[3],v[4]
		if tick()-ST>=Dur then C:Destroy() Notifications[i]=nil continue end
		local TS,BS,BG=C.TRs,C.BRs,C.BG.Frame
		local CSize=C.Size.X.Offset
		local Next,Prev=Notifications[i-1],Notifications[i+1]
		C.LayoutOrder=i
		if Next and Prev and (Next[1].Size.X.Offset<CSize and Prev[1].Size.X.Offset<CSize) then
			TS.Size=UDim2.new(0,0,1,0)
			BS.Size=UDim2.new(0,0,1,0)
			BG.Position=UDim2.new(0,0,1,0)
			BG.Size=UDim2.new(1,8,1,0)
		elseif Next and Prev then
			local TSize,BSize=Next[1].Size.X.Offset,Prev[1].Size.X.Offset
			TS.Size=UDim2.new(0,math.clamp(TSize-CSize,0,3000),1,0)
			BS.Size=UDim2.new(0,math.clamp(-(CSize-BSize),0,3000),1,0)
			BG.Position=UDim2.new(0,0,1,Smoothing)
			BG.Size=UDim2.new(1,8,1,Smoothing*2)
		elseif Next and Next[1].Size.X.Offset>CSize then
			local TSize=Next[1].Size.X.Offset
			TS.Size=UDim2.new(0,math.clamp(TSize-CSize,0,3000),1,0)
			BS.Size=UDim2.new(0,0,1,0)
			BG.Position=UDim2.new(0,0,1,TSize>CSize and 0 or Smoothing*2)
			BG.Size=UDim2.new(1,8,1,Smoothing*2)
		elseif Prev and Prev[1].Size.X.Offset>CSize then
			local BSize=Prev[1].Size.X.Offset
			BS.Size=UDim2.new(0,math.clamp(-(CSize-BSize),0,3000),1,0)
			TS.Size=UDim2.new(0,0,1,0)
			BG.Position=UDim2.new(0,0,1,BSize>CSize and Smoothing*2 or 0)
			BG.Size=UDim2.new(1,8,1,Smoothing*2)
		else
			TS.Size=UDim2.new(0,0,1,0)
			BS.Size=UDim2.new(0,0,1,0)
			BG.Position=UDim2.new(0,0,1,0)
			BG.Size=UDim2.new(1,8,1,0)
		end
	end
end
return Notif
