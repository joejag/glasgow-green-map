
/* The code for the place tags tooltips. */


function tooltiptester() {	
	/* CONFIG */		
		xOffset = 10;
		yOffset = 20;		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result		
	/* END CONFIG */		
	$j("#tooltiphoverarea").hover(
	function(e){											  
		this.t = this.title;
		this.title = "";									  
		$j("body").append("<p id='tooltip'>How is this</p>");
		$j("#tooltip")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast");		
    },
	function(){
		this.title = this.t;		
		$j("#tooltip").remove();
    });	
	$j("#tooltiphoverarea").mousemove(function(e){
		$j("#tooltip")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});			
}
