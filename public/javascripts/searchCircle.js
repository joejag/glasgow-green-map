var search_circle;

// search_circle = new SearchCircle('G11 6XE', new GLatLng(55.873,-4.27343), 0.2);

function SearchCircle(postcode, pointCentre, miles) {
	if (navigator.appName == "Microsoft Internet Explorer")
	  return;
	
	this.postcode = postcode;
	this.pointCentre = pointCentre;
	
	with (Math) {
    	var latR = miles / ((6076 / 5280) * 60)
    	var lonR = miles / (((cos(pointCentre.lat() * 3.141 / 180) * 6076) / 5280) * 60)
		this.radiusMarker = new GLatLng(pointCentre.lat() + latR, pointCentre.lng() + lonR)
	}
	  
	this.circleLine;
	this.circleLineFill;
	  
	this.centerMarker = this.createMarker(postcode)
	map.addOverlay(this.centerMarker);
	  
	this.normalProj = G_NORMAL_MAP.getProjection();
	
	this.drawCircle();
	this.drawFilledCircle();
	GEvent.addListener(map, "zoomend", this.searchCircleZoomEnd);
}
	  
SearchCircle.prototype.createMarker = function(postcode) {
	var search_marker = new GMarker(this.pointCentre,{title:postcode});
	GEvent.addListener(search_marker, "click", function() {
		search_marker.openInfoWindowHtml('' + postcode);
	});
	return search_marker;
}

SearchCircle.prototype.drawCircle = function() {
	var zoom = map.getZoom();
	var centerPt = this.normalProj.fromLatLngToPixel(this.centerMarker.getPoint(), zoom);
	var radiusPt = this.normalProj.fromLatLngToPixel(this.radiusMarker, zoom);

	var circlePoints = Array();

	with (Math) {
		var radius = floor(sqrt(pow((centerPt.x-radiusPt.x),2) + pow((centerPt.y-radiusPt.y),2)));

		for (var a = 0 ; a < 361 ; a+=10 ) {
			var aRad = a*(PI/180);
			y = centerPt.y + radius * sin(aRad)
			x = centerPt.x + radius * cos(aRad)
			var p = new GPoint(x,y);
			circlePoints.push(this.normalProj.fromPixelToLatLng(p, zoom));
		}

		map.removeOverlay(this.circleLine);
		this.circleLine = new GPolyline(circlePoints,'#FD942D',4,1);
		map.addOverlay(this.circleLine);
	}
}

SearchCircle.prototype.drawFilledCircle = function() {
    var zoom = map.getZoom();
	var centerPt = this.normalProj.fromLatLngToPixel(this.centerMarker.getPoint(), zoom);
	var radiusPt = this.normalProj.fromLatLngToPixel(this.radiusMarker, zoom);

	var circlePoints = Array();

	with (Math) {
		var radius = floor(sqrt(pow((centerPt.x-radiusPt.x),2) + pow((centerPt.y-radiusPt.y),2)));
		var thickness = min(255,radius);

		for (var n = 1 ; n < floor(2* radius / thickness)+1 ; n++ ) {
			radiusB = radius - (thickness / 2) * n;

			for (var a = 0 ; a < 361 ; a+=10 ) {
				var aRad = a*(PI/180);
				y = centerPt.y + radiusB * sin(aRad)
				x = centerPt.x + radiusB * cos(aRad)
				var p = new GPoint(x,y);
				circlePoints.push(this.normalProj.fromPixelToLatLng(p, zoom));
			}

			map.removeOverlay(this.circleLineFill);
			this.circleLineFill = new GPolyline(circlePoints,'#96BDFE',thickness,0.5);
			map.addOverlay(this.circleLineFill);
		}
	}
}

SearchCircle.prototype.searchCircleZoomEnd = function(oldZoom,newZoom) {
     search_circle.drawFilledCircle();
}

function searchCircleReset() {
	search_circle = null;
	map.clearOverlays();
}
