goog.provide('app');

goog.require('ol.Map');
goog.require('ol.View');
goog.require('ol.coordinate');
goog.require('ol.control');
goog.require('ol.layer.Tile');
goog.require('ol.source.OSM');





var mousePositionControl = new ol.control.MousePosition({
        coordinateFormat: ol.coordinate.createStringXY(4),
        projection: 'EPSG:4326',
        // comment the following two lines to have the mouse position
        // be placed within the map.
        className: 'custom-mouse-position',
        target: document.getElementById('mouse-position'),
        undefinedHTML: '&nbsp;'
      });

/**
 * @type {ol.Map}
 */
app.map = new ol.Map({
  controls: ol.control.defaults({
          attributionOptions: /** @type {olx.control.AttributionOptions} */ ({
            collapsible: false
          })
  }).extend([mousePositionControl]),
  target: 'map',
  layers: [
    new ol.layer.Tile({
      source: new ol.source.OSM()
    })
  ],
  view: new ol.View({
    center: [5.5325, 52.0244],
    zoom: 8
  })
});
