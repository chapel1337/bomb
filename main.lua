-- written by chapel1337
-- made on 1/21/2023

local tool = script.Parent

local localMain = tool.localMain
local remote = localMain.remote

tool.ToolTip = "lethal explosive, handle with caution (made by chapel1337)"
tool.TextureId = "rbxassetid://12072218233"

local handle = tool.Handle
local undroppedBomb = tool.bomb

local fuse = undroppedBomb.fuse

local cooldown = false

tool.Activated:Connect(function()
	if cooldown then
		return
	end
	
	cooldown = true

	local bomb = undroppedBomb:Clone()
	bomb.Name = "glaggle bomb"
	bomb.Parent = workspace
	bomb.CanCollide = true
	bomb.fuse.Playing = true

	undroppedBomb.Transparency = 1
	undroppedBomb.smil.Transparency = 1
	
	task.wait(3)
	
	bomb.fuse.TimePosition = 0
	bomb.fuse.Playing = false
	
	local explosion = Instance.new("Explosion", workspace)
	explosion.Position = bomb.Position
	explosion.BlastRadius = 10
	explosion.BlastPressure = 10
	explosion.ExplosionType = Enum.ExplosionType.NoCraters
	
	for i = 0, 5 do
		task.spawn(function()
			local smallBomb = bomb:Clone()
			smallBomb.Name = "small glaggle bomb"
			smallBomb.Parent = workspace
			smallBomb.Size = smallBomb.Size / 1.5
			smallBomb.Position = Vector3.new(smallBomb.Position.X + math.random(2, 3), smallBomb.Position.Y + math.random(2, 3), smallBomb.Position.Z + math.random(2, 3))
			smallBomb.CanCollide = true
			smallBomb.fuse.Playing = true
			
			task.wait(3)

			smallBomb.fuse.TimePosition = 0
			smallBomb.fuse.Playing = false

			local explosion = Instance.new("Explosion", workspace)
			explosion.Position = smallBomb.Position
			explosion.BlastRadius = 5
			explosion.BlastPressure = 5
			explosion.ExplosionType = Enum.ExplosionType.NoCraters
			
			smallBomb:Destroy()
		end)
	end
	
	bomb:Destroy()
	
	task.wait(1)
	
	undroppedBomb.Transparency = 0
	undroppedBomb.smil.Transparency = 0
	
	cooldown = false
end)
