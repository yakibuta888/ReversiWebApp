# API設計メモ

## 対戦を開始する

「対戦」を登録する

POST /api/games

今回はレスポンスボディは返さない

## 現在の盤面を表示する

GET /api/games/latest/boards/latest
↓盤面はターンに紐づいている
指定したターン数の「ターン」を取得する

GET /api/games/latest/turns/{turnCount}

レスポンスボディ

```json
{
  "turnCount": 1,
  "board": [
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 2, 0, 0, 0],
    [0, 0, 0, 2, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
  ],
  "nextDisc": 1,
  "winnerDisc": 1
}
```

## 石を打つ

「ターン」を登録する

POST /api/games/latest/turns

リクエストボディ

```json
{
  "turnCount": 1,
  "move": {
    "disc": 1,
    "x": 0,
    "y": 0
  }
}
```

## 勝敗を確認する
盤面のレスポンスボディ内に含める

## 自分の対戦結果を表示する

「対戦」の一覧を取得する

GET /api/games

レスポンスボディ

```json
{
  "games": [
    {
      "id": 1,
      "winnerDisk": 1,
      "startedAt": "YYYY-MM-DD hh:mm:ss"
    },
    {
      "id": 2,
      "winnerDisk": 1,
      "startedAt": "YYYY-MM-DD hh:mm:ss"
    }
  ]
}
```
