<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
     <style>   
    Body {  
      font-family: Calibri, Helvetica, sans-serif;  
      background-image: url('hotel.background3.jpg') ;
  background-repeat: no-repeat;
  background-size: cover; 
    } 
         body {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}
            
       </style>
       <body>  
        <form action="confirm_order.php">
        <?php
        // put your code here
        $user = $_POST["user"];
        $pass = $_POST["pass"];
        
                $conn = mysqli_connect("localhost","root","","shopping");
                $stmt = "SELECT * from `customer` where `Username`='$user' and `password` = '$pass'";
                $result = mysqli_query($conn,$stmt);
                
                if( $row = mysqli_fetch_array($result) )
                {
                  echo"<input type=hidden name=custid value=$row[0]>";
                  echo"<h2 style=color:white>Hello $row[1].Start Booking ...</h2>";
                  echo"<br><br>";
                  $stmt2 = "SELECT * from `product`";
                  $result2 = mysqli_query($conn,$stmt2);
                  
                  echo"<table>";
                  $i=0;
                  while($prodset = mysqli_fetch_array($result2))
                  {
                    echo"<input type=hidden name=prodcode[] value=$prodset[0]>";
                    if($i%2==0)
                        echo"<tr valign=center>";
                    echo"<td><img src=$prodset[4] width=300 height=200></td>"
                           . "<td><br><h3 style=color:white>Price/Night:</h3> <span style=color:white> EGP $prodset[3] </span><br><br>"
                           . "<b style=color:white>Rooms:</b> <span style=color:white> $prodset[2] Rooms available </span><br>"
                 
                           . "<b style=color:white>Quantity</b> <input type=number name=quantity[] min=0 max=$prodset[2]><br><br>"
                           . "<b style=color:white>Nights</b> <input type=number name=nights[] min=0 max=$prodset[3]><br><br>";
                           echo "<input type=checkbox name=price[] value=$prodset[3]> <b>Confirm</b><br></td>";
                    $i++;
                  }
                  echo"<tr><td><input type=submit value='Reserve'></td></tr></table>";
                
                }
                
                else
                {
                    echo"Login failed. Invalid Username/Password!";
                }
 
        ?>
        </form>
    </body>
</html>