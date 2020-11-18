import Foundation

struct LvgmcStation: Codable {
  let code: String
  let name: String
  let key: String
  let latitude: Double
  let longitude: Double
}

let lvgmcStations = [
  LvgmcStation(code: "RIGASLU", name: "Rīga", key: "Riga", latitude: 56.9506, longitude: 24.1159),
  LvgmcStation(code: "RILP99PA", name: "Liepāja", key: "Liepaja", latitude: 56.5419, longitude: 21.0367),
  LvgmcStation(code: "RISA99PA", name: "Saldus", key: "Saldus", latitude: 56.6636, longitude: 22.4881),
  LvgmcStation(code: "RIPR99PA", name: "Priekuļi", key: "Priekuli", latitude: 57.315, longitude: 25.3615),
  LvgmcStation(code: "RIAL99MS", name: "Alūksne", key: "Aluksne", latitude: 57.4167, longitude: 27.05),
  LvgmcStation(code: "RIDM99MS", name: "Daugavpils", key: "Daugavpils", latitude: 55.8833, longitude: 26.5333),
  LvgmcStation(code: "RIVE99PA", name: "Ventspils", key: "Ventspils", latitude: 57.3894, longitude: 21.5606),
  LvgmcStation(code: "RIAI99PA", name: "Ainaži", key: "Ainazi", latitude: 57.8636, longitude: 24.3578),
  LvgmcStation(code: "RIMADONA", name: "Madona", key: "Madona", latitude: 56.8533, longitude: 26.217),
  LvgmcStation(code: "RIREZEKN", name: "Rēzekne", key: "Rezekne", latitude: 56.5, longitude: 27.3167),
  LvgmcStation(code: "RIBA99PA", name: "Bauska", key: "Bauska", latitude: 56.36986, longitude: 24.2218),
  LvgmcStation(code: "RIKO99PA", name: "Kolka", key: "Kolka", latitude: 57.75, longitude: 22.5833),
  LvgmcStation(code: "RIDO99MS", name: "Dobele", key: "Dobele", latitude: 56.625, longitude: 23.2786),
  LvgmcStation(code: "RIME99MS", name: "Mērsrags", key: "Mersrags", latitude: 57.3354, longitude: 23.1245),
  LvgmcStation(code: "RISI99PA", name: "Skrīveri", key: "Skriveri", latitude: 56.645, longitude: 25.1206),
  LvgmcStation(code: "PIEDRUJA", name: "Piedruja", key: "Piedruja", latitude: 55.7948, longitude: 27.4532),
  LvgmcStation(code: "KULDIGA", name: "Kuldīga", key: "Kuldiga", latitude: 56.9866, longitude: 21.9608),
  LvgmcStation(code: "SILI", name: "Sīļi", key: "Sili", latitude: 56.3414, longitude: 26.3459),
  LvgmcStation(code: "RIPA99PA", name: "Pāvilosta", key: "Pavilosta", latitude: 56.8879, longitude: 21.1859),
  LvgmcStation(code: "RIST99PA", name: "Stende", key: "Stende", latitude: 57.15, longitude: 22.5333),
  LvgmcStation(code: "RIJE99PA", name: "Jelgava", key: "Jelgava", latitude: 56.65, longitude: 23.7128),
  LvgmcStation(code: "RISE99MS", name: "Skulte", key: "Skulte", latitude: 57.3303, longitude: 24.4441),
  LvgmcStation(code: "RIRU99PA", name: "Rūjiena", key: "Rujiena", latitude: 57.8975, longitude: 25.3316),
  LvgmcStation(code: "SIGULDA", name: "Sigulda", key: "Sigulda", latitude: 57.1519, longitude: 24.8647),
  LvgmcStation(code: "RIZO99MS", name: "Zosēni", key: "Zoseni", latitude: 57.1333, longitude: 25.9),
  LvgmcStation(code: "DAUGAVGR", name: "Daugavgrīva", key: "Daugavgriva", latitude: 57.0432, longitude: 24.0361),
  LvgmcStation(code: "RIGU99MS", name: "Gulbene", key: "Gulbene", latitude: 57.1777, longitude: 26.7529),
  LvgmcStation(code: "KALNCIEM", name: "Kalnciems", key: "Kalnciems", latitude: 56.8011, longitude: 23.6097),
  LvgmcStation(code: "LIELPECI", name: "Lielpēči", key: "Lielpeci", latitude: 56.805, longitude: 24.7153),
  LvgmcStation(code: "RUCAVA", name: "Rucava", key: "Rucava", latitude: 56.1631, longitude: 21.1616),
  LvgmcStation(code: "VICAKI", name: "Vičaki", key: "Vicaki", latitude: 57.5482, longitude: 21.8629),
  LvgmcStation(code: "RIZI99PA", name: "Zīlāni", key: "Zilani", latitude: 56.514, longitude: 25.9423),
  LvgmcStation(code: "RIDAGDA", name: "Dagda", key: "Dagda", latitude: 56.107222, longitude: 27.56)
]
