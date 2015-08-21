<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.panel-body {
	background: #222; 
	/* background-color: #2E8AE6; */
}

/* .tablewrapper {
	height: 300px;
	overflow: auto;
} */
.table-fixed tbody {
	height: 230px;
	overflow-y: auto;
	width: 100%;
}
</style>
</head>

<body>
	<div id="wrapper">
		<!-- begin wrapper -->
		<!-- Navigation -->
		<nav class="navbar top-nav navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Physician Distribution</a>
			</div>
			<!-- Top Menu Items -->
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a href="dashboard"><i class="fa fa-fw fa-dashboard"></i>
							Overview</a></li>
					<li class="active"><a href="page2"><i
							class="fa fa-fw fa-dashboard"></i> Search a Physician</a></li>
					<li><a href="javascript:;" data-toggle="collapse"
						data-target="#demo"><i class="fa fa-fw fa-crosshairs"></i>
							Heat Map <i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="demo" class="collapse">
							<li><a href="gmap2_usa">United States</a></li>
							<li><a href="gmap2">Individual States</a></li>
						</ul></li>
					<li><a href="gmap2_chart.html"><i
							class="fa fa-fw fa-bar-chart-o"></i> Charts</a></li>
					<li><a href="mahout"><i class="fa fa-fw fa-bar-chart-o"></i>Event
							Classification</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->

				<div class="jumbotron">
					<!-- search table -->
					<div class="row">
						<!-- row -->

						<div class="col-md-12">
							<div class="row">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="text" id="fname" class="form-control"
											placeholder="Search By First Name" name="fname"> <input
											type="text" id="lname" class="form-control"
											placeholder="Search By Last Name" name="lname">
									</div>
									<button type="button" id="button1" class="btn btn-default">Submit</button>
									<p id="warning"></p>
								</form>
							</div>

							<div class="panel panel-info">
								<!-- Default panel contents -->
								<div id="search_title" class="panel-heading">Data will be
									displayed below</div>

								<!-- Table -->
								<div id="tablewrapper" class="table-responsive">
									<table id="resultTable"
										class="table table-fixed table-bordered">

									</table>
								</div>
							</div>
						</div>
					</div>
					<!--  /row -->

				</div>

				<br />

				<div class="jumbotron">
					<div class="row">
						<!-- row -->

						<div class="col-md-12">
							<div class="row">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<!-- <input type="text" id="primarySpecialty" class="form-control" placeholder="Search By Primary Specialty" name="ps"> -->

										<label for="primarySpecialty">Search By Primary
											Specialty:</label> <select class="form-control" id="primarySpecialty">
											<option></option>
											<option>ADDICTION MEDICINE</option>
											<option>ALLERGY/IMMUNOLOGY</option>
											<option>ANESTHESIOLOGY</option>
											<option>ANESTHESIOLOGY ASSISTANT</option>
											<option>AUDIOLOGIST</option>
											<option>CARDIAC ELECTROPHYSIOLOGY</option>
											<option>CARDIAC SURGERY</option>
											<option>CARDIOVASCULAR DISEASE (CARDIOLOGY)</option>
											<option>CERTIFIED NURSE MIDWIFE</option>
											<option>CERTIFIED REGISTERED NURSE ANESTHETIST</option>
											<option>CHIROPRACTIC</option>
											<option>CLINICAL NURSE SPECIALIST</option>
											<option>CLINICAL PSYCHOLOGIST</option>
											<option>CLINICAL SOCIAL WORKER</option>
											<option>COLORECTAL SURGERY (PROCTOLOGY)</option>
											<option>CRITICAL CARE (INTENSIVISTS)</option>
											<option>DERMATOLOGY</option>
											<option>DIAGNOSTIC RADIOLOGY</option>
											<option>EMERGENCY MEDICINE</option>
											<option>ENDOCRINOLOGY</option>
											<option>FAMILY PRACTICE</option>
											<option>GASTROENTEROLOGY</option>
											<option>GENERAL PRACTICE</option>
											<option>GENERAL SURGERY</option>
											<option>GERIATRIC MEDICINE</option>
											<option>GERIATRIC PSYCHIATRY</option>
											<option>GYNECOLOGICAL ONCOLOGY</option>
											<option>HAND SURGERY</option>
											<option>HEMATOLOGY</option>
											<option>HEMATOLOGY/ONCOLOGY</option>
											<option>HOSPICE/PALLIATIVE CARE</option>
											<option>INFECTIOUS DISEASE</option>
											<option>INTERNAL MEDICINE</option>
											<option>INTERVENTIONAL CARDIOLOGY</option>
											<option>INTERVENTIONAL PAIN MANAGEMENT</option>
											<option>INTERVENTIONAL RADIOLOGY</option>
											<option>MAXILLOFACIAL SURGERY</option>
											<option>MEDICAL ONCOLOGY</option>
											<option>NEPHROLOGY</option>
											<option>NEUROLOGY</option>
											<option>NEUROPSYCHIATRY</option>
											<option>NEUROSURGERY</option>
											<option>NUCLEAR MEDICINE</option>
											<option>NURSE PRACTITIONER</option>
											<option>OBSTETRICS/GYNECOLOGY</option>
											<option>OCCUPATIONAL THERAPY</option>
											<option>OPHTHALMOLOGY</option>
											<option>OPTOMETRY</option>
											<option>ORAL SURGERY (DENTIST ONLY)</option>
											<option>ORTHOPEDIC SURGERY</option>
											<option>OSTEOPATHIC MANIPULATIVE MEDICINE</option>
											<option>OTOLARYNGOLOGY</option>
											<option>PAIN MANAGEMENT</option>
											<option>PATHOLOGY</option>
											<option>PEDIATRIC MEDICINE</option>
											<option>PERIPHERAL VASCULAR DISEASE</option>
											<option>PHYSICAL MEDICINE AND REHABILITATION</option>
											<option>PHYSICAL THERAPY</option>
											<option>PHYSICIAN ASSISTANT</option>
											<option>PLASTIC AND RECONSTRUCTIVE SURGERY</option>
											<option>PODIATRY</option>
											<option>PREVENTATIVE MEDICINE</option>
											<option>PSYCHIATRY</option>
											<option>PULMONARY DISEASE</option>
											<option>RADIATION ONCOLOGY</option>
											<option>REGISTERED DIETITIAN OR NUTRITION
												PROFESSIONAL</option>
											<option>RHEUMATOLOGY</option>
											<option>SINGLE OR MULTISPECIALTY CLINIC OR GROUP
												PRACTICE</option>
											<option>SLEEP LABORATORY/MEDICINE</option>
											<option>SPEECH LANGUAGE PATHOLOGIST</option>
											<option>SPORTS MEDICINE</option>
											<option>SURGICAL ONCOLOGY</option>
											<option>THORACIC SURGERY</option>
											<option>UNDEFINED NON-PHYSICIAN TYPE (SPECIFY)</option>
											<option>UNDEFINED PHYSICIAN TYPE (SPECIFY)</option>
											<option>UROLOGY</option>
											<option>VASCULAR SURGERY</option>
										</select> <label for="state">Search By State:</label> <select
											class="form-control" id="state">
											<option></option>
											<option>PR</option>
											<option>PA</option>
											<option>KY</option>
											<option>NJ</option>
											<option>MI</option>
											<option>MO</option>
											<option>LA</option>
											<option>MN</option>
											<option>AK</option>
											<option>TN</option>
											<option>VT</option>
											<option>AL</option>
											<option>GA</option>
											<option>OH</option>
											<option>ME</option>
											<option>CA</option>
											<option>NY</option>
											<option>UT</option>
											<option>IL</option>
											<option>TX</option>
											<option>IN</option>
											<option>RI</option>
											<option>SC</option>
											<option>OK</option>
											<option>FL</option>
											<option>MA</option>
											<option>MD</option>
											<option>ND</option>
											<option>NC</option>
											<option>VA</option>
											<option>KS</option>
											<option>DE</option>
											<option>MS</option>
											<option>CT</option>
											<option>NE</option>
											<option>AR</option>
											<option>CO</option>
											<option>HI</option>
											<option>MT</option>
											<option>AZ</option>
											<option>WV</option>
											<option>NM</option>
											<option>IA</option>
											<option>ID</option>
											<option>WA</option>
											<option>WY</option>
											<option>NV</option>
											<option>OR</option>
											<option>SD</option>
											<option>NH</option>
											<option>WI</option>
											<option>DC</option>
											<option>VI</option>
											<option>GU</option>
											<option>MP</option>
											<option>AS</option>
										</select>

										<!-- <input type="text" id="state" class="form-control" placeholder="Search By State" name="state"> -->
									</div>
									<button type="button" id="button2" class="btn btn-default">Submit</button>
									<p id="warning1"></p>
								</form>
							</div>

							<div class="panel panel-warning">
								<!-- Default panel contents -->
								<div id="search_title1" class="panel-heading">Data will be
									displayed below</div>

								<!-- Table -->
								<div class="table-responsive tablewrapper">
									<table id="resultTable1"
										class="table table-fixed table-bordered">

									</table>
								</div>
							</div>
						</div>
					</div>
					<!--  /row -->

				</div>
				<!-- jumbotron -->


			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
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
	<script src="resources/js/plugins/morris/raphael.min.js"></script>
	<script src="resources/js/plugins/morris/morris.min.js"></script>
	<script src="resources/js/plugins/morris/morris-data.js"></script>
	<script src='resources/js/metricsgraphics.min.js'></script>
	<script>
		var graduationfile = "resources/data/others/CountByGraduationYear.csv";

		queue().defer(d3.csv, graduationfile, function(d) {
			return {
				"year" : d.Graduation_year == "" ? "1772" : d.Graduation_year,
				"count" : d.count
			}
		}).await(ready);

		function ready(error, data1) {
			// data1 = convert.date(data1, 'date');
			data_graphic({
				title : "Physician Distribution By Graduation Year.",
				description : "Physician count per graduation year.",
				data : data1,
				width : 650,
				height : 150,
				target : '#graduationYear',
				x_accessor : 'year',
				y_accessor : 'count',
				markers : [ {
					'year' : 1955,
					'label' : 'Rapid increment started here'
				} ]
			// ,
			// x_rug: true
			});
		}
	</script>


	<script>
		$("#button1")
				.click(
						function() {
							var fname = $("#fname").val();
							var lname = $("#lname").val();

							if (fname == "" && lname == "") {
								$("#warning").html(
										"Select at least one query criterion")
										.css("color", "red");
								return;
							}

							document.getElementById('search_title').innerHTML = "Loading.....";
							$
									.getJSON(
											"search/" + fname + "+" + lname,
											function(data) {
												var counter = 0;
												var items = [];
												var items1 = "<tbody>";
												var itemshead = "<thead><tr>";
												$
														.each(
																data,
																function(key,
																		val) {

																	items1 += "<tr>";
																	items
																			.push("<tr>");
																	$
																			.each(
																					val,
																					function(
																							subkey,
																							subval) {
																						if (counter == 0) {
																							itemshead += "<th>"
																									+ subkey
																									+ "</th>";
																						}
																						items1 += "<td>"
																								+ subval
																								+ "</td>";
																						items
																								.push("<td>"
																										+ subkey
																										+ " </td><td> "
																										+ subval
																										+ "</td>");
																					});
																	items1 += "</td>";
																	items
																			.push("</tr>");
																	counter++;
																	/* items.push("<li ");
																	$.each( val, function(subkey, subval) {
																		items.push(subkey + " > " + subval + "; ");
																	});
																	items.push("</li>"); */
																	/*  items.push( "<li id='" + key + "'>" + val + "</li>" );*/
																});
												itemshead += "</tr></thead>";
												items1 += "</tbody>";
												document
														.getElementById('search_title').innerHTML = counter
														+ " records found in our Database.";
												document
														.getElementById('resultTable').innerHTML = itemshead
														+ items1;
												/* items1.appendTo("table"); */
												/* $( "<ul/>", {
												  "class": "my-new-list",
												  html: items.join( "" )
												}).appendTo( "table" ); */
											});
						});
	</script>

	<script>
		$("#button2")
				.click(
						function() {
							var ps = $("#primarySpecialty").val();
							var state = $("#state").val();

							if (ps == "" && state == "") {
								$("#warning1").html(
										"Select at least one query criterion")
										.css("color", "red");
								return;

							}

							document.getElementById('search_title1').innerHTML = "Loading.....";
							$
									.getJSON(
											"search1/" + ps + "+" + state,
											function(data) {
												var counter1 = 0;
												var items2 = "<tbody>";
												var itemshead = "<thead><tr>";
												$
														.each(
																data,
																function(key,
																		val) {

																	items2 += "<tr>";
																	$
																			.each(
																					val,
																					function(
																							subkey,
																							subval) {
																						if (counter1 == 0) {
																							itemshead += "<th>"
																									+ subkey
																									+ "</th>";
																						}
																						items2 += "<td>"
																								+ subval
																								+ "</td>";
																					});
																	items2 += "</td>";
																	counter1++;
																});
												itemshead += "</tr></thead>";
												items2 += "</tbody>";
												document
														.getElementById('search_title1').innerHTML = counter1
														+ " records found in our Database.";
												document
														.getElementById('resultTable1').innerHTML = itemshead
														+ items2;
												/* items1.appendTo("table"); */
												/* $( "<ul/>", {
												  "class": "my-new-list",
												  html: items.join( "" )
												}).appendTo( "table" ); */
											});
						});
	</script>


</body>

</html>
