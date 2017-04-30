<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MDTutor login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Style sheets for styling are imported via CDN. 
             I used the popular Skeleton.css framework available via http://getskeleton.com/
             This makes things look a bit nicer without adding much complexity.-->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/6.0.0/normalize.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">


        <style>
            * 
            {
                font-family: 'Source Sans Pro', sans-serif;
                font-weight: 300;
                /*font-size: small;*/
            }

            .container { margin-top: 50px !important;
                         margin: auto;
            }
            

            table { 
                width: 100%; 
                border-collapse: collapse; 
            }
            th { 
                background: #eee; 
                padding: 6px !important;
                font-weight: 400;
            }
            td, th { 
                padding: 6px;
                text-align: left; 
            }
            
            th:first-child, td:first-child
            {
                padding: 6px;
            }

            /*
            Max width before this PARTICULAR table gets nasty
            This query will take effect for any screen smaller than 760px
            and also iPads specifically.
            */
            @media
            only screen and (max-width: 760px),
            (min-device-width: 768px) and (max-device-width: 1024px)  {

                td:first-child
                {
                    text-align: center;
                    font-weight: 600;
                    border-bottom: 3px solid #eee;
                }
                
                
                /* Force table to not be like tables anymore */
                table, thead, tbody, th, td, tr {
                    display: block;
                }

                /* Hide table headers (but not display: none;, for accessibility) */
                thead tr 
                {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

                tr 
                {   
                    border: 1px solid #ccc; 
                    margin-bottom: 20px;
                }

                td 
                {
                    /* Behave  like a "row" */
                    border: none;
                    border-bottom: 1px solid #eee;
                    position: relative;
                    padding-left: 50%;
                }

                td:before {
                    /* Now like a table header */
                    position: absolute;
                    /* Top/left values mimic padding */
                    top: 6px;
                    left: 6px;
                    width: 45%;
                    padding-right: 10px;
                    white-space: nowrap;
                } 
                
                       
            
                .container { margin-top: 20px; }

                /*
                Label the data
                */
                td:nth-of-type(1):before { content: " "; }
                td:nth-of-type(2):before { content: "Tutor:"; }
                td:nth-of-type(3):before { content: "Tutee:"; }
                td:nth-of-type(4):before { content: "Course:"; }
                td:nth-of-type(5):before { content: "Date:"; }
                td:nth-of-type(6):before { content: "Start Time:"; }
                td:nth-of-type(7):before { content: "End Time:"; }
                td:nth-of-type(8):before { content: "Surge:"; }
                td:nth-of-type(9):before { content: "Rate:"; }
                td:nth-of-type(10):before { content: "Payment Amount:"; }
                td:nth-of-type(11):before { content: "Payment Status:"; }
                td:nth-of-type(12):before { content: "Transaction ID:"; }

                /* Smartphones (portrait and landscape) ----------- */
                @media only screen
                and (min-device-width : 320px)
                and (max-device-width : 480px) {
                    body {
                        padding: 0;
                        margin: 0;
                        width: 320px; }
                }

                /* iPads (portrait and landscape) ----------- */
                @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) {
                    body {
                        width: 495px;
                    }
                }

            </style>
        </head>
        <body>
            <div class="container">
            <form action="Home" method="GET">
                <input type="hidden" name="username" value="admin" />
                <input type="submit" style="float: right;" class="button" value="Home" name="Home"/><br>
            </form>
                <h3>Payment Logs</h3>
                <table>
                    <thead>
                        <tr>
                            <th nowrap="nowrap"><b>Session #</b></th>
                            <th nowrap="nowrap"><b>Tutor</b></th>
                            <th nowrap="nowrap"><b>Tutee</b></th>
                            <th nowrap="nowrap"><b>Course</b></th>
                            <th nowrap="nowrap"><b>Date</b></th>
                            <th nowrap="nowrap"><b>Start Time</b></th>
                            <th nowrap="nowrap"><b>End Time</b></th>
                            <th nowrap="nowrap"><b>Surge</b>
                            <th nowrap="nowrap"><b>Rate</b></th>
                            <th><b>Payment Amount</b></th>
                            <th><b>Payment Status</b></th>
                            <th nowrap="nowrap"><b>Transaction ID</b></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> 00001</td>
                            <td>Paul Verardi</td>
                            <td>Theresa Froehlich</td>
                            <td>Data Structures</td>
                            <td>Wednesday, April 25 2017</td>
                            <td>1:00 PM </td>
                            <td>2:00 PM </td>
                            <td>x1.0</td>
                            <td>$10/hr</td>
                            <td>$10.00</td>
                            <td style="color: green;">Completed</td>
                            <td nowrap="nowrap">001432</td>
                        </tr>
                        <tr>
                            <td> 00002</td>
                            <td>Paul Verardi</td>
                            <td>Andrew Lawson</td>
                            <td>Data Structures</td>
                            <td>Wednesday, April 25 2017</td>
                            <td>2:00 PM </td>
                            <td>3:00 PM </td>
                            <td>x1.2</td>
                            <td>$10/hr</td>
                            <td>$12.00</td>
                            <td style="color: green;">Completed</td>
                            <td>004782</td>
                        </tr>
                        <tr>
                            <td> 00003</td>
                            <td>Chris Heywood</td>
                            <td>Theresa Froehlich</td>
                            <td>Calculus</td>
                            <td>Wednesday, April 25 2017</td>
                            <td>8:00 PM </td>
                            <td>9:30 PM </td>
                            <td>x1.1</td>
                            <td>$12/hr</td>
                            <td>$13.20</td>
                            <td style="color: red;">Pending</td>
                            <td>004782</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </body>
    </html>
