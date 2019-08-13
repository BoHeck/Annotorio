--------------------------------------------------------------------
--The following code was copied from "Islands World" by "kapaer" under MIT
--modified to be compatible with annotorio by TheFunnySide
---------------------------------------------------------------------

-- add new elevation noise layer

local noise = require("noise")
local tne = noise.to_noise_expression

local function make_multioctave_noise_function(
  seed0,
  seed1,
  octaves,
  octave_output_scale_multiplier,
  octave_input_scale_multiplier,
  output_scale0,
  input_scale0)
  octave_output_scale_multiplier = octave_output_scale_multiplier or 2
  octave_input_scale_multiplier = octave_input_scale_multiplier or 1 / octave_output_scale_multiplier
  return function(x, y, inscale, outscale)
    return tne {
      type = "function-application",
      function_name = "factorio-quick-multioctave-noise",
      arguments = {
        x = tne(x),
        y = tne(y),
        seed0 = tne(seed0),
        seed1 = tne(seed1),
        input_scale = tne((inscale or 1) * (input_scale0 or 1)),
        output_scale = tne((outscale or 1) * (output_scale0 or 1)),
        octaves = tne(octaves),
        octave_output_scale_multiplier = tne(octave_output_scale_multiplier),
        octave_input_scale_multiplier = tne(octave_input_scale_multiplier)
      }
    }
  end
end

-- Inputs to multi-octave noise to replicate 0.15 terrain
-- (ignoring that it won't match due to shifting having changed)
-- Roughness scale=0.125000, seed=9, amplitude=0.325000
-- Elevation scale=0.500000, seed=8, amplitude=6000.000000

local function water_level_correct(to_be_corrected, map)
  return noise.max(map.wlc_elevation_minimum, to_be_corrected + map.wlc_elevation_offset)
end

local cliff_terracing_enabled = false

local function finish_elevation(elevation, map)
  local elevation = water_level_correct(elevation, map)
  elevation = elevation / map.segmentation_multiplier
  elevation = noise.min(elevation, standard_starting_lake_elevation_expression)
  if cliff_terracing_enabled then
    elevation = noise.terrace_for_cliffs(elevation, nil, map)
  end
  return elevation
end

local elev = {
  {
    type = "noise-expression",
    name = "anno_noise_expression",
    intended_property = "elevation",
    description = "Many Islands, Water Spawn",
    expression = noise.define_noise_function(
      function(x, y, tile, map)
        x = x * map.segmentation_multiplier + 10000 -- Move the point where 'fractal similarity' is obvious off into the boonies
        y = y * map.segmentation_multiplier

        --	  local high_freq_noise = make_multioctave_noise_function(map.seed, 11, 6, 2, 1/3, 1/8, 1/4)
        local low_freq_noise = make_multioctave_noise_function(map.seed, 8, 8, 1.5, 1 / 2, 2 / 3, 1 / 4)
        --local basis = noise.max(low_freq_noise(x,y) - 15, noise.clamp(low_freq_noise(x,y) + 40 + map.finite_water_level - tile.distance/map.starting_area_radius * 60, -40, 9999))
        local basis = low_freq_noise(x, y)
        return finish_elevation(basis, map) - 15 - 60 / tile.distance --This should enable a water spawn
      end
    )
  }
}
data:extend(elev)
