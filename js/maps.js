function initialize() {
    var lat = document.getElementById('lat').value;
    var long = document.getElementById('long').value;
    var centar = new google.maps.LatLng(lat,long);
    var mapProp = {
        center: centar,
        zoom:14,
        mapTypeId:google.maps.MapTypeId.ROADMAP
    };
    var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
    var marker=new google.maps.Marker({
    position:centar,
    });

    marker.setMap(map);
}
google.maps.event.addDomListener(window, 'load', initialize);