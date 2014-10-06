<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>
<!-- 
 * Copyright (c) 2011-2012 , Zoya Pourmirza, 2012, All Rights Reserved.
 * 
 * == BEGIN LICENSE == 
 * 
 *      Licensed under the GNU Lasser General Public License, Version 2.1 (the "License");
 *      You may not use this file except in compliance with the License.
 *      You may obtain a copy of the License at
 *          - GNU Lesser General Public License Version 2.1 (the "LGPL") 
 *          http://www.gnu.org/licenses/lgpl-2.1.html
 * 
 *      This software is free; you can redistribute it and/or
 *      modify it under the terms of the GNU Lesser General Public
 *      License as published by the Free Software Foundation; either
 *      version 2.1 of the License, or (at your option) any later version.
 *
 *      This library is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU 
 *      Lesser General Public License for more details.
 *
 *      You should have received a copy of the GNU Lesser General Public
 *      License along with this software; if not, write to the Free Software
 *      Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 * 
 *      The University of Manchester, hereby disclaims all copyright interest in
 *      the software written by Zoya Pourmirza.
 *
 * 
 * == END LICENSE == 
 * 
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>University of Manchester_Google map view</title>
    <link href="StyleSheet.css" rel="Stylesheet" media="screen" />
    <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var neighborhoods = [
                new google.maps.LatLng(53.466246, -2.234559),
                new google.maps.LatLng(53.466246, -2.234559),
                new google.maps.LatLng(53.467083, -2.235825),
                new google.maps.LatLng(53.467083, -2.235825),
                new google.maps.LatLng(53.467792, -2.237091),
                new google.maps.LatLng(53.46677, -2.236952),
                new google.maps.LatLng(),
                new google.maps.LatLng(53.465876, -2.2359),
                new google.maps.LatLng(53.465876, -2.2359),
                new google.maps.LatLng(53.465493, -2.234602),
                new google.maps.LatLng(53.465493, -2.234602),
                new google.maps.LatLng(53.464318, -2.234795),
                new google.maps.LatLng(53.464318, -2.234795),
                new google.maps.LatLng(53.464369, -2.233615),
                new google.maps.LatLng(53.463219, -2.233143),
                new google.maps.LatLng(),
                new google.maps.LatLng(53.467521, -2.233869)
                ];

        var markers = [];
        var iterator = 0;
        var map;
        function initialize(var1, var2, var3, var4) {
            var mylatlng = new google.maps.LatLng(var1, var2);
            var mapOptions = {
                zoom: var3,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: mylatlng
            };

            map = new google.maps.Map(document.getElementById("map"),
                mapOptions);

            /*
            setMarkers(map, substations);
            var substations = [[]  
            [[]'cRIO 1', 53.466246, -2.234559, 4],
            [[]'cRIO 2', 53.466246, -2.234559, 5],                  
            [[]'cRIO 3', 53.467083, -2.235825, 3], 
            [[]'cRIO 4', 53.467083, -2.235825 , 2],
            [[]'cRIO 5', 53.467792, -2.237091, 1]
            ];
            function setMarkers(map, locations) {
            var image = new google.maps.MarkerImage('markers/green.png'),
            new google.maps.Size(20, 32),
            new google.maps.Point(0,0),      
            new google.maps.Point(0, 32));
            var shape = {     
            coord: [[]1, 1, 1, 20, 18, 20, 18 , 1], 
            type: 'poly'  }; 
            for (var i = 0; i < locations.length; i++) {
            var substations = locations[[]i];    
            var myLatLng = new google.maps.LatLng(substations[[]1], substations[[]2]);
            var marker = new google.maps.Marker({    
            position: myLatLng,   
            map: map,      
            shadow: shadow, 
            icon: image,    
            shape: shape,   
            title: substations[[]0],  
            zIndex: substations[[]3]  
            });
            }
            }
            */
            var greenMarkerImage = 'markers/green.png';
            var redMarkerImage = 'markers/red.png';
            var contentString = '<div id="content">' +
            '<div id="siteNotice">' + var4
            '</div>' + '</div>';
            var infowindow = new google.maps.InfoWindow({ content: contentString });

            var redMarker = new google.maps.Marker({
                position: mylatlng,
                map: map,
                title: "Substation palces",
                icon: redMarkerImage
            })

            google.maps.event.addListener(redMarker, 'onmouseover', function () {
                infowindow.open(map, redMarker);
            });
            greenMarker = new google.maps.Marker({
                position: mylatlng,
                map: map,
                title: "Substation places",
                icon: greenMarkerImage
            });
            google.maps.event.addListener(greenMarker, 'click', function () {
                infowindow.open(map, greenMarker);
            });
            var flightPath = new google.maps.Polyline({
                path: flightPlanCoordinates,
                strokeColor: "#FF0000",
                strokeOpacity: 1.0,
                strokeWeight: 2
            });
            flightPath.setMap(map);
        }
        function drop() {
            for (var i = 0; i < neighborhoods.length; i++) {
                setTimeout(function () {
                    addMarker();
                }, i * 200);
            }
        }

        function addMarker() {
            markers.push(new google.maps.Marker({
                position: neighborhoods[iterator],
                map: map,
                draggable: false,
                animation: google.maps.Animation.DROP
            }));
            iterator++;
        }
    </script>
