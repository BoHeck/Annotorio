local noise = require("noise")

local autoplace_nothing = {
    probability_expression = noise.define_noise_function(
        function(x, y, tile, map)
            return 0
        end
    )
}

data.raw.resource["crude-oil"] = nil
data.raw.resource["uranium-ore"] = nil
data.raw["autoplace-control"]["crude-oil"] = nil
data.raw["autoplace-control"]["uranium-ore"] = nil
data.raw["autoplace-control"]["stone"] = nil
data.raw["autoplace-control"]["iron-ore"] = nil
data.raw["autoplace-control"]["copper-ore"] = nil
data.raw["autoplace-control"]["coal"] = nil

data.raw.resource["coal"].autoplace = autoplace_nothing
data.raw.resource["copper-ore"].autoplace = autoplace_nothing
data.raw.resource["iron-ore"].autoplace = autoplace_nothing
data.raw.resource["stone"].autoplace = autoplace_nothing
