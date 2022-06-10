<?php
$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
  else
  {
        $Query="select sid,name from student where sid NOT NULL" ;
        $result = mysqli_query($con,$Query);
            while($row = mysql_fetch_array($result)){ 
            echo "$row['sid']   $row['name']";
            }

          mysqli_close($con);
          mysqli_free_result($result);
  }
?>