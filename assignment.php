<?php
      $sid= (int)$_POST['sid'];
      $cclass=(int)$_POST['cclass'];
      $nclass=(int)$_POST['nclass'];

      $sec=(int)$_POST['sec'];
      $reason=$_POST['reason'];
      $app=$_POST['app'];

$con = mysqli_connect("localhost","root","", "hmaray_bachay");
if (!$con)
  {

      die('Could not connect: ' . mysql_error());

  }
                  $Query="select age from student where sid=$sid" ;
                  $result=mysqli_query($con,$Query);
                  $row = mysqli_fetch_array($result);   
                  $age = (int)$row['age'] ;
                  //************** */
                  $Query="select * from student where sid=$sid" ;
                  $result=mysqli_query($con,$Query);
                  $numrows=mysqli_num_rows($result);
                  if($numrows!=0)
                  {
                              $Query="select * from class where class_id=$cclass" ;
                              $result=mysqli_query($con,$Query);
                              $numrows=mysqli_num_rows($result);
                              if($numrows!=0)
                              {
                                    
                                    $Query="select * from class where class_id=$nclass" ;
                                    $result=mysqli_query($con,$Query);
                                    $numrows=mysqli_num_rows($result);
                                    if($numrows!=0)
                                    {




                                          $Query="select low_age from class where class_id='$nclass'" ;
                                          $result=mysqli_query($con,$Query);
                                          $row = mysqli_fetch_array($result);   
                                          $id = (int)$row['low_age'] ;//*********** */
                                          if($age>=$id)
                                          {

                                                $Query="select up_age from class where class_id='$nclass'" ;
                                                $result=mysqli_query($con,$Query);
                                                $row = mysqli_fetch_array($result);   
                                                $id = (int)$row['up_age'] ;//*********** */
                                                if($age<=$id)
                                                {
                                                      $Query="select section_id from class_section where class_id='$nclass'" ;
                                                      $result=mysqli_query($con,$Query);
                                                      while($row = mysqli_fetch_array($result)){
                                                            $id = (int)$row['section_id'] ;
                                                            if($sec==$id)
                                                            {
                                                                  $num=1;
                                                                  break;
                                                            }
                                                            else{
                                                                  $num=0 ;
                                                            }
                                                      }
                                                      
                                                      if($num!=0)
                                                      {
                                                            $Query="select * from teacher where name='$app'" ;
                                                            $result=mysqli_query($con,$Query);
                                                            $numrows=mysqli_num_rows($result);
                                                            if($numrows!=0)
                                                            {
                                                                  //**********************update section of student here */
                                                                  $Query="select section_id from student_section where sid = $sid" ;
                                                                  $result=mysqli_query($con,$Query);
                                                                  $row = mysqli_fetch_array($result);
                                                                  $id = (int)$row['section_id'] ;

                                                                  $Query="UPDATE student_section set section_id = $sec where sid = $sid";
                                                                  $result = mysqli_query($con,$Query);
                                                                  $d = date('Y/m/d H:i:s');
                                                                  $date = date("Y-m-d", strtotime($d));
                                                                  $Query="insert into changed(sid,s_from,s_to,reason,approval,date) values($sid,$id,$sec,'$reason','$app','$date')" ;
                                                                  $result = mysqli_query($con,$Query);

                                                                  mysqli_close($con);
                                                                  mysqli_free_result($result);
                                                                  header('Location:admin1.html');
                                                                  //***************************************************** */
                                                            }
                                                            else{
                                                                  echo "Approval Invalid  (  $app ) is not a valid person!!!";
                                                            }
                                                      }
                                                      else{
                                                            echo "Section Not Found!!!";
                                                      }
                                                }
                                                else{
                                                      echo "Your age is above than the required age for this course!!!<br>Sorry your Request cannot be processed!!!";
                                                }
                                          }
                                          else{
                                                echo "Your age is less than minimum age required for this Course!!!<br>sorry your request cannot be processed!!!";
                                          }







                                    }
                                    else{
                                          echo "New Class Not Found!!!";
                                    }
                              }
                              else{
                                    echo "Current Class Not Found!!!" ;
                              }
                  }
                  else{
                        echo "Student Does,nt Exist!!!";
                  }
                  mysqli_close($con);
                  mysqli_free_result($result);

                  $date1 = new DateTime("2007-03-24");
                  $date2 = new DateTime("2009-06-26");
                  $interval = $date1->diff($date2);
                  echo "difference " . $interval->y . " years, " . $interval->m." months, ".$interval->d." days "; 
                  echo $interval;


?>