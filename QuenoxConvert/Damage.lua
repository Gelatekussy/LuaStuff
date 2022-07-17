--[[
	> Made by v_Sado(formerly vlad20020), 2020 < badyear
	
	              position			size		   damage damage spread   knockback   knockback spread   ignore list
	Damage.new(Vector3.new(0,0,0),Vector3.new(5,5,5),10,       5,             15,           5,            {char})
	
	D.new():Check(1,nil or 0,function) > checks only once with a little delay after, sets local OnHit function(args: part instance), returns hit characters
	D.new():Check(5,0,function) > checks 5 times with delay regarding the server performance, sets local OnHit function(args: part instance), returns hit characters
	D.new():Check(5,.1,function) > checks 5 times with delay of 0.1 seconds, sets local OnHit function(args: part instance), returns hit characters
	
	Damage:SetDeathEffectFunction(function) > args: char, instakill effect
	Damage:SetDamageDisplayFunction(function) > args: cframe, text, text lifetime
	Damage:SetOnFunction(function) > args: part instance
	Damage:SetMaxHealth(num) > sets max life before instakill
--]]
local Damage={}
local SData={}
Damage.__index=Damage
local function CheckForElement(Table,Value)
	for i,v in next,Table do
		if v==Value then return false end
	end
	return true
end
Damage.new=function(pos,size,damage,damr,knockback,kbr,ignore)
	assert(pos,"arg 1 'position' lacking")
	assert(typeof(pos)=="Vector3" or typeof(pos)=="CFrame","position must be a Vector3 value either or CFrame value")
	assert(typeof(size)=="number" or typeof(size)=="Vector3" or typeof(size)=="CFrame","arg 2 'size' isn't number, CFrame or Vector3")
	size=size or 0
	damage=damage or 0
	knockback=knockback or 0
	damr=damr or 0
	kbr=kbr or 0
	ignore=ignore or {}
	if typeof(pos)=="CFrame" then pos=pos.Position end
	if typeof(size)=="number" then size=Vector3.new(1,1,1)*size elseif typeof(size)=="CFrame" then size=size.Position end
	local CurrentData={
		Position=pos,
		Size=size,
		Damage=0,
		DamageSpread=damr,
		Knockback=knockback,
		KnockbackSpread=kbr,
		IgnoreList=ignore
	}
	CurrentData.Region=Region3.new(CurrentData.Position-CurrentData.Size/2,CurrentData.Position+CurrentData.Size/2)
	return setmetatable(CurrentData,Damage)
end
Damage.Check=function(self,times,delay,oh)
	local CurrentData=self
	local function Damage_(hum,t,pos,dam,dr,kb,kbr,oh)
		if hum and not hum:FindFirstChild("dеb") then
			local Deb=Instance.new("Glue",hum) Deb.Name="dеb" game:GetService("Debris"):AddItem(Deb,.03)
			local df,sdf,ohf=CurrentData.DeathEffect or SData.DeathEffect,CurrentData.DamageDisplay or SData.DamageDisplay,oh or CurrentData.OnHit or SData.OnHit
			local Dir=CFrame.new(pos,t.Position).LookVector
			local Damage=math.clamp(dam+math.random(-dr,dr),1 and not dr or 0,math.huge)
			local Knockback=math.clamp(kb+math.random(-kbr,kbr),0,math.huge)
			local DeathEffect,DamageDisplay=df,sdf
			ohf(t)
			if Damage<1 then return end
			local Health=hum.Health
			local Mul=Damage+(Damage*(hum.MaxHealth/150))
			if hum.MaxHealth>SData.MaxHealth then df(hum.Parent,true) sdf(t.CFrame,"-NULL",2.5) end
			hum.Health=hum.Health-math.floor(Mul)
			sdf(t.CFrame,-(Health-hum.Health),2)
			if Knockback >0 then local KB=Instance.new("BodyVelocity",t) KB.MaxForce=Vector3.new(25000,25000,25000) KB.Velocity=Dir*Knockback game:GetService("Debris"):AddItem(KB,.125) end
			if hum.Health<.1 then df(hum.Parent,false) end
		end
	end
	local Characters={}
	if not times then
		for i,v in next,workspace:FindPartsInRegion3WithIgnoreList(CurrentData.Region,CurrentData.IgnoreList,200) do
			if v.Parent then
				local Hum=v.Parent:FindFirstChildOfClass("Humanoid")
				if Hum then
					local Char=Hum.Parent
					local T=Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso") or Char:FindFirstChild("LowerTorso")
					if T and Char and CheckForElement(Characters,Char) then
						table.insert(Characters,Char)
						Damage_(Hum,T,CurrentData.Position,CurrentData.Damage,CurrentData.DamageSpread,CurrentData.Knockback,CurrentData.KnockbackSpread,oh)
					end
				end
			end
		end
	else
		coroutine.wrap(function()
			for i=1,times do
				for i,v in next,workspace:FindPartsInRegion3WithIgnoreList(CurrentData.Region,CurrentData.IgnoreList,200) do
					if v.Parent then
						local Hum=v.Parent:FindFirstChildOfClass("Humanoid") or (v.Parent and v.Parent.Parent) and v.Parent.Parent:FindFirstChildOfClass("Humanoid")
						if Hum then
							local Char=Hum.Parent
							local T=Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso") or Char:FindFirstChild("LowerTorso")
							if T and Char and CheckForElement(Characters,Char) then
								table.insert(Characters,Char)
								Damage_(Hum,T,CurrentData.Position,CurrentData.Damage,CurrentData.DamageSpread,CurrentData.Knockback,CurrentData.KnockbackSpread,oh)
							end
						end
					end
				end
				if not delay or delay==0 then
					game:GetService("RunService").Heartbeat:Wait()
				else
					wait(delay)
				end
			end
		end)()
	end
	return Characters
end
Damage.SetDeathEffectFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	Damage.DeathEffect=func
	return Damage.DeathEffect
end
Damage.SetDamageDisplayFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	Damage.DamageDisplay=func
	return Damage.DamageDisplay
end
Damage.SetOnHitFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	Damage.OnHit=func
	return Damage.OnHit
end
Damage.SetMaxHealth=function(self,num)
	assert(num,"arg 1 'num' lacking")
	assert(typeof(num)=="number","arg 1 'num' must be a number")
	Damage.MaxHealth=num
	return Damage.MaxHealth
end
Damage.SetGlobalDeathEffectFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	SData.DeathEffect=func
	return SData.DeathEffect
end
Damage.SetGlobalDamageDisplayFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	SData.DamageDisplay=func
	return SData.DamageDisplay
end
Damage.SetGlobalOnHitFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	SData.OnHit=func
	return SData.OnHit
end
Damage.SetGlobalMaxHealth=function(self,num)
	assert(num,"arg 1 'num' lacking")
	assert(typeof(num)=="number","arg 1 'num' must be a number")
	SData.MaxHealth=num
	return SData.MaxHealth
end
Damage:SetGlobalDeathEffectFunction(function()end)
Damage:SetGlobalDamageDisplayFunction(function()end)
Damage:SetGlobalOnHitFunction(function()end)
Damage:SetGlobalMaxHealth(5000000)
return Damage
