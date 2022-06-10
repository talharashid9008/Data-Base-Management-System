<?php
      $id= (int)$_POST['id'];
      $class= (int)$_POST['class'];
      $sec= (int)$_POST['sec'];
      
$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
  
                  $Query="select age from student where sid=$id" ;
                  $result=mysqli_query($con,$Query);
                  $row = mysqli_fetch_array($result);
                  $age=(int)$row['age'];

                  $Query="select low_age , up_age from class where class_id=$class" ;
                  $result=mysqli_query($con,$Query);
                  $row = mysqli_fetch_array($result))
                    $lo=(int)$row['low_age'];
                    $up=(int)$row['up_age'];
                  if($age>=$lo && $age<=$up){

                    $Query="select * from class_section where class_id=$class AND section_id=$sec" ;
                    $result=mysqli_query($con,$Query);
                    $numrows=mysqli_num_rows($result);
                    if($numrows!=0)
                    {
                          $Query="select section_id from student_section where sid=$id" ;
                          $result=mysqli_query($con,$Query);
                          $numrows=mysqli_num_rows($result);
                          if($numrows==0)
                          {
                            $Query="INSERT INTO student_section(sid , section_id) VALUES ($id,$sec)" ;
                            $result=mysqli_query($con,$Query);
                            mysqli_close($con);
                            mysqli_free_result($result);
                            header('Location:fees.html');
                          }
                          else{
                            echo "Section Already Assigned to this student!!!";
                          }
                    }
                    else{
                      echo "Section Does,nt exist!!!";
                    }
                                       
                        


                  } 
                  else{
                    echo "Age Does,nt Match the Age Range of This Class!!!";
                  }  
                  mysqli_close($con);
                  mysqli_free_result($result);
?>