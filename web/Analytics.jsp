<%-- 
    Document   : Analytics
    Created on : Apr 28, 2017, 1:11:39 PM
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Style sheets for styling are imported via CDN. 
             I used the popular Skeleton.css framework available via http://getskeleton.com/
             This makes things look a bit nicer without adding much complexity.-->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/6.0.0/normalize.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">

        <!-- Styles -->
        <style>
            
            .charts 
            {
                margin-bottom: 2em;
            }
            
            .chart_heading
            {
                margin-top: 0.5em;
                margin-bottom: 0.5em;
                font-weight: 600;
                font-size: 1.5em;
            }
            
            #chartdiv {
                width	: 100%;
                height	: 500px;
            }	
            #chartdiv2 {
                width		: 100%;
                height		: 500px;
                font-size	: 11px;
            }
            #chartdiv3 {
                width		: 100%;
                height		: 500px;
                font-size	: 11px;
            }	
            
            * 
            {
                font-family: 'Source Sans Pro', sans-serif;
                font-weight: 300;
                font-size: large;
            }
            
            .container { margin-top: 50px; }
            
            hr
            {
                margin-bottom: 3em;
            }
            
        </style>

        <!-- Resources -->
        <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
        <script src="https://www.amcharts.com/lib/3/serial.js"></script>
        <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

        <title>Analytics Page</title>
    </head>
    <body>

        <div class="container"> 
            <form action="Home" method="GET">
                <input type="hidden" name="username" value="admin" />
                <input type="submit" style="float: right;" class="button" value="Home" name="Home"/><br>
            </form>
            
            <h3>Analytics</h3>
            
            <h2 class="chart_heading">Number of Tutoring Sessions per Day in First Month</h2>

            <!-- Chart code -->
            <script>
                var chartData = generateChartData();
                var chart = AmCharts.makeChart("chartdiv", {
                    "type": "serial",
                    "theme": "light",
                    "marginRight": 80,
                    "autoMarginOffset": 20,
                    "marginTop": 7,
                    "dataProvider": chartData,
                    "valueAxes": [{
                            "axisAlpha": 0.2,
                            "dashLength": 1,
                            "position": "left"
                        }],
                    "mouseWheelZoomEnabled": true,
                    "graphs": [{
                            "id": "g1",
                            "balloonText": "[[value]]",
                            "bullet": "round",
                            "bulletBorderAlpha": 1,
                            "bulletColor": "#FFFFFF",
                            "hideBulletsCount": 50,
                            "title": "red line",
                            "valueField": "visits",
                            "useLineColorForBulletBorder": true,
                            "balloon": {
                                "drop": true
                            }
                        }],
                    "chartScrollbar": {
                        "autoGridCount": true,
                        "graph": "g1",
                        "scrollbarHeight": 40
                    },
                    "chartCursor": {
                        "limitToGraph": "g1"
                    },
                    "categoryField": "date",
                    "categoryAxis": {
                        "parseDates": true,
                        "axisColor": "#DADADA",
                        "dashLength": 1,
                        "minorGridEnabled": true
                    },
                    "export": {
                        "enabled": false
                    },
                    "hideCredits": {
                        "enabled": false
                    }
                });

                chart.addListener("rendered", zoomChart);
                zoomChart();

                // this method is called when chart is first inited as we listen for "rendered" event
                function zoomChart() {
                    // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                    chart.zoomToIndexes(chartData.length - 40, chartData.length - 1);
                }


                // generate some random data, quite different range
                function generateChartData() {
                    var chartData = [];
                    var firstDate = new Date();
                    firstDate.setDate(firstDate.getDate() - 256);

                    for (var i = 0; i < 32; i++) {
                        // we create date objects here. In your data, you can have date strings
                        // and then set format of your dates using chart.dataDateFormat property,
                        // however when possible, use date objects, as this will speed up chart rendering.
                        var newDate = new Date(firstDate);
                        newDate.setDate(newDate.getDate() + i);

                        var visits = Math.round(Math.random() * (2 + i / 5)) + 20 + i;

                        chartData.push({
                            date: newDate,
                            visits: visits
                        });
                    }
                    return chartData;
                }
            </script>

            <!-- HTML -->
            <div class="charts" id="chartdiv"></div>
            <hr>
            
            <h2 class="chart_heading">Number of Tutoring Sessions per Class Year</h2>

            <!-- Chart code -->
            <script>
                var chart = AmCharts.makeChart("chartdiv2", {
                    "type": "serial",
                    "theme": "light",
                    "dataProvider": [{
                            "country": "Freshman",
                            "visits": 1200
                        }, {
                            "country": "Sophomore",
                            "visits": 2500
                        }, {
                            "country": "Junior",
                            "visits": 2000
                        }, {
                            "country": "Senior",
                            "visits": 800
                        }],
                    "valueAxes": [{
                            "gridColor": "#FFFFFF",
                            "gridAlpha": 0.2,
                            "dashLength": 0
                        }],
                    "gridAboveGraphs": true,
                    "startDuration": 1,
                    "graphs": [{
                            "balloonText": "[[category]]: <b>[[value]]</b>",
                            "fillAlphas": 0.8,
                            "lineAlpha": 0.2,
                            "type": "column",
                            "valueField": "visits"
                        }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "country",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "gridAlpha": 0,
                        "tickPosition": "start",
                        "tickLength": 20
                    },
                    "export": {
                        "enabled": false
                    },
                    "hideCredits": {
                        "enabled": false
                    }
                });
            </script>

            <!-- HTML -->
            <div class="charts" id="chartdiv2"></div>	
            <hr>
            
            <h2 class="chart_heading">Ratio of Overall Courses tutored per Semester</h2>

            <!-- Chart code -->
            <script>
                var chart = AmCharts.makeChart("chartdiv3", {
                    "type": "serial",
                    "theme": "light",
                    "legend": {
                        "autoMargins": false,
                        "borderAlpha": 0.2,
                        "equalWidths": false,
                        "horizontalGap": 10,
                        "markerSize": 10,
                        "useGraphSettings": true,
                        "valueAlign": "left",
                        "valueWidth": 0
                    },
                    "dataProvider": [{
                            "year": "Fall 2015",
                            "Calculus": 3,
                            "Data Structures": 2.5,
                            "Database": 2.1,
                            "Physics": 0.3,
                            "Distributed Systems": 0.2,
                            "Finance": 0.1
                        }, {
                            "year": "Spring 2016",
                            "Calculus": 3.5,
                            "Data Structures": 1.3,
                            "Database": 2.9,
                            "Physics": 0.3,
                            "Distributed Systems": 0.3,
                            "Finance": 0.1
                        }, {
                            "year": "Fall 2016",
                            "Calculus": 2,
                            "Data Structures": 2.9,
                            "Database": 2.4,
                            "Physics": 0.3,
                            "Distributed Systems": 1.2,
                            "Finance": 0.1
                        }, {
                            "year": "Spring 2017",
                            "Calculus": 2,
                            "Data Structures": 4,
                            "Database": 2.4,
                            "Physics": 0.3,
                            "Distributed Systems": 2,
                            "Finance": 0.1
                        }
                    ],
                    "valueAxes": [{
                            "stackType": "100%",
                            "axisAlpha": 0,
                            "gridAlpha": 0,
                            "labelsEnabled": false,
                            "position": "left"
                        }],
                    "graphs": [{
                            "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><b>[[value]]</b> ([[percents]]%)</span>",
                            "fillAlphas": 0.9,
                            "fontSize": 11,
                            "labelText": "[[percents]]%",
                            "lineAlpha": 0.5,
                            "title": "Calculus",
                            "type": "column",
                            "valueField": "Calculus"
                        }, {
                            "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><b>[[value]]</b> ([[percents]]%)</span>",
                            "fillAlphas": 0.9,
                            "fontSize": 11,
                            "labelText": "[[percents]]%",
                            "lineAlpha": 0.5,
                            "title": "Data Structures",
                            "type": "column",
                            "valueField": "Data Structures"
                        }, {
                            "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><b>[[value]]</b> ([[percents]]%)</span>",
                            "fillAlphas": 0.9,
                            "fontSize": 11,
                            "labelText": "[[percents]]%",
                            "lineAlpha": 0.5,
                            "title": "Database",
                            "type": "column",
                            "valueField": "Database"
                        }, {
                            "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><b>[[value]]</b> ([[percents]]%)</span>",
                            "fillAlphas": 0.9,
                            "fontSize": 11,
                            "labelText": "[[percents]]%",
                            "lineAlpha": 0.5,
                            "title": "Physics",
                            "type": "column",
                            "valueField": "Physics"
                        }, {
                            "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><b>[[value]]</b> ([[percents]]%)</span>",
                            "fillAlphas": 0.9,
                            "fontSize": 11,
                            "labelText": "[[percents]]%",
                            "lineAlpha": 0.5,
                            "title": "Distributed Systems",
                            "type": "column",
                            "valueField": "Distributed Systems"
                        }, {
                            "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><b>[[value]]</b> ([[percents]]%)</span>",
                            "fillAlphas": 0.9,
                            "fontSize": 11,
                            "labelText": "[[percents]]%",
                            "lineAlpha": 0.5,
                            "title": "Finance",
                            "type": "column",
                            "valueField": "Finance"
                        }],
                    "marginTop": 30,
                    "marginRight": 0,
                    "marginLeft": 0,
                    "marginBottom": 40,
                    "autoMargins": false,
                    "categoryField": "year",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "axisAlpha": 0,
                        "gridAlpha": 0
                    },
                    "export": {
                        "enabled": false
                    },
                    "hideCredits": {
                        "enabled": false
                    }

                });
            </script>

            <!-- HTML -->
            <div class="charts" id="chartdiv3"></div>
        </div>
    </body>
</html>
