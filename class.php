<?php
      $cid= (int)$_POST['cid'];
      $uage=(int)$_POST['uage'];
      $lage=(int)$_POST['lage'];

      $st=$_POST['st'];//section title
      $cc=$_POST['cc'];//course code
      $ct=$_POST['ct'];//course title

$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
            if($lage>=$uage)
            {
              echo "Please Enter the Upper and Lower Ages Correctly!!!<br>" ;
              
              echo "Thank You!!!" ;
            }
            else
            {
                  $Query="select * from class where class_id=$cid" ;
                  $result=mysqli_query($con,$Query);
                  $numrows=mysqli_num_rows($result);
                  if($numrows==0)
                  {

                        $Query="insert into class(class_id,low_age,up_age) values($cid,$lage,$uage)" ;
                        $result = mysqli_query($con,$Query);

                        $Query="insert into section(section_id,section_title,course_code,course_title) values(NULL,'$st','$cc','$ct')" ;
                        $result = mysqli_query($con,$Query);

                        $Query="select section_id from section where section_title='$st' AND course_code='$cc'" ;
                        $result = mysqli_query($con,$Query);
                        $row = mysqli_fetch_array($result);   
                        $id = (int)$row['section_id'] ;

                        //updating relation table

                        $Query="insert into class_section(class_id,section_id) values($cid,$id)" ;
                        $result = mysqli_query($con,$Query);
                        mysqli_close($con);
                        mysqli_free_result($result);
                        header('Location:admin1.html');
                  }
            }
                  mysqli_close($con);
                  mysqli_free_result($result);
?>