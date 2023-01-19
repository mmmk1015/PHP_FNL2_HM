<?php
session_start();
include('functions.php');
check_session_id();

if (
  !isset($_POST['id']) || $_POST['id'] === '' ||
  !isset($_POST['title_name']) || $_POST['title_name'] === '' ||
  !isset($_POST['category']) || $_POST['category'] === '' ||
  !isset($_POST['difficulty']) || $_POST['difficulty'] === '' ||
  !isset($_POST['voltage']) || $_POST['voltage'] === ''  ||
  !isset($_POST['howto']) || $_POST['howto'] === '' 
) {
  exit('paramError');
}

$id = $_POST["id"];
$title_name = $_POST['title_name'];
$category = $_POST['category'];
$difficulty = $_POST['difficulty'];
$voltage = $_POST['voltage'];
$howto = $_POST['howto'];

$pdo = connect_to_db();

$sql = "UPDATE diary_table SET title_name=:title_name, category=:category, difficulty=:difficulty, voltage=:voltage, howto=:howto, updated_at=now() WHERE id=:id";

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
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

header("Location:diary_read.php");
exit();
