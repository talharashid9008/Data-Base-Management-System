<?php
      $name=$_POST['name'];
      $cnic=$_POST['cnic'];
      $contact=$_POST['contact'];
      $email=$_POST['email'];
      $add=$_POST['address'];
      $gender='Male' ;
$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
  $Query="select * from person where cnic=$cnic" ;
  $result = mysqli_query($con,$Query);
  $numrows=mysqli_num_rows($result);
    if($numrows==0)
    {
            $Query="insert into person(cnic,name,gender,contact,email,address) values('$cnic','$name','$gender','$contact','$email','$add')" ;
            $result = mysqli_query($con,$Query);

            //updating relation table
            $Query="select sid from father where cnic IS NULL " ;
            $result = mysqli_query($con,$Query);
            $row = mysqli_fetch_array($result);
            $id = (int)$row['sid'] ;

            $Query="UPDATE father set cnic = '$cnic' where sid = $id";
            $result = mysqli_query($con,$Query);
            mysqli_close($con);
            mysqli_free_result($result);
            header('Location:Parent.html');
    }
    else{
      mysqli_close($con);
      mysqli_free_result($result);
      echo "Cnic Must be Unique!!!" ;
    }
?>