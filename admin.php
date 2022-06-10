<?php
      $name=$_POST['name'];
      $pass=$_POST['password']; 
$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
  else
  {
        $Query="select * from admin" ;
        $result = mysqli_query($con,$Query);
        while($row = mysqli_fetch_array($result))
          {
                if ( ($row['uname']==$name)&&($row['password']==$pass) )
                {
                    mysqli_free_result($result);
                    mysqli_close($con);
                    header('Location: admin1.html');
                }
          }
          mysqli_close($con);
          mysqli_free_result($result);
          header('Location: adminnotfound.html');
  }
?>