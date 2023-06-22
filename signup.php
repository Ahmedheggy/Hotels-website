    <!DOCTYPE html>   
    <html>   
        <body>
            <form action="login.html" method="get"> 
               <?php
        $id=$_GET["id"];
        $name=$_GET["name"];
        $address=$_GET["add"];
        $user=$_GET["user"];
        $p1=$_GET["pass"];
        $p2=$_GET["pass2"];
 
        if($p1!=$p2)
        {
            echo"password mismatch";
            exit ();
        }
        $conn = mysqli_connect("localhost","root","","shopping");
        $stmt="insert into`customer`(`Customer ID`,`Name`,`Address`,`Username`,`Password`)values('$id','$name','$address','$user','$p1')";
        $result= mysqli_query($conn,$stmt);
 
    
        ?>
    <script>
      window.location.href = 'http://localhost/Project1/login.html';
    </script>
            </form> 
    </body>     
    </html>  
