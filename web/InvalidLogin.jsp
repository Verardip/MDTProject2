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
                font-size: large;
            }

            .container { margin-top: 50px; }
        </style>



    </head>
    <body>
        <div class="container">
            <h2>Please login!</h2>
            <h4 style="color: red;"> Invalid username or password. Please try again: </h4>
            <form action="selection" method="GET">
                <label for="username">Username:</label>
                <input type="text" class="u-full-width" name="username" value="" placeholder="Your name!" /><br>
                <label for="letter">Password:</label>
                <input type="password" class="u-full-width" name="password" value="" placeholder="Your password!" /><br><br>
                <input type="submit" class="button-primary u-full-width" value="Login" />
            </form>
        </div>
    </body>



</html>
