<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eMedical Sell</title>
    <link href="styling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
      
    <script language="javascript" type="text/javascript">
        function display(){
            var s=document.getElementById("search").value;
            var obj=new XMLHttpRequest();
            obj.onreadystatechange=function(){
                if((obj.readyState==4)&&(obj.status==200)){
                   document.getElementById("suggestion").innerHTML=obj.responseText; 
                }
            }
            obj.open("get","search.jsp?search="+s,true);
            obj.send();
        }
        function cart()
        {
            f.method="get";
            f.action="cart_item.jsp";
            f.submit();
        }
    </script>
  </head>
  <body style="background: none">
      <!--Create Nav bar-->
      <script src="Nav.js"></script>
      
      <div class="fill-container" style="width: 90%;margin-left: 5%">
      <h2 align="center">Sell Medicines</h2>
          
      <!-- SearchBox -->
      <div class="fillcontainer">
            <div class="row">
               <div id="custom-search-input">
                    <div class="input-group col-md-12">
                        <input type="text" class="search-query form-control" placeholder="Search Medicine Name" id="search" onkeyup="display()">
                        <span class="input-group-btn">    
                        <form name="f">
                            <button  type="button" class="btn btn-default" style="text-align: right;margin-left: 100px" onclick="cart()">CART</button>
                        </form>
                        </span>
                        
                    </div>
                </div>
            </div>
        </div>
      </div>
      <table class="table table-striped" style="margin-top: 20px">
        <col width="20%">
        <col width="17%">
        <col width="20%">
        <col width="17%">
        <col width="25%">
          <tr>
            <th style="text-align: center">Name</th>
            <th style="text-align: center">Stock</th>
            <th style="text-align: center">Brand</th>
            <th style="text-align: center">Price</th>
            <th style="text-align: center">Quantity</th>
          </tr>

      </table>
      <DIV>
            <table class="table table-striped" id="suggestion">  
            </table>
      </DIV>
      <DIV>
            <!--<form method='get' action='sell_history.jsp'>
                <input class="btn btn-default" type="submit" value='History'>
            </form>-->
      </DIV>
  </body>
</html>