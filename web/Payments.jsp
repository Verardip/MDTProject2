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

            .container { margin-top: 50px; }
        </style>

        
    </head>
    <body>
        <div class="container">
            <h3>Payment logs</h3>
            <table>
                <tr>
                    <th nowrap="nowrap"><b>Transaction ID</b></th>
                    <th nowrap="nowrap"><b>Tutor</b></th>
                    <th nowrap="nowrap"><b>Tutee</b></th>
                    <th nowrap="nowrap"><b>Course</b></th>
                    <th nowrap="nowrap"><b>Date</b></th>
                    <th nowrap="nowrap"><b>Start Time</b></th>
                    <th nowrap="nowrap"><b>End Time</b></th>
                    <th nowrap="nowrap"><b>Rate</b></th>
                    <th nowrap="nowrap"><b>Payment</b></th>
                </tr>
                <tr>
                    <td>0019283</td>
                    <td nowrap="nowrap">Paul Verardi</td>
                    <td nowrap="nowrap">Theresa Froehlich</td>
                    <td nowrap="nowrap">Data Structures</td>
                    <td nowrap="nowrap">Wednesday, April 25 2017</td>
                    <td>1:00 PM </td>
                    <td>2:00 PM </td>
                    <td>$10/hr</td>
                    <td>$10.00</td>
                </tr>
                <tr>
                    <td>0017293</td>
                    <td nowrap="nowrap">Paul Verardi</td>
                    <td nowrap="nowrap">Andrew Lawson</td>
                    <td nowrap="nowrap">Data Structures</td>
                    <td nowrap="nowrap">Wednesday, April 25 2017</td>
                    <td>2:00 PM </td>
                    <td>3:00 PM </td>
                    <td>$10/hr</td>
                    <td>$10.00</td>
                </tr>
                <tr>
                    <td>0019283</td>
                    <td nowrap="nowrap">Chris Heywood</td>
                    <td nowrap="nowrap">Theresa Froehlich</td>
                    <td nowrap="nowrap">Calculus</td>
                    <td nowrap="nowrap">Wednesday, April 25 2017</td>
                    <td>8:00 PM </td>
                    <td>9:30 PM </td>
                    <td>$10/hr</td>
                    <td>$15.00</td>
                </tr>
            </table>
        </div>
    </body>
</html>
