var icon = new GIcon();
icon.image = "http://www.google.co.uk/mapfiles/marker.png";
icon.shadow = "http://www.google.co.uk/mapfiles/shadow50.png";
icon.iconSize = new GSize(20, 34);
icon.shadowSize = new GSize(37, 34);
icon.iconAnchor = new GPoint(10, 34);
glasgow_postcode = new RegExp('[G|g][0-9]');

function isGlasgowPostcode(searchText)
{
  return searchText.match(glasgow_postcode);
}

function appendGlasgowIfNotPostcode(searchText)
{
  if (isGlasgowPostcode(searchText))
  {
    return searchText;
  }
  return searchText + ', Glasgow';
}

function usePointFromPostcode(address, callbackFunction)
{
  usePointFromPostcode(address, callbackFunction, '', '');
}

//adding whitespace
function clean_postcode(input)
{
    return add_whitespace(input);
}


function add_whitespace(input){
   return input.replace(/(\w+\d+)(\s*)(\d\w+)/, "$1 $3");
}

function usePointFromPostcode(address, callbackFunction, context, params)
{
    var cleaned_postcode = clean_postcode(address);
    cleaned_postcode = appendGlasgowIfNotPostcode(cleaned_postcode);
  	geocoder.getLatLng(cleaned_postcode, function(point)
  	{
    	if (!point)
    	{
			callbackFunction(new GLatLng(55.856157,-4.2553865), "G1", context, "locate[postcode]=G1&locate[miles]=1&zoom_level=&locate[tag]=&locate[defaultToCenter]=true");	  
		} else
		{
			callbackFunction(point, address, context, params);
	  	}
  	}
    );
}

function persist_point(point, postcode, context, params)
{
  var url = context + 'postcodes/create';
  var pars = 'postcode[postcode]=' + postcode +
             '&postcode[longitude]=' + point.lng() +
             '&postcode[latitude]=' + point.lat();

  new Ajax.Request(
          url,
  {
    asynchronous: false,
    method: 'post',
    parameters: pars
  });
}

function search_for_point(point, postcode, context, params)
{
  new Ajax.Updater('',
          context + 'places/listajaxian',
  {
    asynchronous:true,
    parameters:params +
               '&search_longitude=' + point.lng() +
               '&search_latitude=' + point.lat(),
    onLoading:function(request)
    {
      Element.show('search_spinner')
    },
    onComplete:function(request)
    {
      Element.hide('search_spinner')
    }
  }
          );
}


function writePointToDatabase(point, postcode, context, params)
{
  var url = context + 'postcodes/create';
  var pars = 'postcode[postcode]=' + postcode +
             '&postcode[longitude]=' + point.lng() +
             '&postcode[latitude]=' + point.lat();

  var myAjax = new Ajax.Request(
          url,
  {
    asynchronous: false,
    method: 'post',
    parameters: pars,
    onComplete: showResponse
  });
}

function showResponse(originalRequest)
{
  addItJim()
}

function postcodePersist(point, postcode)
{
  writePointToDatabase(point, postcode, '')
}

function placeMarkerAtPoint(point, postcode)
{
  var marker = new GMarker(point, icon);
  map.addOverlay(marker);
}

function setCenterToPoint(point, postcode)
{
  map.setCenter(point, 15);
}

function setCenterToPointFarOut(point, postcode)
{
  map.setCenter(point, 13);
}

function moveAddMarkerToPoint(point, postcode)
{
  marker1.setPoint(point);
  map.setCenter(point, 16);
}

function showPointLatLng(point, postcode)
{
  alert("Found " + postcode + " at\nLatitude: " + point.lat() + "\nLongitude: " + point.lng());
}

function showWithin(point, postcode, context, params)
{
  location.href = context + "main/within?" +
                  "latitude=" + point.lat() + "&longitude=" + point.lng() +
                  "&postcode=" + postcode + "&miles=" + document.getElementById('place_miles').value;
}

function fadeAndShow(context, postcode)
{
  usePointFromPostcode(postcode,
          search_for_point2,
          context,
          'locate[postcode]=' + postcode + '&locate[miles]=' + 1 + '&zoom_level=' + 13 + '&locate[tag]=');
}

function newfadeAndShow(context, postcode, miles, tag)
{
  usePointFromPostcode(postcode,
          search_for_point2,
          context,
          'locate[postcode]=' + postcode + '&locate[miles]=' + miles + '&zoom_level=' + '&locate[tag]=' + tag);
}

function newfadeAndShowPlaces(context, postcode, miles, tag)
{
  usePointFromPostcode(postcode,
          search_for_point_places,
          context,
          'locate[postcode]=' + postcode + '&locate[miles]=' + miles + '&zoom_level=' + '&locate[tag]=' + tag);
}

function newfadeAndShowPlacesPaginated(context, postcode, miles, tag, page)
{
  usePointFromPostcode(postcode,
          search_for_point_places,
          context,
          'locate[postcode]=' + postcode + '&locate[miles]=' + miles + '&zoom_level=' + '&locate[tag]=' + tag + '&');
}



function search_for_point2(point, postcode, context, params)
{	

  new Ajax.Updater(
		'',
		context + 'main/ajaxian',
		{
			asynchronous:true,
			parameters:params + '&search_longitude=' + point.lng() + '&search_latitude=' + point.lat(),
			onLoading:whileLoading, 
			onSuccess:uponSuccessfulLoad
		}
  );
}


function loadingToggle(){
	$j("#block-two div.areaChooser").toggle();			
	$j("#block-two div.loading").toggle();			
}

function uponSuccessfulLoad(){
	loadingToggle();
	$j("#theGmap").show();
}


function whileLoading()    {
	loadingToggle();
	$j("#overlayMap, #imgmap, #overlayInfo").hide();
	$j("#block-two").addClass("map");
	$j("#theGmap").hide();
}


function search_for_point_places(point, postcode, context, params)
{
  new Ajax.Updater('',
				context + 'places/listajaxian',
  {
    asynchronous:true,
    parameters:params +
               '&search_longitude=' + point.lng() +
               '&search_latitude=' + point.lat()
  });
}

function search_for_point_places_paginated(postcode, context, params, page, long, lat)
{
  new Ajax.Updater('',
				context + 'places/listajaxian',
  {
    asynchronous:true,
    parameters:params +
               '&search_longitude=' + long +
               '&search_latitude=' + lat
  });
}
