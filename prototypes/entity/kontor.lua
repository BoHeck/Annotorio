local kontor_anim = {
  north = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_north.png",
        priority = "extra-high",
        width = 390,
        height = 586,
        scale = 0.5,
        shift = util.by_pixel(1, -54)
      }
    }
  },
  south = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_south.png",
        priority = "extra-high",
        width = 391,
        height = 413,
        scale = 0.5,
        shift = util.by_pixel(1, 2)
      }
    }
  },
  east = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_east.png",
        priority = "extra-high",
        width = 591,
        height = 370,
        scale = 0.5,
        shift = util.by_pixel(16, -8)
      }
    }
  },
  west = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_west.png",
        priority = "extra-high",
        width = 549,
        height = 452,
        scale = 0.5,
        shift = util.by_pixel(-16, -44)
      }
    }
  }
}

local kontor_anim2 = {
  north = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_north_2.png",
        priority = "extra-high",
        width = 390,
        height = 586,
        scale = 0.5,
        shift = util.by_pixel(1, -54)
      }
    }
  },
  south = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_south_2.png",
        priority = "extra-high",
        width = 391,
        height = 413,
        scale = 0.5,
        shift = util.by_pixel(1, 2)
      }
    }
  },
  east = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_east_2.png",
        priority = "extra-high",
        width = 591,
        height = 370,
        scale = 0.5,
        shift = util.by_pixel(16, -8)
      }
    }
  },
  west = {
    layers = {
      {
        filename = "__Annotorio__/graphics/entity/kontor_west_2.png",
        priority = "extra-high",
        width = 549,
        height = 452,
        scale = 0.5,
        shift = util.by_pixel(-16, -44)
      }
    }
  }
}

--kontor container
local kontor_container_west = {
  type = "container",
  name = "kontor_container_west",
  icon = "__Annotorio__/graphics/icons/kontor_icon.png",
  icon_size = 64,
  placeable_by = {item = "kontor", count = 1},
  minable = {mining_time = 0.2, result = "kontor"},
  max_health = 1000,
  dying_explosion = "big-explosion",
  corpse = "medium-remnants",
  open_sound = {filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.65},
  close_sound = {filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7},
  resistances = {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "impact",
      percent = 90
    }
  },
  collision_box = {{-3.4, -2.4}, {3.4, 2.4}},
  selection_box = {{-3.5, 0}, {0, 2.5}},
  --collision_mask = {"object-layer", "player-layer"},
  fast_replaceable_group = "kontor_container",
  inventory_size = 60,
  vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
  picture = kontor_anim.west,
  circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
  circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
  circuit_wire_max_distance = default_circuit_wire_max_distance
}

local kontor_container_north = table.deepcopy(kontor_container_west)
kontor_container_north.name = "kontor_container_north"
kontor_container_north.collision_box = {{-2.4, -2.4}, {2.4, 2.4}}
kontor_container_north.selection_box = {{-2.5, -2.5}, {0, 0}}
kontor_container_north.picture = kontor_anim.north

local kontor_container_south = table.deepcopy(kontor_container_west)
kontor_container_south.name = "kontor_container_south"
kontor_container_south.collision_box = {{-2.4, -2.4}, {2.4, 2.4}}
kontor_container_south.selection_box = {{0, 0}, {2.5, 2.5}}
--kontor_container_south.selection_box = {{-2.5, -3.0}, {0, -0.5}}
kontor_container_south.picture = kontor_anim.south

local kontor_container_east = table.deepcopy(kontor_container_west)
kontor_container_east.name = "kontor_container_east"
kontor_container_east.collision_box = {{-3.4, -2.4}, {3.4, 2.4}}
kontor_container_east.selection_box = {{0, -2.5}, {3.5, 0}}
kontor_container_east.picture = kontor_anim.east

local kontor_container_2_north = table.deepcopy(kontor_container_north)
kontor_container_2_north.name = "kontor_container_2_north"
kontor_container_2_north.icon = "__Annotorio__/graphics/icons/kontor2_icon.png"
kontor_container_2_north.icon_size = 64
kontor_container_2_north.picture = kontor_anim2.north

