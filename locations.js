//[{"code":"RIGASLU","name":"Rīga","key":"Riga","lat":56.9506,"lon":24.1159,"min_zoom":0},{"code":"RILP99PA","name":"Liepāja","key":"Liepaja","lat":56.5419,"lon":21.0367,"min_zoom":4.5},{"code":"RISA99PA","name":"Saldus","key":"Saldus","lat":56.6636,"lon":22.4881,"min_zoom":4.5},{"code":"RIPR99PA","name":"Priekuļi","key":"Priekuli","lat":57.315,"lon":25.3615,"min_zoom":4.5},{"code":"RIAL99MS","name":"Alūksne","key":"Aluksne","lat":57.4167,"lon":27.05,"min_zoom":4.5},{"code":"RIDM99MS","name":"Daugavpils","key":"Daugavpils","lat":55.8833,"lon":26.5333,"min_zoom":4.5},{"code":"RIVE99PA","name":"Ventspils","key":"Ventspils","lat":57.3894,"lon":21.5606,"min_zoom":5},{"code":"RIAI99PA","name":"Ainaži","key":"Ainazi","lat":57.8636,"lon":24.3578,"min_zoom":5},{"code":"RIMADONA","name":"Madona","key":"Madona","lat":56.8533,"lon":26.217,"min_zoom":5},{"code":"RIREZEKN","name":"Rēzekne","key":"Rezekne","lat":56.5,"lon":27.3167,"min_zoom":5},{"code":"RIBA99PA","name":"Bauska","key":"Bauska","lat":56.36986,"lon":24.2218,"min_zoom":6},{"code":"RIKO99PA","name":"Kolka","key":"Kolka","lat":57.75,"lon":22.5833,"min_zoom":6},{"code":"RIDO99MS","name":"Dobele","key":"Dobele","lat":56.625,"lon":23.2786,"min_zoom":7},{"code":"RIME99MS","name":"Mērsrags","key":"Mersrags","lat":57.3354,"lon":23.1245,"min_zoom":7},{"code":"RISI99PA","name":"Skrīveri","key":"Skriveri","lat":56.645,"lon":25.1206,"min_zoom":7},{"code":"PIEDRUJA","name":"Piedruja","key":"Piedruja","lat":55.7948,"lon":27.4532,"min_zoom":7},{"code":"KULDIGA","name":"Kuldīga","key":"Kuldiga","lat":56.9866,"lon":21.9608,"min_zoom":7},{"code":"SILI","name":"Sīļi","key":"Sili","lat":56.3414,"lon":26.3459,"min_zoom":7},{"code":"RIPA99PA","name":"Pāvilosta","key":"Pavilosta","lat":56.8879,"lon":21.1859,"min_zoom":7.5},{"code":"RIST99PA","name":"Stende","key":"Stende","lat":57.15,"lon":22.5333,"min_zoom":5},{"code":"RIJE99PA","name":"Jelgava","key":"Jelgava","lat":56.65,"lon":23.7128,"min_zoom":7.5},{"code":"RISE99MS","name":"Skulte","key":"Skulte","lat":57.3303,"lon":24.4441,"min_zoom":7.5},{"code":"RIRU99PA","name":"Rūjiena","key":"Rujiena","lat":57.8975,"lon":25.3316,"min_zoom":7.5},{"code":"SIGULDA","name":"Sigulda","key":"Sigulda","lat":57.1519,"lon":24.8647,"min_zoom":7.5},{"code":"RIZO99MS","name":"Zosēni","key":"Zoseni","lat":57.1333,"lon":25.9,"min_zoom":7.5},{"code":"DAUGAVGR","name":"Daugavgrīva","key":"Daugavgriva","lat":57.0432,"lon":24.0361,"min_zoom":7.5},{"code":"RIGU99MS","name":"Gulbene","key":"Gulbene","lat":57.1777,"lon":26.7529,"min_zoom":7.5},{"code":"KALNCIEM","name":"Kalnciems","key":"Kalnciems","lat":56.8011,"lon":23.6097,"min_zoom":7.5},{"code":"LIELPECI","name":"Lielpēči","key":"Lielpeci","lat":56.805,"lon":24.7153,"min_zoom":7.5},{"code":"RUCAVA","name":"Rucava","key":"Rucava","lat":56.1631,"lon":21.1616,"min_zoom":7.5},{"code":"VICAKI","name":"Vičaki","key":"Vicaki","lat":57.5482,"lon":21.8629,"min_zoom":7.5},{"code":"RIZI99PA","name":"Zīlāni","key":"Zilani","lat":56.514,"lon":25.9423,"min_zoom":7.5},{"code":"RIDAGDA","name":"Dagda","key":"Dagda","lat":56.107222,"lon":27.56,"min_zoom":7.5}]

var fs = require('fs');
const { connect } = require('http2');

