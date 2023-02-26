------------------------------------------
------------- JUST CUT IT OFF ------------
------------------------------------------
------------ VISUALS FUNCTIONS -----------


if JCIOVisuals == nil then
    JCIOVisuals = {}
end


JCIOVisuals.SetTextureForAmputation = function(item, player, cicatrized)
    local humanVisual = player:getHumanVisual()
    local textureString = humanVisual:getSkinTexture()

    local isHairy = string.find(textureString, "a$")
    -- Hairy bodies
    if isHairy then
        textureString = textureString:sub(1, -2)      -- Removes b at the end to make it compatible
    end


    local matchedIndex = string.match(textureString, "%d$")

    if isHairy then
        matchedIndex = matchedIndex + 5
    end


    if cicatrized then
        if isHairy then
            matchedIndex = matchedIndex + 5           -- to use the cicatrized texture on hairy bodies
        else
            matchedIndex = matchedIndex + 10          -- cicatrized texture only, no hairs
        end
    end

    --print("TOC: Setting texture " .. matched_index)
    item:getVisual():setTextureChoice(tonumber(matchedIndex - 1)) -- it counts from 0, so we have to subtract 1

end

JCIOVisuals.SetBloodOnAmputation = function(player, bodyPart)

    local bodyPartType = bodyPart:getType()
    local bloodBodyPartType

    if bodyPartType == BodyPartType.Hand_R then
        bloodBodyPartType = BloodBodyPartType.ForeArm_R
    elseif bodyPartType == BodyPartType.Hand_L then
        bloodBodyPartType = BloodBodyPartType.ForeArm_L
    elseif bodyPartType == BodyPartType.Forearm_L or bodyPartType == BodyPartType.UpperArm_L then
        bloodBodyPartType = BloodBodyPartType.UpperArm_L
    elseif bodyPartType == BodyPartType.Forearm_R or bodyPartType == BodyPartType.UpperArm_R then
        bloodBodyPartType = BloodBodyPartType.UpperArm_R
    end

    player:addBlood(bloodBodyPartType, false, true, false)
    player:addBlood(BloodBodyPartType.Torso_Lower, false, true, false)
end

function TocSetCorrectTextureForAmputation(item, player, cicatrized)
    local human_visual = player:getHumanVisual()
    local texture_string = human_visual:getSkinTexture()

    local is_hairy = string.find(texture_string, "a$")
    -- Hairy bodies
    if is_hairy then
        texture_string = texture_string:sub(1, -2)      -- Removes b at the end to make it compatible
    end


    local matched_index = string.match(texture_string, "%d$")

    if is_hairy then
        matched_index = matched_index + 5
    end


    if cicatrized then
        if is_hairy then
            matched_index = matched_index + 5           -- to use the cicatrized texture on hairy bodies
        else
            matched_index = matched_index + 10          -- cicatrized texture only, no hairs
        end
    end

    --print("TOC: Setting texture " .. matched_index)
    item:getVisual():setTextureChoice(tonumber(matched_index - 1)) -- it counts from 0, so we have to subtract 1
end


function TocSetBloodOnAmputation(player, body_part)
    local body_part_type = body_part:getType()
    local blood_body_part_type
    if body_part_type == BodyPartType.Hand_R then
        blood_body_part_type = BloodBodyPartType.ForeArm_R
    elseif body_part_type == BodyPartType.Hand_L then
        blood_body_part_type = BloodBodyPartType.ForeArm_L
    elseif body_part_type == BodyPartType.Forearm_L or body_part_type == BodyPartType.UpperArm_L then
        blood_body_part_type = BloodBodyPartType.UpperArm_L
    elseif body_part_type == BodyPartType.Forearm_R or body_part_type == BodyPartType.UpperArm_R then
        blood_body_part_type = BloodBodyPartType.UpperArm_R
    end


    --print("TOC: Adding blood based on " .. tostring(body_part_type))

    player:addBlood(blood_body_part_type, false, true, false)
    player:addBlood(BloodBodyPartType.Torso_Lower, false, true, false)

end