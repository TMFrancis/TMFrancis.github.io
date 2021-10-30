// construct sevenWonders location, unique marker, name & blurb
const sevenWonders = [
  [27.173891, 78.042068, 'images/icons8-india-48.png', 'The Taj Mahal',
  '<p><a href="https://commons.wikimedia.org/wiki/File:Taj_Mahal_in_India_-_Kristian_Bertel.jpg#/media/' +
  '<p><a href="https://commons.wikimedia.org/wiki/File:Taj_Mahal_in_India_-_Kristian_Bertel.jpg#/media/' +
    'File:Taj_Mahal_in_India_-_Kristian_Bertel.jpg"><img src="https://upload.wikimedia.org/wikipedia/commons/' +
    'thumb/6/67/Taj_Mahal_in_India_-_Kristian_Bertel.jpg/1200px-Taj_Mahal_in_India_-_Kristian_Bertel.jpg" ' +
    'alt="Taj Mahal in India - Kristian Bertel.jpg" height="200" width="200"></a><br>By Kristian Bertel <a' +
    ' href="https://creativecommons.org/licenses/by-sa/4.0" title="Creative Commons Attribution-Share Alike 4.0">'+
    'CC BY-SA 4.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=99288433">Link</a></p>',
    'The Taj Mahal is an ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian ' +
    'city of Agra. It was commissioned in 1632 by the Mughal emperor Shah Jahan (reigned from 1628 to 1658) ' +
    'to house the tomb of his favourite wife, Mumtaz Mahal; it also houses the tomb of Shah Jahan himself.'],
  [40.431908, 116.570374, 'images/icons8-china-48.png', 'The Great Wall of China',
  '<p><a href="https://commons.wikimedia.org/wiki/File:The_Great_Wall_of_China_at_Jinshanling-edit.jpg#/media/' +
    'File:The_Great_Wall_of_China_at_Jinshanling-edit.jpg"><img src="https://upload.wikimedia.org/wikipedia/' +
    'commons/thumb/2/23/The_Great_Wall_of_China_at_Jinshanling-edit.jpg/1200px-The_Great_Wall_of_China_at_Jinshanling' +
    '-edit.jpg" height="200" width="200" alt="The Great Wall of China at Jinshanling-edit.jpg"></a><br>By Severin.' +
    'stalder <a href="https://creativecommons.org/licenses/by-sa/3.0" title="Creative Commons Attribution-Share Alike ' +
    '3.0">CC BY-SA 3.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=39661035">Link</a></p>',
    'The Great Wall of China is a series of fortifications that were built across the historical northern borders' +
    'of ancient Chinese states and Imperial China as protection against various nomadic groups from the Eurasian' +
    'Steppe. Several walls were built from as early as the 7th century BC, with selective stretches later joined '+
    'together the first emperor of China. Little of the Qin wall remains.'],
  [30.328960, 35.444832, 'images/icons8-jordan-48.png', 'City of Petra',
    '<p><a href="https://commons.wikimedia.org/wiki/File:Treasury_petra_crop.jpeg#/media/File:Treasury_petra_crop.jpeg">' +
    '<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Treasury_petra_crop.jpeg/1200px-Treasury_petra' +
    '_crop.jpeg" alt="Treasury petra crop.jpeg" height="200" width="200"></a><br>By Al Khazneh <a href="https://' +
    'creativecommons.org/licenses/by-sa/2.0" title="Creative Commons Attribution-Share Alike 2.0">CC BY-SA 2.0</a>, <a ' +
    'href="https://commons.wikimedia.org/w/index.php?curid=94374000">Link</a></p>',
    'Petra, originally known to its inhabitants as Raqmu, is a historic and archaeological city in southern ' +
    'Jordan. It is adjacent to the mountain of Jabal Al-Madbah, in a basin surrounded by mountains forming the eastern ' +
    'flank of the Arabah valley running from the Dead Sea to the Gulf of Aqaba. The area around Petra has been inhabited ' +
    'from as early as 7000 BC.'],
  [-22.951871, -43.21118, 'images/icons8-brazil-48.png', 'Christ the Redeemer',
    '<p><a href="https://commons.wikimedia.org/wiki/File:Aerial_view_of_the_Statue_of_Christ_the_Redeemer.jpg#/media/' +
    'File:Aerial_view_of_the_Statue_of_Christ_the_Redeemer.jpg"><img src="https://upload.wikimedia.org/wikipedia/commons' +
    '/e/e7/Aerial_view_of_the_Statue_of_Christ_the_Redeemer.jpg" alt="Aerial view of the Statue of Christ the Redeemer.jpg" '+
    'height="200" width="200"></a><br>By Gustavo Facci <a href="https://creativecommons.org/licenses/by-sa/2.0" ' +
    'title="Creative Commons Attribution-Share Alike 2.0">CC BY-SA 2.0</a>, <a href="https://commons.wikimedia.org/w/' +
    'index.php?curid=18572850">Link</a></p>',
    'Christ the Redeemer is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul' +
    ' Landowski and built by Brazilian engineer Heitor da Silva Costa, in collaboration with French engineer Albert Caquot.' +
    ' Romanian sculptor Gheorghe Leonida fashioned the face. Constructed between 1922 and 1931, the statue is 30 metres ' +
    'high, excluding its 8-metre pedestal.'],
  [-13.163068, -72.545128, 'images/icons8-peru-48.png', 'Machu Picchu',
    '<p><a href="https://commons.wikimedia.org/wiki/File:Machu_Picchu,_Peru.jpg#/media/File:Machu_Picchu,_Peru.jpg">' +
    '<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Machu_Picchu%2C_Peru.jpg/' +
    '1200px-Machu_Picchu%2C_Peru.jpg" alt="Machu Picchu, Peru.jpg" height="200" width="200"></a><br>By Pedro Szekely ' +
    '<a href="https://creativecommons.org/licenses/by-sa/2.0" title="Creative Commons Attribution-Share Alike 2.0">' +
    'CC BY-SA 2.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=14660546">Link</a></p>',
    'Machu Picchu is a 15th-century Inca citadel located in the Eastern Cordillera of southern Peru on a 2,430-meter ' +
    'mountain ridge. It is located in the Machupicchu District within Urubamba Province above the Sacred Valley, ' +
    'which is 80 kilometers northwest of Cuzco. The Urubamba River flows past it, cutting through the Cordillera ' +
    'and creating a canyon with a tropical mountain climate.'],
  [20.684285, -88.567783, 'images/icons8-mexico-48.png', 'Pyramid of Kukulcan',
    '<p><a href="https://commons.wikimedia.org/wiki/File:Chichen_Itza_3.jpg#/media/File:Chichen_Itza_3.jpg"><img' +
    ' src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Chichen_Itza_3.jpg/1200px-Chichen_Itza_3.jpg"' +
    ' alt="Chichen Itza 3.jpg" height="200" width="200"></a><br>By Daniel Schwen <a href="https://creativecommons.org' +
    '/licenses/by-sa/4.0" title="Creative Commons Attribution-Share Alike 4.0">CC BY-SA 4.0</a>, <a ' +
    'href="https://commons.wikimedia.org/w/index.php?curid=7647000">Link</a></p>',
    'La Piramide, known as the Temple of Kukulcan, is a Mesoamerican step-pyramid that dominates the center of the ' +
    'Chichen Itza archaeological site in the Mexican state of Yucatán. The pyramid building was built by the ' +
    'pre-Columbian Maya civilization sometime between the 8th and 12th centuries AD and served as a temple to the ' +
    'deity Kukulcan.'],
  [41.890209, 12.492373, 'images/icons8-italy-48.png', 'The Colosseum',
    '<p><a href="https://commons.wikimedia.org/wiki/File:Colosseo_2020.jpg#/media/File:Colosseo_2020.jpg"><img ' +
    ' src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/1200px-Colosseo_2020.jpg" ' +
    'alt="Colosseo 2020.jpg" height="200" width="200"></a><br><a href="https://creativecommons.org/licenses/by-sa/4.0" ' +
    'title="Creative Commons Attribution-Share Alike 4.0">CC BY-SA 4.0</a>, <a href="https://commons.wikimedia.org/w/' +
    'index.php?curid=95579199">Link</a></p>',
    'The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. ' +
    'It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world ' +
    'today, despite its age. Construction began under the emperor Vespasian and was completed in 80 AD under his ' +
    'successor and heir, Titus.']
  ];