var locations = [{code:"RIGASLU",name:"Rīga",key:"Riga",lat:56.9506,lon:24.1159,min_zoom:0},{code:"RILP99PA",name:"Liepāja",key:"Liepaja",lat:56.5419,lon:21.0367,min_zoom:4.5},{code:"RISA99PA",name:"Saldus",key:"Saldus",lat:56.6636,lon:22.4881,min_zoom:4.5},{code:"RIPR99PA",name:"Priekuļi",key:"Priekuli",lat:57.315,lon:25.3615,min_zoom:4.5},{code:"RIAL99MS",name:"Alūksne",key:"Aluksne",lat:57.4167,lon:27.05,min_zoom:4.5},{code:"RIDM99MS",name:"Daugavpils",key:"Daugavpils",lat:55.8833,lon:26.5333,min_zoom:4.5},{code:"RIVE99PA",name:"Ventspils",key:"Ventspils",lat:57.3894,lon:21.5606,min_zoom:5},{code:"RIAI99PA",name:"Ainaži",key:"Ainazi",lat:57.8636,lon:24.3578,min_zoom:5},{code:"RIMADONA",name:"Madona",key:"Madona",lat:56.8533,lon:26.217,min_zoom:5},{code:"RIREZEKN",name:"Rēzekne",key:"Rezekne",lat:56.5,lon:27.3167,min_zoom:5},{code:"RIBA99PA",name:"Bauska",key:"Bauska",lat:56.36986,lon:24.2218,min_zoom:6},{code:"RIKO99PA",name:"Kolka",key:"Kolka",lat:57.75,lon:22.5833,min_zoom:6},{code:"RIDO99MS",name:"Dobele",key:"Dobele",lat:56.625,lon:23.2786,min_zoom:7},{code:"RIME99MS",name:"Mērsrags",key:"Mersrags",lat:57.3354,lon:23.1245,min_zoom:7},{code:"RISI99PA",name:"Skrīveri",key:"Skriveri",lat:56.645,lon:25.1206,min_zoom:7},{code:"PIEDRUJA",name:"Piedruja",key:"Piedruja",lat:55.7948,lon:27.4532,min_zoom:7},{code:"KULDIGA",name:"Kuldīga",key:"Kuldiga",lat:56.9866,lon:21.9608,min_zoom:7},{code:"SILI",name:"Sīļi",key:"Sili",lat:56.3414,lon:26.3459,min_zoom:7},{code:"RIPA99PA",name:"Pāvilosta",key:"Pavilosta",lat:56.8879,lon:21.1859,min_zoom:7.5},{code:"RIST99PA",name:"Stende",key:"Stende",lat:57.15,lon:22.5333,min_zoom:5},{code:"RIJE99PA",name:"Jelgava",key:"Jelgava",lat:56.65,lon:23.7128,min_zoom:7.5},{code:"RISE99MS",name:"Skulte",key:"Skulte",lat:57.3303,lon:24.4441,min_zoom:7.5},{code:"RIRU99PA",name:"Rūjiena",key:"Rujiena",lat:57.8975,lon:25.3316,min_zoom:7.5},{code:"SIGULDA",name:"Sigulda",key:"Sigulda",lat:57.1519,lon:24.8647,min_zoom:7.5},{code:"RIZO99MS",name:"Zosēni",key:"Zoseni",lat:57.1333,lon:25.9,min_zoom:7.5},{code:"DAUGAVGR",name:"Daugavgrīva",key:"Daugavgriva",lat:57.0432,lon:24.0361,min_zoom:7.5},{code:"RIGU99MS",name:"Gulbene",key:"Gulbene",lat:57.1777,lon:26.7529,min_zoom:7.5},{code:"KALNCIEM",name:"Kalnciems",key:"Kalnciems",lat:56.8011,lon:23.6097,min_zoom:7.5},{code:"LIELPECI",name:"Lielpēči",key:"Lielpeci",lat:56.805,lon:24.7153,min_zoom:7.5},{code:"RUCAVA",name:"Rucava",key:"Rucava",lat:56.1631,lon:21.1616,min_zoom:7.5},{code:"VICAKI",name:"Vičaki",key:"Vicaki",lat:57.5482,lon:21.8629,min_zoom:7.5},{code:"RIZI99PA",name:"Zīlāni",key:"Zilani",lat:56.514,lon:25.9423,min_zoom:7.5},{code:"RIDAGDA",name:"Dagda",key:"Dagda",lat:56.107222,lon:27.56,min_zoom:7.5}];

let content = `import Foundation

struct LvgmcStation: Codable {
  let code: String
  let name: String
  let key: String
  let latitude: Double
  let longitude: Double
}

let lvgmcStations = [
`;

locations.forEach((location, index) => {
  console.log(location.code)

  content += `  LvgmcStation(code: "${location.code}", name: "${location.name}", key: "${location.key}", latitude: ${location.lon}, longitude: ${location.lat})`

  if (index === locations.length - 1) {
    content += ``
  } else {
    content += `,\n`
  }
});

content += `
]
`

fs.writeFile('./Sources/lvgmc/LvgmcStation.swift', content, function (err) {
  if (err) throw err;
  console.log('Saved!');
});