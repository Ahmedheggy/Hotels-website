<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
        <?php
        // put your code here
        $custid=$_GET["custid"];    // Customer ID who signed in (hidden field)
        $price=$_GET["price"];      //array of selected products prices (checkbox fields)
        $quantity=$_GET["quantity"];    // array of selected products quantities (number fields)
        $nights=$_GET["nights"];
        $prodcode=$_GET["prodcode"];    // array of selected products codes (hidden fields)
        $index=0;
        for($i=0; $i<count($quantity); $i++)
            if($quantity[$i]!=null)
            {
                $quantity2[$index]=$quantity[$i];
                $prodcode2[$index]=$prodcode[$i];
                $nights2[$index]=$nights[$i];
                $index++;
            }
            
        $total=0.0;
        for($i=0; $i<count($price);$i++)
            $total+=$price[$i]*$quantity2[$i]*$nights2[$i];
        
        $date=date("y-m-d");
        $conn = mysqli_connect("localhost","root","","shopping");
        $stmt = "insert into `order` (`date`,`total amount`,`customer id`) values ('$date','$total','$custid')";
        $result = mysqli_query($conn,$stmt);
        
        echo"<h1 style=color:white>Your Booking is confirmed.<br> Your total amount is :$total.EGP<br>Thank you.</h1>";
        $stmt="select * from `order`";
        $result= mysqli_query($conn, $stmt);
        while($row = mysqli_fetch_array($result))
                $ordernum = $row[0];
        
        for($i=0; $i<count($prodcode2);$i++)
        {
            $stmt2 = "insert into `order details` (`order number`,`product code`,`nights`,`quantity`) values('$ordernum','$prodcode2[$i]','$nights2[$i]','$quantity2[$i]')";
            $result2= mysqli_query($conn, $stmt2);
        }
        
        
        ?>
    </body>
</html>
