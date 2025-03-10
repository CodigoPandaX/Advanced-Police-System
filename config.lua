Config = {}

-- Rangos de policía
Config.PoliceRanks = {
    ['recluta'] = true,
    ['oficial'] = true,
    ['sargento'] = true,
    ['teniente'] = true,
    ['capitan'] = true,
    ['comisario'] = true
}

-- Coordenadas de la estación de policía
Config.PoliceStation = vector3(440.84, -981.14, 30.69)

-- Precio de fianza
Config.BailPrice = 5000

-- Tiempo de prisión (segundos)
Config.PrisonTime = {
    ['leve'] = 300,  -- 5 minutos
    ['medio'] = 600, -- 10 minutos
    ['grave'] = 1200 -- 20 minutos
}
