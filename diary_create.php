<?php
session_start();
include("functions.php");
check_session_id();

if (
  !isset($_POST['title']) || $_POST['title'] === '' ||
  !isset($_POST['category']) || $_POST['category'] === '' ||
  !isset($_POST['difficulty']) || $_POST['difficulty'] === '' ||
  !isset($_POST['voltage']) || $_POST['voltage'] === ''  ||
  !isset($_POST['howto']) || $_POST['howto'] === '' 
) {
  exit('paramError');
}

$title = $_POST['title'];
$category = (int)$_POST['category'];
$difficulty = (int)$_POST['difficulty'];
$voltage = (int)$_POST['voltage'];
$howto = $_POST['howto'];


$pdo = connect_to_db();

$sql = 'INSERT INTO diary_table(id, title, category, difficulty, voltage, howto, created_at, updated_at, deleted_at) VALUES(NULL, :title, :category, :difficulty, :voltage, :howto, now(), now(), NULL)';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':title', $title, PDO::PARAM_STR);
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