</head>
<body onload="initialize(53.465799,-2.233229,15,'<h3> University of Manchester <h3>')">
    <div id="header">
        <div class= "img">
            <a href="http://www.manchester.ac.uk" target="_blank">
                <img style="height:165px; position:absolute; padding:0px; margin:0px;" src="L_shape_col_background.png" alt="The University of Manchester, established in 1824."/>
            </a>
        </div>
        <div id="timer">
            <script type="text/javascript">
                var d = new Date();
                document.write(d);   
            </script> 
        </div>        
        <div>
            <h1 class="titlestyle">
                <a onclick="initialize(53.465799,-2.233229,15)"> 
                    University of Manchester Campus Map
                    <br /> 
                </a>       
            </h1>      
        </div>
    </div> 
    <div id="wrapper">
        <div id="map">
            <noscript>
				<p id="onload">
					<br />
					<br />
					No Map Loaded! 
					<br />
					<br />
					Please Select the cRIO !
				</p>
            </noscript>
        </div>
        <div id="locations">
            <table class="ButtonsTable" cellpadding="0px" cellspacing="20px" style="text-decoration:none">
                <tr>
                    <td>
                        <!-- Manchester Museum -->
                        <a target='new_window' href="Sensor's DB/sensor1DB.aspx" onclick="initialize(53.466246,-2.234559,16,'<h3> University of Manchester Museum </h3> <br> cRIO 1 <br> NUMBER OF TAILS /PHASE: 2 (400mm) <br> DIAMETER OF TAILS: 37.2mm <br> NUMBER OF TRANSFORMERS/SUB: 2 x (800KVA) <br> TOP OR BOTTOM ENTRY: B')"> 
                            <!--onmouseover="initialize(53.465799,-2.233229,15)"-->
                            cRIO 1 
                        </a>
                    </td>
                    <td>
                        <!-- Manchester Museum -->
                        <a target='new_window' href="Sensor's DB/sensor2DB.aspx" onclick="initialize(53.466246,-2.234559,16,'<h3> University of Manchester Museum </h3> <br> cRIO 2 <br> NUMBER OF TAILS /PHASE: 2 (400mm) <br> DIAMETER OF TAILS: 37.2mm <br> NUMBER OF TRANSFORMERS/SUB: 2 x (800KVA) <br> TOP OR BOTTOM ENTRY: B')"> cRIO 2 </a>
	                </td>
                </tr>
                <tr>
                    <td>
                        <!-- Arthur Lewis -->
                        <a target='new_window' href="Sensor's DB/sensor3DB.aspx"" onclick="initialize(53.467083,-2.235825,16,'<h3> Arthur Lewis Building </h3> <br> cRIO 3 <br> NUMBER OF TAILS /PHASE: 2 (500mm) <br> DIAMETER OF TAILS: 42.5mm <br> NUMBER OF TRANSFORMERS/SUB: 2 x (800KVA) <br> TOP OR BOTTOM ENTRY: B')"> cRIO 3 </a>
                    </td>
                    <td>
                        <!-- Arthur Lewis-->
                        <a target='new_window' href="Sensor's DB/sensor4DB.aspx" onclick="initialize(53.467083,-2.235825,16,'<h3> Arthur Lewis Building </h3> <br> cRIO 4 <br> NUMBER OF TAILS /PHASE: 2 (500mm) <br> DIAMETER OF TAILS: 42.5mm <br> NUMBER OF TRANSFORMERS/SUB: 2 x (800KVA) <br> TOP OR BOTTOM ENTRY: B')"> cRIO 4 </a>
	                </td>
                </tr>
                <tr>
                    <td>
                        <!-- Manchester business school west -->
                        <a target='new_window' href="Sensor's DB/sensor5DB.aspx" onclick="initialize(53.467792,-2.237091,16,'<h3>Manchester Business School West </h3> <br> cRIO 5 <br> NUMBER OF TAILS /PHASE: 2 (400mm) <br> DIAMETER OF TAILS: 37.2mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x (800KVA) <br> TOP OR BOTTOM ENTRY: B')"> cRIO 5 </a>
                    </td>
                    <td>
                        <!--Humanities Bridgeford street -->
                        <a target='new_window' href="Sensor's DB/sensor6DB.aspx"" onclick="initialize(53.46677,-2.236952,16,'<h3> Humanities Bridgeford Street </h3> <br> cRIO 6 <br> NUMBER OF TAILS /PHASE: 1 (400mm) <br> DIAMETER OF TAILS: 42.5mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x (500KVA) <br> TOP OR BOTTOM ENTRY: T')"> cRIO 6 </a>
	                </td>
                </tr>
                <tr>
                    <td>
                        <!-- NWCP -->
                        <a target='new_window' href="Sensor's DB/sensor7DB.aspx" onclick="initialize(var1,var2,16,'<h3> NWCP </h3> <br> cRIO 7 <br> NUMBER OF TAILS /PHASE: 1 (400mm) <br> DIAMETER OF TAILS: 37.2mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x (500KVA) <br> TOP OR BOTTOM ENTRY: B')"> cRIO 7 </a>
                    </td>
                    <td>
                        <!-- Martin Harris Bridgeford Street -->
                        <a target='new_window' href="Sensor's DB/sensor8DB.aspx" onclick="initialize(53.465876,-2.2359,16,'<h3> Martin Harris Bridgeford Street </h3> <br> cRIO 8 <br> NUMBER OF TAILS /PHASE: 2 (400mm) <br> DIAMETER OF TAILS: 39.0mm <br> NUMBER OF TRANSFORMERS/SUB: 2 x (1000KVA) <br> TOP OR BOTTOM ENTRY: B')"> cRIO 8 </a>
	                </td>
                </tr>
                <tr>
                    <td>
                        <!-- Martin Harris Bridgeford Street -->      
                        <a target='new_window' href="Sensor's DB/sensor9DB.aspx"" onclick="initialize(53.465876,-2.2359,16,'<h3> Martin Harris Bridgeford Street </h3> <br> cRIO 9 <br> NUMBER OF TAILS /PHASE: 2 (400mm) <br> DIAMETER OF TAILS: 39.0mm <br> NUMBER OF TRANSFORMERS/SUB: 2 x (1000KVA) <br> TOP OR BOTTOM ENTRY: B')"> cRIO 9 </a>
                    </td>
                    <td>
                        <!-- Main Building John Owens -->
                        <a target='new_window' href="Sensor's DB/sensor10DB.aspx"" onclick="initialize(53.465493,-2.234602,16,'<h3> Main Building John Owens </h3> <br> cRIO 10 <br> NUMBER OF TAILS /PHASE: 2 (400mm) T1, 1 (400mm) T2 <br> DIAMETER OF TAILS: 37.7mm, 37.7mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x 750 KVA  T1, 1 x 500 KVA  T2  <br> TOP OR BOTTOM ENTRY: T')"> cRIO 10 </a>
	                </td>
                </tr>           
                <tr>
                    <td>
                        <!-- Main Building John Owens -->
                        <a target='new_window' href="Sensor's DB/sensor11DB.aspx" onclick="initialize(53.465493,-2.234602,16,'<h3> Main Building John Owens </h3> <br> cRIO 11 <br> NUMBER OF TAILS /PHASE: 2 (400mm) T1, 1 (400mm) T2 <br> DIAMETER OF TAILS: 37.7mm, 37.7mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x 750 KVA  T1, 1 x 500 KVA  T2  <br> TOP OR BOTTOM ENTRY: T')"> cRIO 11 </a>
                    </td>
                    <td>
                        <!-- JURL -->
                        <a target='new_window' href="Sensor's DB/sensor12DB.aspx"" onclick="initialize(53.464318,-2.234795,16,'<h3> John Rylands University Library </h3> <br> cRIO 12 <br> NUMBER OF TAILS /PHASE: 2 (400mm) T1, 2 (400mm) T2  <br> DIAMETER OF TAILS: 37.2mm, 37.2mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x 800 KVA T1, 1 x 800 KVA T2 <br> TOP OR BOTTOM ENTRY: T')"> cRIO 12 </a>
	                </td>
                </tr>  
                <tr>
                    <td>
                        <!-- JURL -->
                        <a target='new_window' href="Sensor's DB/sensor13DB.aspx"" onclick="initialize(53.464318,-2.234795,16,'<h3> John Rylands University Library </h3> <br> cRIO 13 <br> NUMBER OF TAILS /PHASE: 2 (400mm) T1, 2 (400mm) T2  <br> DIAMETER OF TAILS: 37.2mm, 37.2mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x 800 KVA T1, 1 x 800 KVA T2 <br> TOP OR BOTTOM ENTRY: T')"> cRIO 13 </a>
                    </td>
                    <td>
                        <!-- Art Samuel Alexander -->
                        <a target='new_window' href="Sensor's DB/sensor14DB.aspx" onclick="initialize(53.464369,-2.233615,16,'<h3> Arts Samuel Alexander </h3> <br> cRIO 14 <br> NUMBER OF TAILS /PHASE: 2 (400mm) T1 <br> DIAMETER OF TAILS: 37.2mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x 800 KVA T1 <br> TOP OR BOTTOM ENTRY: B')"> cRIO 14 </a>
	                </td>
                </tr>
                <tr>
                    <td>
                        <!-- Ellen Wilkinson -->
                        <a target='new_window' href="Sensor's DB/sensor15DB.aspx" onclick="initialize(53.463219,-2.233143,16,'<h3> Ellen Wilkinson </h3> <br> cRIO 15 <br> NUMBER OF TAILS /PHASE: 1 (500mm) T1 <br> DIAMETER OF TAILS: 42.5mm <br> NUMBER OF TRANSFORMERS/SUB: 1 x 800 KVA T1 <br> TOP OR BOTTOM ENTRY: T')"> cRIO 15 </a>
                    </td>
                    <td>
                        <!-- Centrifuge -->
                        <a target='new_window' href="Sensor's DB/sensor16DB.aspx" onclick="initialize(2,3,16)"> cRIO 16 </a>
	                </td>
                </tr>
                <tr>
                    <td>
                        <button id="drop" onclick="drop()">Drop Markers</button>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <!-- Kilburn Building (smart_meters) -->
                        <a target='new_window' href="Sensor's DB/postgretest16.aspx" onclick="initialize(53.467521,-2.233869,16,'<h3> Kilburn Building (Smart_Meters) </h3> <br> Smart_Meters data update every 30 minutes')">Kilburn_meters</a> 
                                         
                    </td>
                   
                    <td></td>
                </tr> 
                <tr>
                    <td>
                        <a target='new_window' href="Sensor's DB/Simul.aspx"><button id="simulationButton">Simulation</button></a>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>   
    </div>
    <div id="footer">
        Please use the Firefox browser!!!<br/>Designed by Zoya Pourmirza &copy; -2011
    </div>  
</body>
</html>