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
    .panel-body {
        background: #222;
    }
    </style>
</head>

<body>
    <div id="wrapper">
        <!-- begin wrapper -->
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-crosshairs"></i> Heat Map <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li class="active">
                                <a href="gmap2_usa">United States</a>
                            </li>
                            <li>
                                <a href="gmap2">Individual States</a>
                            </li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="gmap2_chart.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title text-center"><i class="fa fa-long-arrow-right fa-fw"></i> Physician Distribution Per Graduation Year</h3>
                            </div>
                            <div class="panel-body">
                                <div id="graduationYear">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <!-- chart data -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Female vs Male</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-area-chart"></i> Area chart for Physician Graduation Year</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-area-chart">
                                
                                </div>
                                <div class="text-right">
                                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row"><!--  row -->
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Category by Primary Specialty</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
               </div><!-- /row -->
               
               <div class="row"><!--  row -->
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Category by States</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart_states"></div>
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
               </div><!-- /row -->
                
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
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
    <script src='resources/js/metricsgraphics.min.js'></script>
    <script>
    var graduationfile = "resources/data/others/CountByGraduationYear.csv";

    queue()
        .defer(d3.csv, graduationfile, function(d) {
            return {
                "year": d.Graduation_year == "" ? "1772" : d.Graduation_year,
                "count": d.count
            }
        })
        .await(ready);

    function ready(error, data1) {
        // data1 = convert.date(data1, 'date');
        data_graphic({
            title: "Physician Distribution By Graduation Year.",
            description: "Physician count per graduation year.",
            data: data1,
            width: 650,
            height: 150,
            target: '#graduationYear',
            x_accessor: 'year',
            y_accessor: 'count',
            markers: [{
                'year': 1955,
                'label': 'Rapid increment started here'
            }]
            // ,
            // x_rug: true
        });
    }
    </script>
</body>

</html>
