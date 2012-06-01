
var rendererOptions = {
    draggable: true
};
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
var directionsService = new google.maps.DirectionsService();
var map,start,end,pass=0,des=-1;
var lat,lng;
var markersArray;

function deleteMarker() {

    if (markersArray)
    {
        markersArray.setMap(null);
        markersArray=0;
    }
}


function placeMarker(location) {

    var marker = new google.maps.Marker({
        position: location,
        map: map
    });

    markersArray=marker;
    start=location;

    $.mobile.changePage( "#second", { transition: "slideup"} );



}

function fetchData()
{


    var myLatlng = new google.maps.LatLng(lat,lng);
    end=myLatlng;
    calcRoute();

}


function calcRoute() {

    var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
        }
    });
}

function computeTotalDistance(result) {
    var total = 0;
    var myroute = result.routes[0];
    for (i = 0; i < myroute.legs.length; i++) {
        total += myroute.legs[i].distance.value;
    }
    total = total / 1000;

    $("#total").text(total + "  KM Away");


}

$(
    function initialize() {
        var kerala = new google.maps.LatLng(10.5293, 76.229);
        var myOptions = {
            zoom:7,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: kerala
        }

        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById("directionsPanel"));

        google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
            computeTotalDistance(directionsDisplay.directions);
        });

        google.maps.event.addListener(map, 'click', function(event) {

            deleteMarker();

          //  document.getElementById("for_hide").style.display="block";

            placeMarker(event.latLng);

        });

        $('.my-link').click(function(event){
            lng=this.getAttribute("data-lng");
            lat=this.getAttribute("data-lat");
            $.mobile.changePage( "#first", { transition: "slideup"} );
            document.getElementById("details").style.display="block";
            fetchData();
            event.preventDefault(); // Prevent link from following its href

        });



    })

/**
 * Created at www.klairvoyant.in
 * User: john
 * Date: 31/5/12
 * Time: 5:51 PM
 * To change this template use File | Settings | File Templates.
 */
