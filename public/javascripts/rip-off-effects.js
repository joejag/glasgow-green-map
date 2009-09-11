// Originally cited from 
// Effects.js - (C) 2007 Panic, Inc.
//
// www.panic.com/coda
// I'm really sorry guys but theres no point us reimplementing this while we wait for the public release.
//



// Utility: Math functions for animation calucations - From http://www.robertpenner.com/easing/
//
// t = time, b = begin, c = change, d = duration
// time = current frame, begin is fixed, change is basically finish - begin, duration is fixed (frames),

function linear(t, b, c, d)
{
	return c*t/d + b;
}

function sineInOut(t, b, c, d)
{
	return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
}

function cubicIn(t, b, c, d) {
	return c*(t/=d)*t*t + b;
}

function cubicOut(t, b, c, d) {
	return c*((t=t/d-1)*t*t + 1) + b;
}

function cubicInOut(t, b, c, d)
{
	if ((t/=d/2) < 1) return c/2*t*t*t + b;
	return c/2*((t-=2)*t*t + 2) + b;
}

function bounceOut(t, b, c, d)
{
	if ((t/=d) < (1/2.75)){
		return c*(7.5625*t*t) + b;
	} else if (t < (2/2.75)){
		return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
	} else if (t < (2.5/2.75)){
		return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
	} else {
		return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
	}
}



// Get the size of the window, and set myWidth and myHeight

function getSize() {
	if (document.all) {
		// IE4+ or IE6+ in standards compliant 
		myWidth  = (document.documentElement.clientWidth) ? document.documentElement.clientWidth : document.body.clientWidth;
		myHeight = (document.documentElement.clientHeight) ? document.documentElement.clientHeight : document.body.clientHeight;
		myScroll = (document.documentElement.scrollTop) ? document.documentElement.scrollTop : document.body.scrollTop;
	} else {
		// Non-IE
		myWidth = window.innerWidth;
		myHeight = window.innerHeight;
		myScroll = window.pageYOffset;
	}
	
	// Core code from - quirksmode.org
    if (window.innerHeight && window.scrollMaxY) {	
        myScrollWidth = document.body.scrollWidth;
		myScrollHeight = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
		myScrollWidth = document.body.scrollWidth;
		myScrollHeight = document.body.scrollHeight;
	} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		myScrollWidth = document.body.offsetWidth;
		myScrollHeight = document.body.offsetHeight;
	}
}

// Find the Y position of an element on a page
// Return Y and X as an array

function findElementPos(elemFind)
{
	var elemX = 0;
	var elemY = 0;
	do {
		elemX += elemFind.offsetLeft;
		elemY += elemFind.offsetTop;
	} while ( elemFind = elemFind.offsetParent )

	//console.log("Found element "+elemFind+" at "+elemY+"/"+elemX);

	return Array(elemX, elemY);
}