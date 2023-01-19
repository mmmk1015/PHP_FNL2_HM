<?php
session_start();
include('functions.php');
check_session_id();
?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>日記一覧</title>
</head>

<body>
  <form action="diary_create.php" method="POST">
    <fieldset>
      <legend>入力フォーム</legend>
      <a href="diary_read.php">一覧画面</a>
      <a href="diary_logout.php">logout</a>
      <div>
        タイトル: <input type="text" name="title" required><br>
      </div>
      <div>
        できごとカテゴリー: <select name="category">
          <option hidden>えらんでね</option>
            <option value="1">がっこう</option>
            <option value="2">ならいごと</option>
            <option value="3">おうち</option>
        </select>
        <br>
      </div>
      <div>
      今日の気分：
        <input type="radio" name="difficulty" value="1">😊
        <input type="radio" name="difficulty" value="2" checked>🙂
        <input type="radio" name="difficulty" value="3">😣
        <br>
        </div>
        <div>
        元気ボルテージ：<input type="number" min="1" max="300" name="voltage">％       
        <br>
        </div>
        <div>
        できごと：
        <textarea name="howto" cols="40" rows="4" maxlength="320"></textarea>
        <br>
        </div>
      <div>
        <button>submit</button>
      </div>
    </fieldset>
  </form>

</body>

</html>