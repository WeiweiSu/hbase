<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>

	<input type="text" id="fname" name="fname" >



	<script>
	$("#fname").change(function() {
		var fname = $(this).val();
		$.getJSON( "search/" + fname, function( data ) {
			  var items = [];
			  $.each( data, function( key, val ) {
				items.push("<li ");
				$.each( val, function(subkey, subval) {
					items.push(subkey + " > " + subval + "; ");
				});
				items.push("</li>");  
			    /*  items.push( "<li id='" + key + "'>" + val + "</li>" );*/
			  });
			 
			  $( "<ul/>", {
			    "class": "my-new-list",
			    html: items.join( "" )
			  }).appendTo( "body" );
			});
	});
	
	</script>

</body>
</html>