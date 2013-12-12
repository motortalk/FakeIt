<!DOCTYPE html>
<html>
  <head>
    <title>Fake it!</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0px;
        padding: 0px
      }

      #map-canvas {
        height: 100%;
      }
      #inputContainer {
        height: 200px;
        min-height: 200px;
        width: 300px;
        margin: 50px;
        position: absolute;
        bottom: 0px;
        right: 0px;
        z-index: 999;
        background-color: white;
        -moz-border-radius: 15px;
        border-radius: 15px;
      }
      #form {
        padding:10px;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script>
var map;
var marker;
function initialize() {
  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(52.511818,13.455856),
    noClear: true
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  marker = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    draggable:true,
    title: 'Drag me'
  });
  google.maps.event.addListener(marker, 'dragend', function() 
  {
    console.log("marker dragged");
    sendUpdate();
  });
}

function sendUpdate(){
    markerPos = marker.getPosition()
    $.ajax({
           type: 'POST',
           url: '/ajax/send/location',
           data: JSON.stringify({location: {'latitude':markerPos.lat(),'longitude':markerPos.lng(),'speed':$('#speed').val(),'course':$('#course').val(),'altitude':$('#altitude').val()},device:{'ip':$('#ip').val(),'port':$('#port').val()}}),
           contentType: 'application/json',
           success: function(response) {
               console.log("sent location " + marker.position);
          }
     });
}

$(document).ready(function(){
    $('#ip').bind('change', function(){
            sendUpdate()
    });
    $('#port').bind('change', function(){
            sendUpdate()
    });
    $('#speed').bind('change', function(){
            sendUpdate()
    });
    $('#course').bind('change', function(){
            sendUpdate()
    });
    $('#altitude').bind('change', function(){
            sendUpdate()
    });
});

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="map-canvas">
            <div id="inputContainer">
                <div id="form">
                <label for="ip">IP:</label>
                <input type="text" id="ip"><br>
                <label for="port">Port:</label>
                <input type="text" id="port" value="9931"><br>
                <label for="speed">Speed:</label>
                <input type="text" id="speed" value="0"><br>
                <label for="course">Course:</label>
                <input type="text" id="course" value="0"><br>
                <label for="altitude">Altitude:</label>
                <input type="text" id="altitude" value="0">
                </div>
            </div>
    </div>
  </body>
</html>
