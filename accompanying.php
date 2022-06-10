<?php
      $sid=(int)$_POST['sid'];
      $name=$_POST['name'];
      $gender=$_POST['gender'];
      $class=(int)$_POST['class'];
      $gid=(int)$_POST['gid'];
      $relation=$_POST['relation'];
      $gname=$_POST['gname'];
      $preg=$_POST['preg'];
      $reason=$_POST['reason'];
$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
        
            $Query="select * from student where sid=$sid" ;
            $result=mysqli_query($con,$Query);
            $numrows=mysqli_num_rows($result);
            if($numrows!=0)
            {
                $Query="select age from student where sid=$sid" ;
                $result=mysqli_query($con,$Query);
                $row = mysqli_fetch_array($result);   
                $id = (int)$row['age'] ;//*********** */
                if($id<=8)
                {
                          $Query="insert into accompany_info(student_id,guardian_cnic,gender,guardian_name,class,pregnant,reason) values($sid,$gid,'$gender','$gname',$class,'$preg','$reason')" ;
                          $result = mysqli_query($con,$Query);
                          mysqli_close($con);
                          mysqli_free_result($result);
                          header('Location:admin1.html');
                }
                else{
                  echo "Student,s with age greater than 8 cannot be accompanied!!!";
                }
                    
            }
            else{
              echo "Student with id : $sid Does,nt exist in Database!!!" ;
            }
            mysqli_close($con);
            mysqli_free_result($result);
?>