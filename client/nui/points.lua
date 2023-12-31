local allPoints = {}
local checked = false
local canAccess = false

CreateThread(function()
    if Config.UsingTextUI then
        for k, v in pairs(Config.Shops) do
            local shopCoords = v['coords']
            local canInteract = v['canInteract']
            local key = k
            if shopCoords and shopCoords[1] then
                for h, j in pairs(shopCoords) do
                    allPoints[#allPoints+1] = lib.points.new({
                        coords = vector3(j[1], j[2], j[3]),
                        distance = v['distance'],
                        canInteract = canInteract,
                        index = key
                    })
                end
            end
        end
        for k, v in pairs(allPoints) do
            function v:nearby()
                if self.currentDistance <= self.distance then
                    if not checked then
                        print("check()")
                        canAccess = self.canInteract()
                        checked = true
                    end
                    if canAccess then
                        if not lib.isTextUIOpen() then
                            lib.showTextUI(Lang['interact'])
                        end
                        if IsControlJustPressed(0,Config.OpenKey) then
                            TriggerEvent("av_shops:open", self.index)
                        end
                    end
                end
            end
            function v:onExit()
                checked = false
                canAccess = false
                if lib.isTextUIOpen() then
                    lib.hideTextUI()
                end
            end
        end
    end
end)