local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local cotan=math.CosSin
local floor=math.floor
local pi=math.pi
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
return function(P,Point,Size,Parent)
	if typeof(Point)=="Vector3" then Point=cf(Point) end
	local E1,E2,E3,E4,E5,E6=cf(Point.X,P.Size.Y/2,Point.Z),cf(-P.Size.X/2,Point.Y,Point.Z),cf(Point.X,-P.Size.Y/2,Point.Z),cf(P.Size.X/2,Point.Y,Point.Z),cf(Point.X,Point.Y,-P.Size.Z/2),cf(Point.X,Point.Y,P.Size.Z/2)
	--
	local Size1=v3(clamp((Point.Position-E4.Position).Magnitude-Size.X/2,0,P.Size.X),P.Size.Y,P.Size.Z)
	local Size2=v3(clamp((Point.Position-E2.Position).Magnitude-Size.X/2,0,P.Size.X),P.Size.Y,P.Size.Z)
	local B,L=math.max(Size1.X,Size2.X),math.min(Size1.X,Size2.X)
	local Size3=v3(clamp(Size.X,0,P.Size.X-B),clamp((Point.Position-E1.Position).Magnitude-Size.Y/2,0,P.Size.Y),P.Size.Z)
	local Size4=v3(clamp(Size.X,0,P.Size.X-B),clamp((Point.Position-E3.Position).Magnitude-Size.Y/2,0,P.Size.Y),P.Size.Z)
	local B1,L1=math.max(Size3.Y,Size4.Y),math.min(Size3.Y,Size4.Y)
	local Size5=v3(abs(Point.X)+Size.X>=P.Size.X/2 and P.Size.X-B or Size.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and P.Size.Y-B1 or Size.Y,clamp((Point.Position-E5.Position).Magnitude-Size.Z/2,0,P.Size.Z))
	local Size6=v3(abs(Point.X)+Size.X>=P.Size.X/2 and P.Size.X-B or Size.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and P.Size.Y-B1 or Size.Y,clamp((Point.Position-E6.Position).Magnitude-Size.Z/2,0,P.Size.Z))
	local BZ,BY=math.max(Size5.Z,Size6.Z),math.max(Size5.Y,Size6.Y)
	--
	local CF1=P.CFrame*cf(P.Size.X/2-Size1.X/2,0,0)
	local CF2=P.CFrame*cf(-P.Size.X/2+Size2.X/2,0,0)
	local CF3=P.CFrame*cf(Size.X+B>P.Size.X and (P.Size.X/2-Size3.X/2)*(Point.X<0 and -1 or 1) or Point.X,P.Size.Y/2-Size3.Y/2,0)
	local CF4=P.CFrame*cf(Size.X+B>P.Size.X and (P.Size.X/2-Size4.X/2)*(Point.X<0 and -1 or 1) or Point.X,-P.Size.Y/2+Size4.Y/2,0)
	local CF5=P.CFrame*cf(abs(Point.X)+Size.X>=P.Size.X/2 and (Point.X>0 and P.Size.X/2-Size5.X/2 or -P.Size.X/2+Size5.X/2) or Point.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and (Point.Y>0 and P.Size.Y/2-Size5.Y/2 or -P.Size.Y/2+Size5.Y/2) or Point.Y,-P.Size.Z/2+Size5.Z/2)
	local CF6=P.CFrame*cf(abs(Point.X)+Size.X>=P.Size.X/2 and (Point.X>0 and P.Size.X/2-Size6.X/2 or -P.Size.X/2+Size5.X/2) or Point.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and (Point.Y>0 and P.Size.Y/2-Size5.Y/2 or -P.Size.Y/2+Size5.Y/2) or Point.Y,P.Size.Z/2-Size6.Z/2)
	--
	local Images,Welds={},{}
	for i,v in pairs(P:GetChildren()) do
		if v:IsA("Decal") or v:IsA("Texture") then
			table.insert(Images,v:Clone())
		elseif v:IsA("Weld") or v:IsA("WeldConstraint") then
			table.insert(Welds,{v,v.Parent==P,v.Part0==P,v.Part1==P})
		end
	end
	local Parts={}
	if Size1.X>.04 then local P1=ins("Part",{Anchored=P.Anchored,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size1,CFrame=CF1,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P1 end table.insert(Parts,P1) end
	if Size2.X>.04 then local P2=ins("Part",{Anchored=P.Anchored,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size2,CFrame=CF2,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P2 end table.insert(Parts,P2) end
	if Size3.Y>.04 and Size3.X>.04 or B>=P.Size.X then local P3=ins("Part",{Anchored=P.Anchored,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size3,CFrame=CF3,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P3 end table.insert(Parts,P3) end
	if Size4.Y>.04 and Size4.X>.04 or B>=P.Size.X then local P4=ins("Part",{Anchored=P.Anchored,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size4,CFrame=CF4,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P4 end table.insert(Parts,P4) end
	if Size5.Y>.04 and Size5.X>.04 and Size5.Z>.04 then local P5=ins("Part",{Anchored=P.Anchored,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size5,CFrame=CF5,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P5 end table.insert(Parts,P5) end
	if Size6.Y>.04 and Size6.X>.04 and Size6.Z>.04 then local P6=ins("Part",{Anchored=P.Anchored,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size6,CFrame=CF6,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P6 end table.insert(Parts,P6) end
	if not P.Anchored then
		for i,v in pairs(Parts) do
			for _i,q in pairs(Parts) do
				if i~=_i then
					local CF=v.CFrame
					ins("Weld",{Part0=v,Part1=q,C0=q.CFrame:ToObjectSpace(CF),Parent=v})
				end
			end
		end
	end
	local OP=P.Parent
	P.Parent=nil
	return P,OP
end
