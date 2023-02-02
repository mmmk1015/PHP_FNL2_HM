<?php
session_start();
include('functions.php');
check_session_id();

$pdo = connect_to_db();

$sql = 'SELECT * FROM diary_table LEFT OUTER JOIN (SELECT diary_id, COUNT(id) AS like_count FROM dlike_table GROUP BY diary_id) AS result_table ON diary_table.id = result_table.diary_id';

$stmt = $pdo->prepare($sql);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

$user_id = $_SESSION['user_id'];

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
$output = "";
foreach ($result as $record) {
  $output .= "
    <tr>
      <td>{$record["created_at"]}</td>
      <td>{$record["title"]}</td>
      <td>{$record["category"]}</td>
      <td>{$record["difficulty"]}</td>
      <td>{$record["voltage"]}</td>
      <td>{$record["howto"]}</td>

      <td><a href='like_create.php?user_id={$user_id}&diary_id={$record["id"]}'>like {$record["like_count"]}</a></td>
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