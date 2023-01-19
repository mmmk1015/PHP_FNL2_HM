<?php
session_start();
include('functions.php');
check_session_id();

$id = $_GET["id"];

$pdo = connect_to_db();

$sql = 'SELECT * FROM diary_table WHERE id=:id';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

$record = $stmt->fetch(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>入力フォーム</title>
</head>

<body>
  <form action="diary_update.php" method="POST">
    <fieldset>
      <legend>今日のできごと入力フォーム</legend>
      <a href="diary_read.php">一覧画面</a>
      <div>
        タイトル： <input type="text" name="title" value="<?= $record["title_name"] ?>">
      </div>
      <br>
      <div>
        できごとカテゴリー： <select name="category" value="<?= $record["category"] ?>">
            <option hidden>えらんでね</option>
            <option value="がっこう">がっこう</option>
            <option value="ならいごと">ならいごと</option>
            <option value="おうち">おうち</option>
        </select>
      </div>
      <br>
      <div>
      今日の気分：
        <input type="radio" name="difficulty" value="😊" >😊
        <input type="radio" name="difficulty" value="🙂" >🙂
        <input type="radio" name="difficulty" value="😣" >😣
        </div>
        <br>
        <div>
        元気ボルテージ：<input type="number" name="voltage" value="<?= htmlspecialchars($result['voltage'], ENT_QUOTES) ?>">％
       </div>
        <br>
        <div>
        できごと：
        <textarea name="howto" cols="40" rows="4" maxlength="320"></textarea>
      </div> 
        <br>
      <div>
        <button>submit</button>
      </div>
  
      <input type="hidden" name="id" value="<?= $record["id"] ?>">
    </fieldset>
  </form>

</body>

</html>