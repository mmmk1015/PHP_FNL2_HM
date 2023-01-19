<?php
session_start();
include('functions.php');
check_session_id();

$pdo = connect_to_db();

$sql = 'SELECT * FROM diary_table ORDER BY created_at ASC';

$stmt = $pdo->prepare($sql);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
$output = "";
foreach ($result as $record) {
  $output .= "
    <tr>
      <td>{$record["created_at"]}</td>
      <td>{$record["title_name"]}</td>
      <td>{$record["category"]}</td>
      <td>{$record["difficulty"]}</td>
      <td>{$record["voltage"]}</td>
      <td>{$record["howto"]}</td>
      <td><a href='diary_edit.php?id={$record["id"]}'>edit</a></td>
      <td><a href='diary_delete.php?id={$record["id"]}'>delete</a></td>
    </tr>
  ";
}

?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>日記一覧画面</title>
</head>

<body>
  <fieldset>
    <legend>日記一覧画面</legend>
    <a href="diary_input.php">入力画面</a>
    <a href="diary_logout.php">logout</a>
    <table>
      <thead>
        <tr>
          <th>日付</th>
          <th>タイトル</th>
          <th>できごとカテゴリー</th>
          <th>今日の気分</th>
          <th>元気ボルテージ</th>
          <th>できごと</th>
        </tr>
      </thead>
      <tbody>
        <?= $output ?>
      </tbody>
    </table>
  </fieldset>
</body>

</html>