<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Mahout Naive Bayes Demo -- Event Classification</title>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- Custom CSS -->
    <link href="resources/css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="resources/css/d3.slider.css" />
    <!-- <link href="resources/css/metricsgraphics.css" rel="stylesheet" type="text/css">
    <link href='resources/css/metricsgraphics-demo-dark.css' rel='stylesheet' type='text/css'> -->
    <!-- font -->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300' rel='stylesheet' type='text/css'>
    <!-- Costomized Style -->
    <link rel="stylesheet" href="resources/css/style.css" />
    
    <style>
    .panel-body {
        background: #222;
    }
    #trainOut {
        display: none;
    }
    #testOut {
        display: none;
    }

    table tr td {
        padding-right: 20px
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
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-crosshairs"></i> Heat Map <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="gmap2_usa">United States</a>
                            </li>
                            <li>
                                <a href="gmap2">Individual States</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="gmap2_chart"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                    </li>
                    
                     <li class="active">
                        <a href="#"><i class="fa fa-fw fa-bar-chart-o"></i>Event Classification</a>
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
                   <div class="col-md-12" ><!-- col-md-12 -->
                   <div class="panel panel-primary"><!-- panel -->
                   <div class="panel-heading">This is the Data Format used for training model </div>
                   <table class="table">
                   		<tr class="active">
                   			<th>Matrix Name(Category)</th>
                   			<th>EventId</th>
                   			<th>Description</th>
                   		</tr>
						<tr class="success">
							<td>Blood pressure management</td>
							<td>1</td>
							<td>82.96% of patients have had a last blood pressure reading of 150/90 or below</td>
						</tr>
						<tr class="warning">
							<td>Care of Over 75s</td>
							<td>2</td>
							<td>Performing as or better than expected for 4 out of 4 indicators</td>
						</tr>
						<tr class="danger">
							<td>Cervical cancer screening</td>
							<td>4</td>
							<td>81.10% of women have attended cervical screening</td>
						</tr>
						<tr class="info">
							<td>Chronic Disease Management</td>
							<td>5</td>
							<td>Performing as or better than expected for 4 out of 6 indicators</td>
						</tr>
                        <tr class="success">
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                        </tr>
                   	</table>
                   	</div><!-- /panel -->
                   </div><!-- /col-md-12 -->
               </div><!-- /row -->

               <div class="row"><!-- row -->
                   <div class="col-md-12" ><!-- col-md-12 -->
                        <div class="jumbotron">
                            <h2>Mahout Naive Bayes classification Procedure</h2>
                            <ul class="list-group">
                            <li class="list-group-item list-group-item-info">
                                Step 1 : make vectors <br>
mahout seq2sparse -i /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/survey-seq -o /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/survey-vectors
                            </li>
                            <li class="list-group-item list-group-item-info">
                                Step 2 : split to training and testing <br>
mahout split -i /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/survey-vectors/tfidf-vectors --trainingOutput /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/train_vectors --testOutput /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/test_vectors --randomSelectionPct 40 --overwrite --sequenceFiles -xm sequential
                            </li>
                            <li class="list-group-item list-group-item-info">
                                Step 3 : training model <br>
                                mahout trainnb -i /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/train_vectors -li /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/labelindex -o /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/model -ow -c
                            </li>
                            <li class="list-group-item list-group-item-info">
                                Step 4 : testing by training set <br>
./bin/mahout testnb -i /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/train_vectors -m /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/model -l /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/labelindex -ow -o /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/survey-tesing -c
                            </li>
                            <li class="list-group-item list-group-item-info">
                                Step 5 : testing by testing set <br>
./bin/mahout testnb -i /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/test_vectors -m /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/model -l /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/labelindex -ow -o /Users/weiweisu/Documents/GitHub/mahout-naive-bayes-example/data2/survey-tesing -c
                            </li>
                            <li class="list-group-item list-group-item-success">
                                <h3>Done! Ready to use!</h3>
                            </li>
                            </ul>
                        </div>
                   </div><!-- /col-md-12 -->
                </div><!-- /row -->

                <div class="row"><!-- row -->
                   <div class="col-md-12" ><!-- col-md-12 -->
                   <button id="trainButton" type="button" class="btn btn-warning">Test Classifier by training set</button>
                   <div id="trainOut">
                       <ul class="list-group">
                            <li class="list-group-item list-group-item-info">
                                Summary <br>
                                ==================================================================<br>
                                <table>
                                    <tr>
                                        <td>Correctly Classified Instances : </td>
                                        <td>5720</td>
                                        <td>95.9732%</td>
                                    </tr>
                                    <tr>
                                        <td>Incorrectly Classified Instances : </td>
                                        <td>240</td>
                                        <td>4.0268%</td>
                                    </tr>
                                    <tr>
                                        <td>Total Classified Instances : </td>
                                        <td>5960</td>
                                        <td></td>
                                    </tr>
                                </table>
                            </li>
                            <li class="list-group-item list-group-item-info">
                                Statistics <br>
                                ==================================================================<br>
                                <table>
                                    <tr>
                                        <td>Kappa : </td>
                                        <td>0.9425</td>
                                    </tr>
                                    <tr>
                                        <td>Accuracy : </td>
                                        <td>95.9732%</td>
                                    </tr>
                                    <tr>
                                        <td>Reliability : </td>
                                        <td>89.2356%</td>
                                    </tr>
                                    <tr>
                                        <td>Reliability (standard deviation) : </td>
                                        <td>0.2608</td>
                                    </tr>
                                    <tr>
                                        <td>Weighted precision : </td>
                                        <td>0.9477</td>
                                    </tr>
                                    <tr>
                                        <td>Weighted recall : </td>
                                        <td>0.9597</td>
                                    </tr>
                                    <tr>
                                        <td>Weighted F1 score : </td>
                                        <td>0.9506</td>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                   </div>
                   </div>
                </div>
                <br>
                <div class="row"><!-- row -->
                   <div class="col-md-12" ><!-- col-md-12 -->
                   <button id="testButton" type="button" class="btn btn-warning">Test Classifier by testing set</button>
                   <div id="testOut">
                       <ul class="list-group">
                            <li class="list-group-item list-group-item-info">
                                Summary <br>
                                ==================================================================<br>
                                <table>
                                    <tr>
                                        <td>Correctly Classified Instances : </td>
                                        <td>3767</td>
                                        <td>94.2221%</td>
                                    </tr>
                                    <tr>
                                        <td>Incorrectly Classified Instances : </td>
                                        <td>231</td>
                                        <td>5.7779%</td>
                                    </tr>
                                    <tr>
                                        <td>Total Classified Instances : </td>
                                        <td>3998</td>
                                        <td></td>
                                    </tr>
                                </table>
                            </li>
                            <li class="list-group-item list-group-item-info">
                                Statistics <br>
                                ==================================================================<br>
                                <table>
                                    <tr>
                                        <td>Kappa : </td>
                                        <td>0.9166</td>
                                    </tr>
                                    <tr>
                                        <td>Accuracy : </td>
                                        <td>94.2221%</td>
                                    </tr>
                                    <tr>
                                        <td>Reliability : </td>
                                        <td>85.209%</td>
                                    </tr>
                                    <tr>
                                        <td>Reliability (standard deviation) : </td>
                                        <td>0.3401</td>
                                    </tr>
                                    <tr>
                                        <td>Weighted precision : </td>
                                        <td>0.9184</td>
                                    </tr>
                                    <tr>
                                        <td>Weighted recall : </td>
                                        <td>0.9422</td>
                                    </tr>
                                    <tr>
                                        <td>Weighted F1 score : </td>
                                        <td>0.9274</td>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                   </div>
                   </div>
                </div>

                
            </div><!-- /.container-fluid -->
        </div><!-- /#page-wrapper -->
    </div><!-- end wrapper -->
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
    $("#trainButton").click(function() {
        $("#trainOut").show(2000);
    });
    $("#testButton").click(function() {
        $("#testOut").show(1500);
    });
    </script>
</body>

</html>
