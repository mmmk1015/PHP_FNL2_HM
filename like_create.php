<?php

include('functions.php');

$user_id = $_GET['user_id'];
$diary_id = $_GET['diary_id'];

$pdo = connect_to_db();

$sql = 'SELECT COUNT(*) FROM dlike_table WHERE user_id=:user_id AND diary_id=:diary_id';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_STR);
$stmt->bindValue(':diary_id', $diary_id, PDO::PARAM_STR);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

$like_count = $stmt->fetchColumn();


if ($like_count !== 0) {
  $sql = 'DELETE FROM dlike_table WHERE user_id=:user_id AND diary_id=:diary_id';
} else {
  $sql = 'INSERT INTO dlike_table (id, user_id, diary_id, created_at) VALUES (NULL, :user_id, :diary_id, now())';
}
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_STR);
$stmt->bindValue(':diary_id', $diary_id, PDO::PARAM_STR);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

header("Location:diary_read.php");
exit();

