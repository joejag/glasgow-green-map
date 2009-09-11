function prepareTextboxes(input) {
	if (input === undefined) {
		input = ":text[value!='']";
	}
	if (input instanceof Array) {
		input = input.join(", ");
	}
	initialText = new Array();
	$j(input).each( function(i) { initialText.push($j(this).attr("title")) });
	$j(input).each( function(i) {
		$j(this).bind("focus", function() {
			if ($j(this).val() == initialText[i]) $j(this).val("").addClass("active");
		}).bind("blur", function() {
			if ($j(this).val() == "") $j(this).val(initialText[i]).removeClass("active");
		})
	} );
}
