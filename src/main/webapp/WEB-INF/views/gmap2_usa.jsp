<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Heatmaps</title>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- Custom CSS -->
    <link href="resources/css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="resources/css/d3.slider.css" />
    <link href="resources/css/metricsgraphics.css" rel="stylesheet" type="text/css">
    <link href='resources/css/metricsgraphics-demo-dark.css' rel='stylesheet' type='text/css'>
    <!-- font -->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300' rel='stylesheet' type='text/css'>
    <!-- Costomized Style -->
    <link rel="stylesheet" href="resources/css/style.css" />
    <style>
    html,
    body,
    #map-canvas {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    
    #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
    }
    /*
      Provide the following styles for both ID and class,
      where ID represents an actual existing "panel" with
      JS bound to its name, and the class is just non-map
      content that may already have a different ID with
      JS bound to its name.
      */
    
    #panel,
    .panel {
        font-family: 'Roboto', 'sans-serif';
        line-height: 30px;
        padding-left: 10px;
    }
    
    #panel select,
    #panel input,
    .panel select,
    .panel input {
        font-size: 15px;
    }
    
    #panel select,
    .panel select {
        width: 100%;
    }
    
    #panel i,
    .panel i {
        font-size: 12px;
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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Physician Distribution</a>
            </div>
            <!-- Top Menu Items -->
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="dashboard"><i class="fa fa-fw fa-dashboard"></i> Overview</a>
                    </li>
                    <li>
                        <a href="page2"><i class="fa fa-fw fa-dashboard"></i> Search a Physician</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-crosshairs"></i> Heat Map <i class="fa fa-fw fa-ret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li class="active">
                                <a href="#">United States</a>
                            </li>
                            <li>
                                <a href="gmap2">Individual States</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="gmap2_chart.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                    </li>
                    <li>
                        <a href="mahout"><i class="fa fa-fw fa-bar-chart-o"></i>Event Classification</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <div id="map-canvas">
            <!-- Cover -->
            <div class="cover">
                <h1>Loading Data...</h1>
                <div class="progress">
                    <div id="progress-bar" class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                        <span class="sr-only">0% Complete </span>
                    </div>
                </div>
            </div>
            <!-- /Cover -->
        </div>
        
    </div>
    <!-- end wrapper -->
   
    <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=visualization"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js" charset="utf-8"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/queue-async/1.0.7/queue.min.js"></script>
    <script src="resources/js/jquery.csv-0.71.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="resources/js/plugins/morris/raphael.min.js"></script>
    <script src="resources/js/plugins/morris/morris.min.js"></script>
    <script src="resources/js/plugins/morris/morris-data.js"></script>

    <script src="resources/js/dropdownData.js"></script>
    <script>
    var map_height = window.innerHeight - 50;
    //var statistic_wrap_width = $(".chart-wrap").css("width") * 0.225;

    console.log("window height " + window.innerHeight);
    console.log("Avail Height" + screen.availHeight);

    $("#map-canvas").css("height", map_height);
    var data_wrap_height = Math.floor(map_height * 0.25);
    $(".data-wrap").css("height", data_wrap_height);
    $(".data-wrap").css("width", $("#map-canvas").width());


    var filePath = "resources/data/uniqueWholeRecordsLatLon.csv";

    loading(filePath,39.095963, -101.425781);


    function initialize(data1) {
        var map, pointarray, heatmap;

        // load data
        var heatdata = [];
        var count = 0;
        $.each(data1, function(index, a) {

            var tempweight;
            if (parseInt(a[2]) < 200)
                tempweight = 1;
            else if (parseInt(a[2]) > 200 && parseInt(a[2]) < 600)
                tempweight = 2;
            else
                tempweight = 3;

            heatdata.push({
                location: new google.maps.LatLng(a[0], a[1]),
                weight: tempweight
            });
            // heatdata.push(new google.maps.LatLng(a[0], a[1]));
            count++;
        });
        console.log("Points count are: " + count);

        var mapOptions = {
            zoom: 4,
            center: new google.maps.LatLng(lati, longi),
            // center: new google.maps.LatLng(17.75, -64.75),
            mapTypeId: google.maps.MapTypeId.HYBRID
        };

        map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

        // var pointArray = new google.maps.MVrray(heatdata);

        heatmap = new google.maps.visualization.HeatmapLayer({
            data: heatdata
        });

        heatmap.setMap(map);
    }


    /* function ready(error, data1) {
        google.maps.event.addDomListener(window, 'load', initialize(data1));
        d3.selectAll(".cover").transition().delay(10000).remove();
        d3.selectAll(".data-wrap").style("display", "inline");
    } */
    
    function ready(error, data1) {
    	loadmap(data1, function() {
    		 d3.selectAll(".cover").transition().delay(10000).remove();
    	     d3.selectAll(".data-wrap").style("display", "inline");
    	})
       
    }

    function loadmap(data1, callback) {
    	google.maps.event.addDomListener(window, 'load', initialize(data1));
    	callback();
    }

    var lati, longi;

    function loading(filePath, lat, lon) {
        lati = lat;
        longi = lon;
        //initial queue
        var progress = 0.1,
            //total = 77100000;
            total = 13160;


        queue()
            .defer(function(f) {
                d3.csv(filePath)
                    .on("progress", function() {
                    	
                    	/* if (d3.event.lengthComputable) {
                            var percentComplete = Math.round(d3.event.loaded * 100 / d3.event.total);
                            console.log(percentComplete);
                         } */
                    	
                    	var percentComplete = Math.round(d3.event.loaded * 100 / d3.event.total);
                        if (percentComplete < 101) {
                            console.log("Finish " + percentComplete + "%.");
                            d3.select("#progress-bar").style("width", percentComplete + "%");
                        } 
                    	
                        /* var percentComplete = d3.event.loaded / total;
                        if (percentComplete > progress) {
                            console.log("Finish " + progress * 100 + "%.");
                            d3.select("#progress-bar").style("width", progress * 100 + "%");
                            progress += 70;
                        } */
                    })
                    .get(function(error, d) {
                        progress = 1;
                        d3.select("#progress-bar").style("width", progress * 100 + "%");
                        var temp = d.map(function(row) {
                            // return [row.date, row.lat, row.lng, row.count];
                            return [row.latitude, row.longitude, row.count];
                        });
                        f(error, temp);
                    })
            })
            .await(ready);
    }



    </script>

</body>

</html>
