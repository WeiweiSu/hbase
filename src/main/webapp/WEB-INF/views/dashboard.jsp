<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Heatmaps</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Custom CSS -->
<link href="resources/css/sb-admin.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/d3.slider.css" />
<link href="resources/css/metricsgraphics.css" rel="stylesheet"
	type="text/css">
<link href='resources/css/metricsgraphics-demo-dark.css'
	rel='stylesheet' type='text/css'>
<!-- font -->
<link href='http://fonts.googleapis.com/css?family=Lato:100,300'
	rel='stylesheet' type='text/css'>
<!-- Costomized Style -->
<link rel="stylesheet" href="resources/css/style.css" />

<style>
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: #fff;
}

body {
	background-color: #2E8AE6;
	color: #fff;
	font-family: 'Lato', sans-serif;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	-moz-font-feature-settings: 'liga', 'kern';
}

header {
	height: 25%;
}

.container {
	width: 700px;
	margin-top: 120px;
	text-align: center;
}
/* .container h1{
    margin: auto;
    text-align:center;
    font-weight:300;
    font-size:48px;
} */
.container h4 {
	font-weight: 300;
}

.btn-wrap {
	display: flex;
	flex-wrap: warp;
	justify-content: space-between;
}

.btn {
	width: 160px;
	margin: 0 0 0 0;
	padding: 0 28 0 30;
	font-size: 15px;
	font-weight: 300;
	border: thin solid #fff;
	line-height: 200%;
	border-radius: 2px;
	border-width: 2px;
	cursor: pointer;
}

.btn span {
	color: #CCCCCC;
}

span.active {
	display: none;
}

.btn-inverse:hover,
.btn-inverse span:hover {
	background-color: #fff;
	-webkit-transition: none;
	transition: none;
	color: #000000;
	font-weight: bold;
	box-shadow: none;
}

.panel-body {
	background: #222;
}
</style>
</head>

<body>

	<div class="container">
		<h1>Big-Data Analysis, 2013 Physician Distribution</h1>
		<h3>Academic Project, Northeastern University</h3>
		<h4>
			Author : Weiwei Su
			<h4>
				<div class="btn-wrap">
					<a class="btn btn-inverse" target="_blank" href="gmap2_chart">
						<span class="inactive">Overview</span>
					</a> <a class="btn btn-inverse" target="_blank" href="gmap2_usa"> <span
						class="inactive">USA Heat Map</span> <span class="active"
						style="background-color: #fff">USA Heat Map</span>
					</a> <a class="btn btn-inverse" target="_blank" href="gmap2"> <span
						class="inactive">States</span> <span class="active"
						style="background-color: #fff">States</span>
					</a> <a class="btn btn-inverse" target="_blank" href="page2"> <span
						class="inactive">Find a Physician</span> <span class="active"
						style="background-color: #fff">Find a Physician</span>
					</a> <a class="btn btn-inverse" target="_blank" href="mahout"> <span
						class="inactive">Event Classification</span> <span class="active"
						style="background-color: #fff">Event Classification</span>
					</a>

				</div>
	</div>



	<!-- end wrapper -->
	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=visualization"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js"
		charset="utf-8"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/queue-async/1.0.7/queue.min.js"></script>
	<script src="resources/js/jquery.csv-0.71.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- Morris Charts JavaScript -->

</body>

</html>
