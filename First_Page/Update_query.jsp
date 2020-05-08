<%@page import="java.sql.*"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>eMedical Insert</title>

        <link href="styling.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <script type="text/javascript" language="javascript">
        </script>    
    </head>
    <body style="background: none">
          <script src="Nav.js"></script>

          <div class="container">
              <form class="form-horizontal" action="update.jsp" method="post" onsubmit="validation()">
                <h2 align="center" id="heading">Update Details</h2>
                <div id="medicine_update">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name_m">Name:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name_m" placeholder="Enter name" name="name_m" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="manufacturer">Manufacturer:</label>
                        <div class="col-sm-10">          
                            <input type="text" class="form-control" id="manufacturer" placeholder="Enter brand" name="manufacturer">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="date_m">Date:</label>
                        <div class="col-sm-10">          
                            <input type="date" class="form-control" id="date_m" name="date_m" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="doctor">Quantity:</label>
                        <div class="col-sm-10">          
                            <input type="number" class="form-control" id="qty" name="qty">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="doctor">Price:</label>
                        <div class="col-sm-10">          
                            <input type="number" class="form-control" id="price" name="price">
                        </div>
                    </div>
                </div>
				
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" >Submit</button>
                        <button type="cancel" class="btn btn-default" onclick="">Cancel</button>
                    </div>
                </div>
            </form>
        </div>  
    </body>
</html>