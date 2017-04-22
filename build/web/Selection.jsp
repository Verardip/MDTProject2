<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MDTutor homepage</title>
        
                
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
            <p>Hello <%= request.getAttribute("username")%> ! </p>

            <h2>What do you need today?</h2>
            <form action="tutor" method="GET">
                <input type="submit" class="u-full-width" value="I want to tutor!" name="intent" /><br>
                <input type="submit" class="u-full-width" value="I need tutoring!" name="intent" />
                <input type="hidden" name="username" value="<%= request.getAttribute("username") %>" />
            </form>
        </div>
    </body>
</html>