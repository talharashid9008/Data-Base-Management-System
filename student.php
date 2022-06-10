<?php
      $name=$_POST['fname'].' '.$_POST['lname'];
      $gender=$_POST['gender']; 
      $dob=$_POST['dob'];
      $age=(int)$_POST['age'];
      $newDate = date("Y-m-d", strtotime($dob));  
$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
        $Query="select * from student where name in('$name') AND Gender in('$gender') AND DOB in('$dob') " ;
        $result=mysqli_query($con,$Query);
        $numrows=mysqli_num_rows($result);
        if(!($numrows>0))
        {
            $Query="insert into student(sid,name,age,DOB,Gender,fee_status) values(NULL,'$name',$age,'$newDate','$gender','not paid')" ;
            $result = mysqli_query($con,$Query);


            $Query="select sid from student where name in('$name') AND Gender in('$gender') AND DOB in('$dob') " ;
            $result = mysqli_query($con,$Query);
            $row = mysqli_fetch_array($result);   
            $id = (int)$row['sid'] ;
            //inserting sid into father
            $Query="insert into father(sid,cnic) values($id,NULL)" ;
            $result = mysqli_query($con,$Query);
            //inserting sid into mother
            $Query="insert into mother(sid,cnic) values($id,NULL)" ;
            $result = mysqli_query($con,$Query);
            //inserting sid into guardian
            $Query="insert into guardian(sid,cnic,relation) values($id,NULL,NULL)" ;
            $result = mysqli_query($con,$Query);
            mysqli_close($con);
            mysqli_free_result($result);
            header('Location:Parent.html');
        }
        else
        {
              echo "user Already exists in Data_Base!!!";
        }
        mysqli_close($con);
        mysqli_free_result($result);
?>