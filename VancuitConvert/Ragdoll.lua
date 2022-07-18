local ORIGCF=CFrame.new
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end;CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end;},{__index=math;})
local CFrame=setmetatable({new=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.new(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;},{__index=CFrame;})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) pcall(function() if args then if string.lower(typeof(args))=="instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end end) return instance end;Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance;})
local ins=Instance.new
local cf=ORIGCF
local cfn=CFrame.new
local v3=Vector3.new
local Ragdoll={}
local Joints=loadstring(game:HttpGet("https://raw.githubusercontent.com/StrokeThePea/LuaStuff/main/VancuitConvert/Joints.lua"))()
function Ragdoll:Ragdollify(who,kill_)
	if who and not who:FindFirstChild("urdedxdxdxddxdxdxxddxd") then
		local Data={Joints={};HRP=nil;RDParts={};STATUS=kill_ and "Dead" or "Stunned";}
		if kill_ then
			ins("StringValue",{Name="urdedxdxdxddxdxdxxddxd",Parent=who})
		else
			ins("StringValue",{Name="urstunnddxdxdxddxdxdxxddxd",Parent=who})
		end
		local head
		local human=who:FindFirstChildOfClass("Humanoid")
		if human then
			human.PlatformStand=true
		end
		if kill_ then
			for i,v in pairs(who:GetDescendants()) do
				if v.Name=="RagdollHB" then
					Instance.Remove(v)
				end
			end
		end
		for i,v in pairs(who:GetDescendants()) do
			if v:IsA("Motor6D") or v:IsA("Weld") then
				for _,r in pairs(Joints) do
					for w,j in pairs(r) do
						if v.Name==w then
							local att0=ins("Attachment",{Position=v.C0.Position,Orientation=j["Att0Rotation"],Parent=v.Part0})
							local att1=ins("Attachment",{Position=v.C1.Position,Orientation=j["Att1Rotation"],Parent=v.Part1})
							if j["Position0"] then
								att0.Position=v.Part0.Size*j["Position0"]
							end
							if j["Position1"] then
								att1.Position=v.Part1.Size*j["Position1"]
								if not kill_ then
									local p=ins("Part",{Name="RagdollHB",Locked=true,Massless=true,Anchored=false,CanCollide=true,Transparency=1,Size=v.Part1.Size*v3(.75,.75,.75),Parent=v.Part1})
									local w=ins("Weld",{Parent=v.Part1;Part0=v.Part1;Part1=p;})
									table.insert(Data.RDParts,p)
									table.insert(Data.RDParts,w)
									if string.find(v.Part1.Name,"Arm") or string.find(v.Part1.Name,"Leg") then
										w.C0=cf(0,(-v.Part1.Size.Y/2)+p.Size.Y/2,0)
									end
								end
							else
								if not kill_ then
									local p=ins("Part",{Name="RagdollHB",Locked=true,Massless=true,Anchored=false,CanCollide=true,Transparency=1,Size=v.Part1.Size*v3(.5,.3,.5),Parent=v.Part1})
									local w=ins("Weld",{Parent=v.Part1;Part0=v.Part1;Part1=p;})
									table.insert(Data.RDParts,p)
									table.insert(Data.RDParts,w)
								elseif v.Part1.Name=="Head" then
									local p=ins("Part",{Name="RagdollHB",Locked=true,Massless=true,Anchored=false,CanCollide=true,Transparency=1,Size=v.Part1.Size*v3(.5,.3,.5),Parent=v.Part1})
									local w=ins("Weld",{Parent=v.Part1;Part0=v.Part1;Part1=p;})
									table.insert(Data.RDParts,p)
									table.insert(Data.RDParts,w)
								end
							end
							local NC=ins("NoCollisionConstraint",{Part0=v.Part0,Part1=v.Part1,Parent=v.Part0})
							local socket=ins("BallSocketConstraint",{Attachment0=att0,Attachment1=att1,Name=w,Parent=att0})
							table.insert(Data.RDParts,socket)
							table.insert(Data.RDParts,NC)
							for i,v in pairs(j["BallSocketProps"]) do
								socket[i]=v
							end
							table.insert(Data.Joints,{v;v.Parent;v.Part0;v.Part1})
							v.Parent=nil
						end
					end
				end
			end
			if v:IsA("BasePart") and v.Name~="RagdollHB" then
				v.Anchored=false
				v.TopSurface,v.BottomSurface=10,10
				v.CanCollide=false
				if kill_ then
					Instance.Remove(v,10)
				end
				if v.Name=="Head" then
					head=v
				end
			elseif v:IsA("Decal") then
				if kill_ then
					Instance.Remove(v,10)
				end
			end
		end
		if who:FindFirstChild("HumanoidRootPart") then
			Data.HRP={who:FindFirstChild("HumanoidRootPart");who:FindFirstChild("HumanoidRootPart").Parent}
			who:FindFirstChild("HumanoidRootPart").Parent=nil
		end
		if kill_ then
			Instance.Remove(who,10)
		end
		if human then
			if kill_ then
				human.BreakJointsOnDeath=false
				human.Health=0
			end
			human.PlatformStand=true
		end
		local Funcs={}
		function Funcs:Undo(Time)
			if Data.STATUS~="Stunned" then return end;
			if Time then
				coroutine.wrap(function()
					wait(Time)
					Data.HRP[1].Parent=Data.HRP[2]
					for i,v in pairs(Data.Joints) do
						v[1].Parent=v[2]
						v[1].Part0=v[3]
						v[1].Part1=v[4]
					end
					for i,v in pairs(Data.RDParts) do
						if v.Name~="Neck" then
							Instance.Remove(v)
						end
					end
					if human then
						human.PlatformStand=false
					end
					Data.STATUS="None"
				end)()
			else
				Data.HRP[1].Parent=Data.HRP[2]
				for i,v in pairs(Data.Joints) do
					v[1].Parent=v[2]
				end
				for i,v in pairs(Data.RDParts) do
					Instance.Remove(v)
				end
				if human then
					human.PlatformStand=false
				end
				Data.STATUS="None"
			end
		end
		function Funcs:Finish(Time)
			if Data.STATUS~="Stunned" then return end;
			if Time then
				coroutine.wrap(function()
					wait(Time)
					Ragdoll:Ragdollify(who,true)
					Data.STATUS="Dead"
				end)()
			else
				Ragdoll:Ragdollify(who,true)
				Data.STATUS="Dead"
			end
		end
		return Funcs,head
	end
end
return Ragdoll
