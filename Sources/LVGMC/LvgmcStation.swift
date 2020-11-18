import Foundation

struct LvgmcStation: Codable {
  let code: String
  let name: String
  let key: String
  let latitude: Double
  let longitude: Double
}

let lvgmcStations = [
  LvgmcStation(code: "RIGASLU", name: "Rīga", key: "Riga", latitude: 24.1159, longitude: 56.9506),
  LvgmcStation(code: "RILP99PA", name: "Liepāja", key: "Liepaja", latitude: 21.0367, longitude: 56.5419),
  LvgmcStation(code: "RISA99PA", name: "Saldus", key: "Saldus", latitude: 22.4881, longitude: 56.6636),
  LvgmcStation(code: "RIPR99PA", name: "Priekuļi", key: "Priekuli", latitude: 25.3615, longitude: 57.315),
  LvgmcStation(code: "RIAL99MS", name: "Alūksne", key: "Aluksne", latitude: 27.05, longitude: 57.4167),
  LvgmcStation(code: "RIDM99MS", name: "Daugavpils", key: "Daugavpils", latitude: 26.5333, longitude: 55.8833),
  LvgmcStation(code: "RIVE99PA", name: "Ventspils", key: "Ventspils", latitude: 21.5606, longitude: 57.3894),
  LvgmcStation(code: "RIAI99PA", name: "Ainaži", key: "Ainazi", latitude: 24.3578, longitude: 57.8636),
  LvgmcStation(code: "RIMADONA", name: "Madona", key: "Madona", latitude: 26.217, longitude: 56.8533),
  LvgmcStation(code: "RIREZEKN", name: "Rēzekne", key: "Rezekne", latitude: 27.3167, longitude: 56.5),
  LvgmcStation(code: "RIBA99PA", name: "Bauska", key: "Bauska", latitude: 24.2218, longitude: 56.36986),
  LvgmcStation(code: "RIKO99PA", name: "Kolka", key: "Kolka", latitude: 22.5833, longitude: 57.75),
  LvgmcStation(code: "RIDO99MS", name: "Dobele", key: "Dobele", latitude: 23.2786, longitude: 56.625),
  LvgmcStation(code: "RIME99MS", name: "Mērsrags", key: "Mersrags", latitude: 23.1245, longitude: 57.3354),
  LvgmcStation(code: "RISI99PA", name: "Skrīveri", key: "Skriveri", latitude: 25.1206, longitude: 56.645),
  LvgmcStation(code: "PIEDRUJA", name: "Piedruja", key: "Piedruja", latitude: 27.4532, longitude: 55.7948),
  LvgmcStation(code: "KULDIGA", name: "Kuldīga", key: "Kuldiga", latitude: 21.9608, longitude: 56.9866),
  LvgmcStation(code: "SILI", name: "Sīļi", key: "Sili", latitude: 26.3459, longitude: 56.3414),
  LvgmcStation(code: "RIPA99PA", name: "Pāvilosta", key: "Pavilosta", latitude: 21.1859, longitude: 56.8879),
  LvgmcStation(code: "RIST99PA", name: "Stende", key: "Stende", latitude: 22.5333, longitude: 57.15),
  LvgmcStation(code: "RIJE99PA", name: "Jelgava", key: "Jelgava", latitude: 23.7128, longitude: 56.65),
  LvgmcStation(code: "RISE99MS", name: "Skulte", key: "Skulte", latitude: 24.4441, longitude: 57.3303),
  LvgmcStation(code: "RIRU99PA", name: "Rūjiena", key: "Rujiena", latitude: 25.3316, longitude: 57.8975),
  LvgmcStation(code: "SIGULDA", name: "Sigulda", key: "Sigulda", latitude: 24.8647, longitude: 57.1519),
  LvgmcStation(code: "RIZO99MS", name: "Zosēni", key: "Zoseni", latitude: 25.9, longitude: 57.1333),
  LvgmcStation(code: "DAUGAVGR", name: "Daugavgrīva", key: "Daugavgriva", latitude: 24.0361, longitude: 57.0432),
  LvgmcStation(code: "RIGU99MS", name: "Gulbene", key: "Gulbene", latitude: 26.7529, longitude: 57.1777),
  LvgmcStation(code: "KALNCIEM", name: "Kalnciems", key: "Kalnciems", latitude: 23.6097, longitude: 56.8011),
  LvgmcStation(code: "LIELPECI", name: "Lielpēči", key: "Lielpeci", latitude: 24.7153, longitude: 56.805),
  LvgmcStation(code: "RUCAVA", name: "Rucava", key: "Rucava", latitude: 21.1616, longitude: 56.1631),
  LvgmcStation(code: "VICAKI", name: "Vičaki", key: "Vicaki", latitude: 21.8629, longitude: 57.5482),
  LvgmcStation(code: "RIZI99PA", name: "Zīlāni", key: "Zilani", latitude: 25.9423, longitude: 56.514),
  LvgmcStation(code: "RIDAGDA", name: "Dagda", key: "Dagda", latitude: 27.56, longitude: 56.107222)
]
