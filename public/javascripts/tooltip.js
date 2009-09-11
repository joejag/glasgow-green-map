/*
 * JQuery Tooltip
 *
 * Authors:
 * Alen Grakalic (http://cssglobe.com)
 * Glasgow green Map ( deargreenplace.org )
 *
 *
 * Removes the title element and adds a div that emulates a hover tooltip.
 *
 * TODO: Remove hardcoded offset values.
 * These are to make up for the fact that the tooltip is appending to the end of the map.
 *
 */

var $j = jQuery.noConflict();
var xCursorOffset = 35;
var yCursorOffset = 0;
var removedTitle;

var appearingDivId = "tooltip";
var listenForHoversClass= "area.tooltip";
var addToolTipElementOnToThisElemId = "imgmap";
var neighbourhoodContainerId = "neighbourhoods";
var mapContainerId = "overlayMap";

function tooltip() {
	$j(listenForHoversClass).hover(
		function(e) {
			var neighbourhoods = [ ];

// This 
			var areaYouAreHoveringOver = $j(this).attr('id');
			var noNeighbourHoodsInList = $j("#" + neighbourhoodContainerId).find( '.' + areaYouAreHoveringOver).children('dd').length;

			for(i=0; i < noNeighbourHoodsInList ; i++) {
				var neighbourhood = $j('.' + areaYouAreHoveringOver).children('dd').get(i);
				neighbourhoods[i] = $j(neighbourhood).text();
			}
// is a method
			addAreaOverView(this, e.pageY, e.pageX, this.title, neighbourhoods);
		}, function()  {
			removeAreaOverview(this);
		}
	);

	$j(listenForHoversClass).mousemove(
		function(e) {
			moveAreaOverView(e)
		}
	);
};

function getAllElemsBelowAnIdAsTextArray(){

}


function addAreaOverView(elem, pageY, pageX, area, neighbourhoods) {
	removedTitle = elem.title;
	elem.title = "";
	document.body.style.cursor='pointer';
	addNeighbourhoods(elem, area, neighbourhoods);

	$j('#'+ appearingDivId)
		.css("top",(pageY + yCursorOffset) + "px")
		.css("left",(pageX + xCursorOffset) + "px")
		.fadeIn("fast");
}

function removeAreaOverview(elem) {
	elem.title = removedTitle;
	document.body.style.cursor='default';
	$j('#'+appearingDivId).remove();
}

function moveAreaOverView(e) {
	$j('#'+appearingDivId)
		.css("top",(e.pageY + yCursorOffset) + "px")
		.css("left",(e.pageX + xCursorOffset) + "px");
}

function addNeighbourhoods(elem, area, neighbourhoods) {
	for(i=0; i < neighbourhoods.length; i++) {
	   	neighbourhoods[i] = '<dd>'+ neighbourhoods[i] + '</dd>';
	}

	var areaElem = "<dt>"+ area +"</dt>";
 	var areaDesc = "<dl>" + areaElem;

	for(i=0; i < neighbourhoods.length ; i++) {
   		areaDesc = areaDesc + neighbourhoods[i];
	}

	areaDesc = areaDesc + "</dl>";

	var place = "<div id=\"" + appearingDivId + "\">"+ areaDesc + "</div>";
	$j("body").append(place);
}



/* The code for the place tags tooltips. */



function placetagstooltiptest() {

	var listenForHoversClass= ".tooltiphoverarea"; /* the script should listen for hovers in the tags column of the places table   */
	xOffset = 100;
	yOffset = 20;
	$j(listenForHoversClass).hover(function(e){											  
		var placeyouarehoveringoverid = $j(this).attr('id');
		$j("body").append("<div id='tooltip' style='display:none;'>"+ $j("div#Tooltip" + placeyouarehoveringoverid).html() +"</div>");
		$j("#tooltip")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.show();		
    },
	function(){
		$j("#tooltip").remove();
    });	
	$j(listenForHoversClass).mousemove(function(e){
		$j("#tooltip")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});
}


/* For later.

function AddResultIconAtPoint(latitude, longitude, iconname, resultnumber)
{
	var pointvar = new Point(latitude,longitude)
	var marker = new GMarker(point,icon);
	map.addOverlay(marker);
}
*/