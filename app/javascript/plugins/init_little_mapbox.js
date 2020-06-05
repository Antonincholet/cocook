import mapboxgl from 'mapbox-gl';

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

const initLittleMapbox = () => {
  const mapElement = document.getElementById('little_map');

if (mapElement) {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey ;
  const map = new mapboxgl.Map({
    container: 'little_map',
    style: 'mapbox://styles/mapbox/streets-v9',
    zoom: 12 });

  const marker = JSON.parse(mapElement.dataset.markers);
  new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);


  map.setCenter([ marker.lng, marker.lat ]);
  }
};

// const initMapbox = () => {
//   const mapElement = document.getElementById('little_map');

//   const fitMapToMarker = (map, marker) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   };

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });
//     const marker = JSON.parse(mapElement.dataset.marker);

//     const element = document.createElement('div');
//     element.className = 'marker';
//     element.style.backgroundImage = `url('${marker.image_url}')`;
//     element.style.backgroundSize = 'contain';
//     element.style.width = '25px';
//     element.style.height = '25px';

//     new mapboxgl.Marker(element)
//     .setLngLat([ marker.lng, marker.lat ])
//     .setPopup(popup)
//     .addTo(map);

//     fitMapToMarker(map, marker);
//   }
// };

export { initLittleMapbox };
