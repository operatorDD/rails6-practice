# 疑問
- Dockerのボリュームマウントに問題がありローカルとDockerのコンテナが同期出来ない
→ [参考Qiita記事](https://qiita.com/azul915/items/5b7063cbc80192343fc0)

- Dockerfileにあるbuild-essentialは本当に必要なのか
→ rubyにはCで書かれている拡張モジュールもあるのでC/C++のビルド環境を整えるパッケージであるbuild-essentialが必要

## Rails コマンド
- credentials.yml.encとmaster.keyの組み合わせが正しいか確認するコマンド
  - EDITOR=vim bin/rails credentials:edit



## dockerコマンド
 - コンテナ一括削除
   - docker ps -a | awk '{print $1}' | tail -n +2 | xargs docker rm
   - docker rm `docker ps -a -q`
 - イメージ括削除
   - docker rmi `docker images -a -q`

