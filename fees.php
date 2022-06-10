<?php
      $id= (int)$_POST['id'];
      $fees=(int)$_POST['fees'];
      $paid=$_POST['paid'];
      
$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }

  $Query="select section_id from student_section where sid=$id" ;
  $result=mysqli_query($con,$Query);
  $row = mysqli_fetch_array($result);   
  $sec = (int)$row['section_id'] ;

  $Query="select class_id from class_section where section_id=$sec" ;
  $result=mysqli_query($con,$Query);
  $row = mysqli_fetch_array($result);   
  $cid = (int)$row['class_id'] ;

  $Query="select fees from class where class_id=$cid" ;
  $result=mysqli_query($con,$Query);
  $row = mysqli_fetch_array($result);   
  $afee = (int)$row['fees'] ;

      if($afee==$fees){

                  $Query="select cnic from father where sid=$id" ;
                  $result=mysqli_query($con,$Query);
                  $row = mysqli_fetch_array($result);   
                  $cnic = (int)$row['cnic'] ;//here we got cnic of Father
                  $Query="SELECT count('cnic') as sib FROM person where cnic=$cnic";
                  $result=mysqli_query($con,$Query);
                  $row = mysqli_fetch_array($result);   
                  $num = (int)$row['sib'] ;//here we got number of siblings
                  if($num>1)
                  {
                        $Query="UPDATE student SET fee_status='$paid' WHERE sid=$id" ;
                        mysqli_close($con);
                        mysqli_free_result($result);
                        header('Location:full_fees.html');
                  }
                  else{
                        $Query="UPDATE student SET fee_status='$paid' WHERE sid=$id" ;
                        mysqli_close($con);
                        mysqli_free_result($result);
                        header('Location:half_fees.html');
                  }
      }
      else{
            echo "Please Enter Fee Correctly!!!<br>class : $cid Does,nt Have Rs: $fees Fees.<br>Correct Fees Is $afee";
      }
      mysqli_close($con);
      mysqli_free_result($result);
?>