local kontor_container_2_south = table.deepcopy(kontor_container_south)
kontor_container_2_south.name = "kontor_container_2_south"
kontor_container_2_south.icon = "__Annotorio__/graphics/icons/kontor2_icon.png"
kontor_container_2_south.icon_size = 64
kontor_container_2_south.picture = kontor_anim2.south

local kontor_container_2_east = table.deepcopy(kontor_container_east)
kontor_container_2_east.name = "kontor_container_2_east"
kontor_container_2_east.icon = "__Annotorio__/graphics/icons/kontor2_icon.png"
kontor_container_2_east.icon_size = 64
kontor_container_2_east.picture = kontor_anim2.east

local kontor_container_2_west = table.deepcopy(kontor_container_west)
kontor_container_2_west.name = "kontor_container_2_west"
kontor_container_2_west.icon = "__Annotorio__/graphics/icons/kontor2_icon.png"
kontor_container_2_west.icon_size = 64
kontor_container_2_west.picture = kontor_anim2.west

local kontor_upgrade_kit_1 = {
  type = "container",
  name = "kontor_upgrade_kit_1",
  icon = "__Annotorio__/graphics/icons/kontor_upgrade_kit_1_icon.png",
  icon_size = 64,
  placeable_by = {item = "kontor_upgrade_kit_1", count = 1},
  minable = {mining_time = 0.2, result = "kontor_upgrade_kit_1"},
  max_health = 1000,
  dying_explosion = "big-explosion",
  corpse = "medium-remnants",
  collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  collision_mask = {"ground-tile"},
  inventory_size = 60,
  picture = {
    filename = "__Annotorio__/graphics/icons/kontor_upgrade_kit_1_icon.png",
    priority = "extra-high",
    width = 64,
    height = 64
  }
}

