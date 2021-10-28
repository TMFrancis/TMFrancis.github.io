// javascript to create Geocode map using Leaflet & OpenCage plugin
// developed for Lab6, assignment 1
var mymap = L.map('mapid');

var options = {
    key: geocoder_api_key,
    limit: 10
};
var control = L.Control.openCageSearch(options).addTo(mymap);

L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}', {
  attribution: 'Tiles &copy; Esri &mdash; National Geographic, Esri, DeLorme',
  maxZoom: 16,
  minZoom: 0
}).addTo(mymap);

mymap.setView([0, 0], 1);