const bellyButton = { lat: 10.26, lng: 5.5 };  // commonly used center of world map

var map = L.map('mapid').setView(bellyButton, 1);
          L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          }).addTo(map);

for (var i=0; i < sevenWonders.length; i++) {
  // create variables for each Wonder
  var nameLong = sevenWonders[i][3]
  var lat = sevenWonders[i][0]
  var lng = sevenWonders[i][1]
  var pin = sevenWonders[i][2]
  var image = sevenWonders[i][4]
  var info = sevenWonders[i][5]
  var content = "<h3>" + nameLong + "</h3>" +
    "<div style='float:left; padding: 10px;'>" + image + "</div>" +
    "<div style ='position: relative'>" +
    info + "</div>"

  var uniqIcon = L.icon({
    iconUrl: pin,
    iconSize: [30,30],
    iconAnchor: [20, 20]
  });

  var markerOptions = {
    title: nameLong,
    icon: uniqIcon,
    iconAnchor: [0, 0],   //can't get this to work
    popupAnchor: [0, 0]   //or this
  };

  // add marker
  marker = new L.marker([lat, lng], markerOptions)
   .bindPopup(content)
   .addTo(map);
};

// recenter map after viewing popup
map.on('popupclose', function() {
  map.setView(bellyButton, 1);
});
