Config = {

    FadeOutTime = 3000,

    Elevators = {
        {
            name = "Poste de police",

            floors = {
                [1] = { name = "Premier sous sol", coords = vector3(452.19, -988.12, 25.67), heading = 251.92 },
                [2] = { name = "Rez de chaussée", coords = vector3(437.21, -978.74, 29.69), heading = 250.5 },
                [3] = { name = "Premier étage", coords = vector3(465.55, -984.86, 42.69), heading = 251.6 }
            },

            marker = {
                type = 1,
                color = { r = 0, g = 255, b = 0, a = 255 },
                size = { x = 1.5, y = 1.5, z = 0.5 }
            },
        },

        {
            name = "Parking",

            floors = {
                [1] = { name = "Rez de chaussée", coords = vector3(-324.9, -776.44, 32.96), heading = 46.22 },
                [2] = { name = "Premier étage", coords = vector3(-324.9, -776.44, 37.78), heading = 46.22 },
                [3] = { name = "Deuxième étage", coords = vector3(-324.9, -776.44, 42.61), heading = 46.22 },
                [4] = { name = "Troisième étage", coords = vector3(-324.9, -776.44, 47.42), heading = 46.22 },
                [5] = { name = "Quatrième étage", coords = vector3(-324.9, -776.44, 52.24), heading = 46.22 }
            },

            marker = {
                type = 1,
                color = { r = 0, g = 200, b = 200, a = 150 },
                size = { x = 1.5, y = 1.5, z = 0.5 }
            },
        },
    }
}