data:extend(
  {
    kontor_container_north,
    kontor_container_south,
    kontor_container_east,
    kontor_container_west,
    kontor_container_2_north,
    kontor_container_2_south,
    kontor_container_2_east,
    kontor_container_2_west,
    kontor_upgrade_kit_1,
    --Kontor item
    {
      type = "item",
      name = "kontor",
      icon = "__Annotorio__/graphics/icons/kontor_icon.png",
      icon_size = 64,
      subgroup = "administration",
      order = "a",
      place_result = "kontor_dummy",
      stack_size = 25
    },
    --Kontor upgrade kit item
    {
      type = "item",
      name = "kontor_upgrade_kit_1",
      icon = "__Annotorio__/graphics/icons/kontor_upgrade_kit_1_icon.png",
      icon_size = 64,
      subgroup = "administration",
      order = "b",
      place_result = "kontor_upgrade_kit_1",
      stack_size = 25
    },
    --Kontor upgrade kit recipe
    {
      type = "recipe",
      name = "kontor_upgrade_kit_1",
      ingredients = {
        {"wood", 16},
        {"ceramics", 24},
        {"anno_tool", 10},
        {"anno_crane_2", 1}
      },
      result = "kontor_upgrade_kit_1",
      energy_required = 0.1,
      --5
      enabled = true,
      hidden = false,
      allow_as_intermediate = true
    },
    --Kontor recipe
    {
      type = "recipe",
      name = "kontor",
      ingredients = {
        {"wood", 40}
      },
      result = "kontor",
      energy_required = 0.1,
      --5
      enabled = true,
      hidden = false,
      allow_as_intermediate = true
    },
    --hidden_accumulator for the use in conjunktion with the kontor--
    {
      type = "accumulator",
      name = "hidden_accumulator",
      placeable_by = {item = "kontor", count = 1},
      flags = {"not-blueprintable"},
      icon = "__Annotorio__/graphics/icons/kontor_icon.png",
      icon_size = 64,
      max_health = 99999,
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0, -0}, {0, 0}},
      selectable_in_game = false,
      energy_source = {
        type = "electric",
        buffer_capacity = "600GJ",
        usage_priority = "tertiary",
        input_flow_limit = "600GW",
        output_flow_limit = "600GW",
        render_no_power_icon = false,
        drain = "0W"
      },
      picture = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
      },
      charge_animation = {
        layers = {}
      },
      charge_cooldown = 30,
      --charge_light = {intensity = 0.3, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
      discharge_animation = {
        layers = {}
      },
      discharge_cooldown = 60,
      --discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
      --vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      --working_sound =
      {
        sound = {
          filename = "__base__/sound/accumulator-working.ogg",
          volume = 1
        },
        idle_sound = {
          filename = "__base__/sound/accumulator-idle.ogg",
          volume = 0.4
        },
        max_sounds_per_type = 5
      }

      --circuit_wire_connection_point = circuit_connector_definitions["accumulator"].points,
      --circuit_connector_sprites = circuit_connector_definitions["accumulator"].sprites,
      --circuit_wire_max_distance = default_circuit_wire_max_distance,

      --default_output_signal = {type = "virtual", name = "signal-A"}
    },
    --hidden Electric-pole
    {
      type = "electric-pole",
      name = "hidden_pole",
      placeable_by = {item = "kontor", count = 1},
      flags = {"placeable-off-grid", "not-blueprintable"},
      max_health = 999999,
      resistances = {},
      collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
      selection_box = {{-1.25, -1.25}, {1.25, 1.25}},
      maximum_wire_distance = 1,
      supply_area_distance = 36,
      vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
      pictures = {
        layers = {
          {
            filename = "__core__/graphics/empty.png",
            priority = "extra-high",
            width = 1,
            height = 1,
            direction_count = 1
          }
        }
      },
      draw_copper_wires = false,
      connection_points = {
        {
          shadow = {
            copper = util.by_pixel_hr(245.0, -34.0),
            red = util.by_pixel_hr(301.0, -0.0),
            green = util.by_pixel_hr(206.0, -0.0)
          },
          wire = {
            copper = util.by_pixel_hr(0, -246.0),
            red = util.by_pixel_hr(58.0, -211.0),
            green = util.by_pixel_hr(-58.0, -211.0)
          }
        }
      },
      radius_visualisation_picture = {
        filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
        width = 12,
        height = 12,
        priority = "extra-high-no-scale"
      }
    },
    --hidden_generator_for_pioneers
    --for the use in conjuction with kontor and houses
    {
      type = "electric-energy-interface",
      name = "hidden_generator_for_pioneers",
      placeable_by = {item = "kontor", count = 1},
      icon = "__Annotorio__/graphics/icons/house_pioneer_icon.png",
      icon_size = 64,
      flags = {"not-blueprintable"},
      max_health = 99999,
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0, -0}, {0, 0}},
      energy_source = {
        type = "electric",
        usage_priority = "primary-output",
        render_no_power_icon = false,
        buffer_capacity = "600GW",
        --This is the amount that can be pulled per tick from the house --TODO set it to a better value
        output_flow_limit = "600GW",
        drain = "0kW"
      },
      pictures = {
        layers = {
          {
            filename = "__core__/graphics/empty.png",
            priority = "extra-high",
            width = 1,
            height = 1,
            direction_count = 1
          }
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
      energy_production = "0GW"
    },
    --hidden_generator_for_settlers
    {
      type = "electric-energy-interface",
      name = "hidden_generator_for_settlers",
      placeable_by = {item = "kontor", count = 1},
      icon = "__Annotorio__/graphics/icons/house_settler_icon.png",
      icon_size = 64,
      flags = {"not-blueprintable"},
      max_health = 99999,
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0, -0}, {0, 0}},
      energy_source = {
        type = "electric",
        usage_priority = "primary-output",
        render_no_power_icon = false,
        buffer_capacity = "600GW",
        --This is the amount that can be pulled per tick from the house --TODO set it to a better value
        output_flow_limit = "600GW",
        drain = "0kW"
      },
      pictures = {
        layers = {
          {
            filename = "__core__/graphics/empty.png",
            priority = "extra-high",
            width = 1,
            height = 1,
            direction_count = 1
          }
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
      energy_production = "0GW"
    },
    --hidden_generator_for_citizens
    {
      type = "electric-energy-interface",
      name = "hidden_generator_for_citizens",
      placeable_by = {item = "kontor", count = 1},
      icon = "__Annotorio__/graphics/icons/house_citizen_icon.png",
      icon_size = 64,
      flags = {"not-blueprintable"},
      max_health = 99999,
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0, -0}, {0, 0}},
      energy_source = {
        type = "electric",
        usage_priority = "primary-output",
        render_no_power_icon = false,
        buffer_capacity = "600GW",
        --This is the amount that can be pulled per tick from the house --TODO set it to a better value
        output_flow_limit = "600GW",
        drain = "0kW"
      },
      pictures = {
        layers = {
          {
            filename = "__core__/graphics/empty.png",
            priority = "extra-high",
            width = 1,
            height = 1,
            direction_count = 1
          }
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
      energy_production = "0GW"
    },
    --hidden_trade_post
    --also used to display the kontor grafic
    {
      type = "assembling-machine",
      ------------------
      crafting_categories = {"trade"},
      ingredient_count = 1,
      crafting_speed = 1,
      ------------------

      name = "hidden_trade_post",
      placeable_by = {item = "kontor", count = 1},
      icon = "__Annotorio__/graphics/icons/bazaar_icon.png",
      icon_size = 64,
      flags = {"placeable-off-grid", "not-blueprintable"},
      max_health = 99999,
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        render_no_power_icon = false,
        emissions_per_minute = 1,
        drain = "0kW"
      },
      energy_usage = "50kW",
      collision_mask = {},
      collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
      selection_box = {{-1.25, -1.25}, {1.25, 1.25}},
      --selection_box = {{-0, -0}, {0, 0}},
      animation = {
        layers = {
          {
            filename = "__core__/graphics/empty.png",
            priority = "extra-high",
            width = 1,
            height = 1,
            direction_count = 1
          }
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8}
    },
    --kontor_dummy / offshorepump
    {
      type = "offshore-pump",
      name = "kontor_dummy",
      icon = "__Annotorio__/graphics/icons/kontor_icon.png",
      icon_size = 64,
      flags = {"filter-directions"},
      collision_mask = {"ground-tile", "object-layer"},
      fluid_box_tile_collision_test = {"ground-tile"},
      adjacent_tile_collision_test = {"water-tile"},
      minable = {mining_time = 0.1, result = "kontor"},
      max_health = 150,
      corpse = "small-remnants",
      fluid = "water",
      resistances = {
        {
          type = "fire",
          percent = 70
        },
        {
          type = "impact",
          percent = 30
        }
      },
      collision_box = {{-2.4, -3.4}, {2.4, 3.4}},
      selection_box = {{-2.5, -3.5}, {2.5, 3.5}},
      fluid_box = {
        base_area = 1,
        base_level = 1,
        pipe_covers = nil,
        production_type = "output",
        filter = "water",
        pipe_connections = {
          {position = {1, 3.85}},
          {position = {0, 3.85}},
          {position = {-1, 3.85}}
        }
      },
      pumping_speed = 20,
      vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
      --[[picture = {
        filename = "__Annotorio__/graphics/icons/kontor_icon.png",
        priority = "high",
        -- shift = {0.90625, 0.0625},
        width = 64,
        height = 64
      },]]
      picture = kontor_anim,
      placeable_position_visualization = {
        filename = "__core__/graphics/cursor-boxes-32x32.png",
        priority = "extra-high-no-scale",
        width = 64,
        height = 64,
        scale = 0.5,
        x = 3 * 64
      },
      circuit_wire_connection_points = circuit_connector_definitions["offshore-pump"].points,
      circuit_connector_sprites = circuit_connector_definitions["offshore-pump"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance
    }
  }
)
