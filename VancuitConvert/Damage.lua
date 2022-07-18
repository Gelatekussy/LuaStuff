
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
	size=size or 1
	damage=0
	knockback=0
	damr=0
	kbr=0
	ignore=ignore or {}
	if typeof(pos)=="CFrame" then pos=pos.Position end
	if typeof(size)=="number" then size=Vector3.new(1,1,1)*size elseif typeof(size)=="CFrame" then size=size.Position end
	local CurrentData={
		Position=pos,
		Size=size,
		Damage=damage,
		DamageSpread=damr,
		Knockback=knockback,
		KnockbackSpread=kbr,
		IgnoreList=ignore
	}
	CurrentData.Region=Region3.new(CurrentData.Position-CurrentData.Size/2,CurrentData.Position+CurrentData.Size/2)
	return setmetatable(CurrentData,Damage)
end
Damage.Damage=function(hum,t,pos,dam,dr,kb,kbr,oh,CurrentData)
	if hum and not hum:FindFirstChild("dеb") then

	end
end
Damage.Check=function(self,times,delay,oh)
	local CurrentData=self
	local Characters={}
	if not times then
		for i,v in next,workspace:FindPartsInRegion3WithIgnoreList(CurrentData.Region,CurrentData.IgnoreList,600) do
			if v.Parent then
				local Hum=v.Parent:FindFirstChildOfClass("Humanoid")
				if Hum then
					local Char=Hum.Parent
					local T=Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso") or Char:FindFirstChild("LowerTorso")
					if T and Char and CheckForElement(Characters,Char) then
						table.insert(Characters,Char)
						Damage.Damage(Hum,T,CurrentData.Position,CurrentData.Damage,CurrentData.DamageSpread,CurrentData.Knockback,CurrentData.KnockbackSpread,oh,CurrentData)
					end
				end
			end
		end
	else
		coroutine.wrap(function()
			for i=1,times do
				for i,v in next,workspace:FindPartsInRegion3WithIgnoreList(CurrentData.Region,CurrentData.IgnoreList,600) do
					if v.Parent then
						local Hum=v.Parent:FindFirstChildOfClass("Humanoid") or (v.Parent and v.Parent.Parent) and v.Parent.Parent:FindFirstChildOfClass("Humanoid")
						if Hum then
							local Char=Hum.Parent
							local T=Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso") or Char:FindFirstChild("LowerTorso")
							if T and Char and CheckForElement(Characters,Char) then
								table.insert(Characters,Char)
								Damage.Damage(Hum,T,CurrentData.Position,CurrentData.Damage,CurrentData.DamageSpread,CurrentData.Knockback,CurrentData.KnockbackSpread,oh,CurrentData)
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
return Damage
