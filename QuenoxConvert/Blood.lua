local script = game:GetObjects("rbxassetid://10260037879")[1]
local ORIGCF=CFrame.new
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end;CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end;},{__index=math;})
local CFrame=setmetatable({new=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.new(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;},{__index=CFrame;})
local Instance=setmetatable({new = function(type,args) local instance = Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent = args elseif string.lower(typeof(args)) == "table" then for i,v in pairs(args) do pcall(function() instance[i] = v end) end end end return instance end;Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance;})
--}{		Default Functions	   }{--
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
local palette=BrickColor.palatte
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
--
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end
function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
	local S=ins("Sound",{Volume=Volume or 1;Pitch=Pitch or 1;MaxDistance=MaxDistance or 500;EmitterSize=EmitterSize or 5;Looped=Looped or true;SoundId="rbxassetid://"..Id,Parent=Parent})
	S:Play()
	coroutine.wrap(function()
		if S.IsLoaded then
			Instance.Remove(S,S.TimeLength/S.Pitch)
		else
			S.Loaded:Connect(function()
				Instance.Remove(S,S.TimeLength/S.Pitch)
			end)
		end
	end)()
	return S
end
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
--
local Effects,Char,Player
local Blood=setmetatable({},{__call=function(self) Effects=getfenv(2)["BLOODPARENT"] Char=getfenv(2)["char"] or getfenv(2)["Char"] Player=getfenv(2)["owner"] or getfenv(2)["Player"] end})
--
local RaySides={v3(0,100,0);v3(0,-100,0);v3(0,0,100);v3(0,0,-100);v3(100,0,0);v3(-100,0,0);v3(100,100,0);v3(-100,100,0);v3(100,-100,0);v3(-100,-100,0);v3(0,100,100);v3(0,100,-100);v3(0,-100,100);v3(0,-100,-100);v3(100,100,100);v3(100,-100,100);v3(100,100,-100);v3(100,-100,-100);v3(-100,100,100);v3(-100,-100,100);v3(-100,100,-100);v3(-100,-100,-100);v3(100,100,-100);v3(-100,-100,100);v3(-100,100,-100);v3(100,-100,100);}
local Drop=script:WaitForChild("Drop")
local MPiece=script:WaitForChild("MeatPiece")
--
Blood.new=setmetatable({},{
	__call=function(self,Pos,Dir,Scale,Ignore)
		Scale=Scale or 1
		local Drop=Drop:Clone()
		if Player then pcall(function() Drop:SetNetworkOwner(Player) end) end
		Drop.CFrame=Pos
		Drop.Hitbox.CFrame=Pos*cf(0,random(-180,180),0,true)
		Drop.Parent=Effects
		local Velocity=ins("BodyVelocity",{Velocity=Dir;Parent=Drop})
		local Stats={Drop=Drop;CenterAtt=Drop.CenterAtt;BloodTrail=Drop.BloodTrail;SingleAtt1=Drop.SingleAtt1;SingleAtt2=Drop.SingleAtt2;Hitbox=Drop.Hitbox;PairedWith={};}
		Instance.Remove(Velocity,random(.1,.25,100))
		Instance.Remove(Drop,random(3,5,10))
		Stats.SingleAtt1.Position,Stats.SingleAtt2.Position=v3(-.2*Scale,0,0),v3(.2*Scale,0,0)
		local Connection;
		Connection=Stats.Hitbox.Touched:Connect(function(Hit)
			if Hit:IsDescendantOf(Char) or Hit:IsDescendantOf(Effects) or (Ignore and Hit:IsDescendantOf(Ignore)) then return end
			if random(0,1,3)==1 or Hit.Material==Enum.Material.Water then
				Connection:Disconnect()
				Instance.Remove(Stats.Hitbox)
				Instance.Remove(Stats.Drop,1)
				Stats.Drop.Anchored=true
				Stats.Drop.CanCollide=false
				Stats.Drop.BloodDrops.Enabled=false
				local Position=Stats.Drop.Position
					for i,v in pairs(RaySides) do
						local RHit,RPos,RNID=Raycast(Position,(Position+v)-Position,{Char,Effects,Ignore},3.5,true)
						if RHit then
							local Size=random(.1,.2,100)*Scale
							local LifeTime=random(5,12.5,10)
							local FadeTime=Size/random(3,5,10)
							local Puddle=ins("Part",{CFrame=ORIGCF(RPos,RPos+RNID)*cf(90,0,0,true);FormFactor=Enum.FormFactor.Custom;Size=v3(Size/10,0,Size/10);Material=Enum.Material.Glass;Color=bc("Maroon").Color;Transparency=.2;Massless=true;Locked=true;CanCollide=false;Name="BloodPuddle";Parent=Effects})
							local Mesh=ins("SpecialMesh",{MeshType="Sphere";Parent=Puddle})
							Sound(685857471,.02,random(.9,1.2,100),Puddle,50,1,false)
							Puddle.Parent=ins("WeldConstraint",{Part0=RHit;Part1=Puddle;Parent=RHit})
							Instance.Remove(Puddle,LifeTime+FadeTime)
							Tween(Puddle,{Size=v3(Size,0,Size)},{Size/random(5,7,10);Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;0})
							Tween(Mesh,{Scale=v3()},{FadeTime;Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;LifeTime})
							break
						end
					end
				return
			end
			local Position=Stats.Drop.Position
			for i,v in pairs(workspace:FindPartsInRegion3WithIgnoreList(Region3.new(Position-v3(1.5,1.5,1.5)*Scale,Position+v3(1.5,1.5,1.5)*Scale),{},40)) do
				if v.Name=="BloodPuddle" then
					local Size=random(.05,.25,100)*Scale
					Tween(v,{Size=v.Size+v3(Size,0,Size)},{random(.1,.2,10);Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;0})
				end
			end
			for i,v in pairs(RaySides) do
				local RHit,RPos,RNID=Raycast(Position,(Position+v)-Position,{Char,Effects,Ignore},3.5*Scale,true)
				if RHit and not (RHit:IsDescendantOf(Char) or RHit:IsDescendantOf(Effects)) and RHit.Name~="BloodPuddle" then
					local Size=random(.5,1,100)*Scale
					local LifeTime=random(5,10,10)
					local FadeTime=Size/random(1.5,2.5,10)
					local Puddle=ins("Part",{CFrame=ORIGCF(RPos,RPos+RNID)*cf(90,0,0,true);FormFactor=Enum.FormFactor.Custom;Size=v3(Size/10,0,Size/10);Material=Enum.Material.Glass;Color=bc("Maroon").Color;Transparency=.2;Massless=true;Locked=true;CanCollide=false;Name="BloodPuddle";Parent=Effects})
					local Mesh=ins("SpecialMesh",{MeshType="Sphere";Parent=Puddle})
					Sound(685857471,.02,random(.9,1.2,100),Puddle,50,1,false)
					local WE=ins("WeldConstraint",{Part0=RHit;Part1=Puddle;Parent=RHit}) Puddle.Parent=WE
					Instance.Remove(Puddle,LifeTime+FadeTime)
					Tween(Puddle,{Size=v3(Size,0,Size)},{Size/random(9,11,10);Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;0})
					Tween(Mesh,{Scale=v3()},{FadeTime;Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;LifeTime})
					return
				end
			end
		end)
	end,
	__metatable=false
})
Blood.new.MeatPiece=function(Pos,Dir,Scale)
    local P=MPiece:Clone() P.Size=v3(random(.7,1.2,100),random(.7,1.2,100),random(.7,1.2,100))*Scale P.CFrame=Pos P.Parent=Effects
	local Deb,DebTime=false,.1
	Instance.Remove(ins("BodyVelocity",{Velocity=Dir;Parent=Drop}),.1) Instance.Remove(P,random(5,15))
	P.Touched:Connect(function(Hit)
		if Deb then return end
		local Vel=Hit.Velocity.Magnitude>10 or P.Velocity.Magnitude>10
		if Vel then
			Deb=true
			Sound(2053476174,.2,random(.9,1.1,100),P,100,5).TimePosition=1.39
			wait(DebTime)
			Deb=false
		end
	end)
end
return Blood
