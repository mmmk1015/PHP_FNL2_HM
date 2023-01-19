<?php
session_start();
include('functions.php');
check_session_id();

if (
  !isset($_POST['title_name']) || $_POST['title_name'] === '' ||
  !isset($_POST['category']) || $_POST['category'] === '' ||
  !isset($_POST['difficulty']) || $_POST['difficulty'] === '' ||
  !isset($_POST['voltage']) || $_POST['voltage'] === ''  ||
  !isset($_POST['howto']) || $_POST['howto'] === '' 
) {
  echo json_encode(["error_msg" => "no input"]);
  exit();
}

$title_name = $_POST['title_name'];
$category = (int)$_POST['category'];
$difficulty = (int)$_POST['difficulty'];
$voltage = (int)$_POST['voltage'];
$howto = $_POST['howto'];


$pdo = connect_to_db();

$sql = 'INSERT INTO diary_table(title_name, category, difficulty, voltage, howto) VALUES(?, ?, ?, ?, ?)';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':title_name', $title_name, PDO::PARAM_STR);
$stmt->bindValue(':category', $category, PDO::PARAM_STR);
$stmt->bindValue(':difficulty', $difficulty, PDO::PARAM_STR);
$stmt->bindValue(':voltage', $voltage, PDO::PARAM_STR);
$stmt->bindValue(':howto', $howto, PDO::PARAM_STR);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

header("Location:diary_input.php");
exit();
