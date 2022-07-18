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
local CosSin=math.CosSin
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
return {
	GrabThrow={
		Waits={
			[1]=.15,
			[2]=.1,
			[3]=.1,
			[4]=.2,
			[5]=.1,
			[6]=.1,
			[7]=.15,
			[8]=.05,
			[9]=.1
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(3),math.rad(30),math.rad(0))},{0,Enum.EasingStyle.Back,Enum.EasingDirection.In,-1,false,0}},
			{"rutj",{C1=CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))},{0,Enum.EasingStyle.Back,Enum.EasingDirection.In,-1,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.05,-0.5)*CFrame.Angles(math.rad(120),math.rad(0),math.rad(-20))},{0,Enum.EasingStyle.Back,Enum.EasingDirection.In,-1,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Back,Enum.EasingDirection.In,-1,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(30),math.rad(0))*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Back,Enum.EasingDirection.In,-1,false,0}}
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(10),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=cf()},{.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=cf(0,-.05,0)*angles(30,20,3,true)},{.2,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.05,-0.25)*CFrame.Angles(math.rad(100),math.rad(0),math.rad(40))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0)*CFrame.Angles(math.rad(-1),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(10),math.rad(0))},{0,Enum.EasingStyle.Back,Enum.EasingDirection.In,-1,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.05,-0.25)*CFrame.Angles(math.rad(100),math.rad(0),math.rad(40))},{0,Enum.EasingStyle.Back,Enum.EasingDirection.In,-1,false,0}},
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(20),math.rad(0))},{.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.Angles(math.rad(0),math.rad(40),math.rad(0))},{.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.1,-0.1,-0.1)*CFrame.Angles(math.rad(50),math.rad(30),math.rad(-10))},{.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(-0.15,-0.05,-0.45)*CFrame.Angles(math.rad(110),math.rad(0),math.rad(-70))},{.3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0)*CFrame.Angles(math.rad(-10),math.rad(-20),math.rad(0))},{.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(5),math.rad(-5),math.rad(0))},{.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0}},
		},
		[5]={
			{"rutj",{C1=CFrame.Angles(math.rad(0),math.rad(40),math.rad(0))},{0,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,-1,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0)*CFrame.Angles(math.rad(-10),math.rad(-20),math.rad(0))},{0,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,-1,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(5),math.rad(-5),math.rad(0))},{0,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,-1,false,0}},
		},
		[6]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(10),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.Angles(math.rad(0),math.rad(60),math.rad(0))},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.3,-0.1,-0.1)*CFrame.Angles(math.rad(80),math.rad(30),math.rad(-50))},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(-0.4,0.05,-0.15)*CFrame.Angles(math.rad(130),math.rad(0),math.rad(-100))},{.15,Enum.EasingStyle.Circular,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(-20),math.rad(-20),math.rad(-10))},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,.3,-.45)*CFrame.Angles(math.rad(15),math.rad(-5),math.rad(0))},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}}
		},
		[7]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(-10),math.rad(0))},{.15,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.1)*CFrame.Angles(math.rad(10),math.rad(-40),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.1,-0.1,-0.3)*CFrame.Angles(math.rad(80),math.rad(20),math.rad(40))},{.2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,0.35,-0.5)*CFrame.Angles(math.rad(130),math.rad(0),math.rad(20))},{.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(-5),math.rad(-10),math.rad(10))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.4,-0.55)*CFrame.Angles(math.rad(-25),math.rad(-5),math.rad(0))},{.2,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}}
		},
		[8]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(-10),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.In,-1,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.1)*CFrame.Angles(math.rad(10),math.rad(-20),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
		},
		[9]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(-10),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.1)*CFrame.Angles(math.rad(10),math.rad(-20),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
		}
	}
}
--[[
Left Shoulder: 
	C0: CFrame.new(-1,.5,0)*CFrame.new(0.2,0.35,-0.5)*CFrame.Angles(math.rad(130),math.rad(0),math.rad(20))
	C1: CFrame.new(.5,.5,0)
Right Shoulder: 
	C0: CFrame.new(1,.5,0)*CFrame.new(-0.1,-0.1,-0.3)*CFrame.Angles(math.rad(80),math.rad(20),math.rad(40))
	C1: CFrame.new(-.5,.5,0)
Neck: 
	C0: CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(-10),math.rad(0))
	C1: CFrame.new(0,-.5,0)
Right Hip: 
	C0: CFrame.new(0.5,-1,0)*CFrame.new(0,0,0)*CFrame.Angles(math.rad(-5),math.rad(-10),math.rad(10))
	C1: CFrame.new(0,1,0)
Left Hip: 
	C0: CFrame.new(-0.5,-1,0)*CFrame.new(0,0.4,-0.55)*CFrame.Angles(math.rad(-25),math.rad(-5),math.rad(0))
	C1: CFrame.new(0,1,0)
RootJoint: 
	C0: CFrame.new(0,0,-0.1)*CFrame.Angles(math.rad(10),math.rad(-40),math.rad(0))
	C1: 
]]--
--[[
	,
	temp={
		Waits={
			[1]=.225
		},
		[1]={
			{"nec",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}}
		}
	}
--]]
