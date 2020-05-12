# 0511
- docker内コンテナとローカルが同期できない
  
- 詳細 : コンテナ内にrailsは'/tmp/var/www/'にあるはずだったのが、'/tmp/var/www/tmp'にあったため
  
- 解消： docker-compose.ymlの「web: volumes」の設定が間違ってた。パス指定に注意


# 0512
- Railsを駆動する際にpermissionが発生、logファイルにアクセスできないエラー
- 詳細
  - ユーザーがdevel、logフォルダのownerはroot
  - 
- 解消
  - chmod -> だめ
  - 
