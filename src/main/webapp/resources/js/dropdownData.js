function refreshMap(state) {
        var filePathForRefresh = "resources/data/uniqueLatLonMA.csv";
        var lat = 42.140741;
        var lon = -71.64376;
        if (state == 'MA') {
            filePathForRefresh = "resources/data/uniqueLatLonMA.csv";
            lat = 42.140741;
            lon = -71.64376;
        } else if (state == 'CA') {
            filePathForRefresh = "resources/data/uniqueLatLonCA.csv";
            lat = 36.116203;
            lon = -119.681564;
        } else if (state == 'PA') {
            filePathForRefresh = "resources/data/uniqueLatLonPA.csv";
            lat = 40.590752;
            lon = -77.209755;
        } else if (state == 'NY') {
            filePathForRefresh = "resources/data/uniqueLatLonNY.csv";
            lat = 42.165726;
            lon = -74.948051;
        } else if (state == 'TX') {
            filePathForRefresh = "resources/data/uniqueLatLonTX.csv";
            lat = 31.054487;
            lon = -97.563461;
        } else if (state == 'FL') {
            filePathForRefresh = "resources/data/uniqueLatLonFL.csv";
            lat = 27.766279;
            lon = -81.686783;
        } else if (state == 'IL') {
            filePathForRefresh = "resources/data/uniqueLatLonIL.csv";
            lat = 40.349457;
            lon = -88.986137;
        } else if (state == 'MI') {
            filePathForRefresh = "resources/data/uniqueLatLonMI.csv";
            lat = 43.326618;
            lon = -84.536095;
        } else if (state == 'OH') {
            filePathForRefresh = "resources/data/uniqueLatLonOH.csv";
            lat = 40.388783;
            lon = -82.764915;
        } else if (state == 'VA') {
            filePathForRefresh = "resources/data/uniqueLatLonVA.csv";
            lat = 37.769337;
            lon = -78.169968;
        } else if (state == 'GA') {
            filePathForRefresh = "resources/data/uniqueLatLonGA.csv";
            lat = 33.040619;
            lon = -83.643074;
        } else if (state == 'NC') {
            filePathForRefresh = "resources/data/uniqueLatLonNC.csv";
            lat = 35.630066;
            lon = -79.806419;
        } else if (state == 'WI') {
            filePathForRefresh = "resources/data/uniqueLatLonWI.csv";
            lat = 44.268543;
            lon = -89.616508;
        } else if (state == 'NJ') {
            filePathForRefresh = "resources/data/uniqueLatLonNJ.csv";
            lat = 40.298904;
            lon = -74.521011;
        } else if (state == 'MN') {
            filePathForRefresh = "resources/data/uniqueLatLonMN.csv";
            lat = 45.694454;
            lon = -93.900192;
        } else if (state == 'WA') {
            filePathForRefresh = "resources/data/uniqueLatLonWA.csv";
            lat = 47.400902;
            lon = -121.490494;
        } else if (state == 'MD') {
            filePathForRefresh = "resources/data/uniqueLatLonMD.csv";
            lat = 39.063946;
            lon = -76.802101;
        } else if (state == 'MO') {
            filePathForRefresh = "resources/data/uniqueLatLonMO.csv";
            lat = 38.456085;
            lon = -92.288368;
        } else if (state == 'TN') {
            filePathForRefresh = "resources/data/uniqueLatLonTN.csv";
            lat = 35.747845;
            lon = -86.692345;
        } else if (state == 'AZ') {
            filePathForRefresh = "resources/data/uniqueLatLonAZ.csv";
            lat = 33.729759;
            lon = -111.431221;
        } else if (state == 'IN') {
            filePathForRefresh = "resources/data/uniqueLatLonIN.csv";
            lat = 39.849426;
            lon = -86.258278;
        } else if (state == 'CO') {
            filePathForRefresh = "resources/data/uniqueLatLonCO.csv";
            lat = 39.059811;
            lon = -105.311104;
        } else if (state == 'AL') {
            filePathForRefresh = "resources/data/uniqueLatLonAL.csv";
            lat = 32.806671;
            lon = -86.791130;
        } else if (state == 'CT') {
            filePathForRefresh = "resources/data/uniqueLatLonCT.csv";
            lat = 41.597782;
            lon = -72.755371;
        } else if (state == 'KY') {
            filePathForRefresh = "resources/data/uniqueLatLonKY.csv";
            lat = 37.668140;
            lon = -84.670067;
        } else if (state == 'OR') {
            filePathForRefresh = "resources/data/uniqueLatLonOR.csv";
            lat = 44.572021;
            lon = -122.070938;
        } else if (state == 'LA') {
            filePathForRefresh = "resources/data/uniqueLatLonLA.csv";
            lat = 31.169546;
            lon = -91.867805;
        } else if (state == 'SC') {
            filePathForRefresh = "resources/data/uniqueLatLonSC.csv";
            lat = 33.856892;
            lon = -80.945007;
        } else if (state == 'ME') {
            filePathForRefresh = "resources/data/uniqueLatLonME.csv";
            lat = 44.693947;
            lon = -69.381927;
        } else if (state == 'IA') {
            filePathForRefresh = "resources/data/uniqueLatLonIA.csv";
            lat = 42.011539;
            lon = -93.210526;
        } else if (state == 'WV') {
            filePathForRefresh = "resources/data/uniqueLatLonWV.csv";
            lat = 38.491226;
            lon = -80.954453;
        } else if (state == 'NH') {
            filePathForRefresh = "resources/data/uniqueLatLonNH.csv";
            lat = 43.452492;
            lon = -71.563896;
        } else if (state == 'KS') {
            filePathForRefresh = "resources/data/uniqueLatLonKS.csv";
            lat = 38.526600;
            lon = -96.726486;
        } else if (state == 'OK') {
            filePathForRefresh = "resources/data/uniqueLatLonOK.csv";
            lat = 35.565342;
            lon = -96.928917;
        }

        loading(filePathForRefresh, lat, lon);
    }