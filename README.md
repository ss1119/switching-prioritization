# quicker

IETF QUIC と HTTP/3 プロトコルの NodeJS/TypeScript での実装(https://github.com/quicwg)
メンテナンスはハッセルト大学が行っており、quic.edm.uhasselt.be をご覧ください。

インストールやテストは、dockerfile を使って行うのが最も簡単です (scripts/docker_setup/main/dockerfile を参照)。Docker コンテナの構築と起動は、コンビニエンススクリプト（scripts/server_config/control/参照）を使って行うことができます。これらの便利なスクリプトのほとんどは、このリポジトリをチェックアウトした場所へのハードパスを含んでいるので、あなたのシステムで実行するためには、いくつかの手動編集が必要です。

<br/>
コンテナは以下のコマンドでサーバーを起動しています：

> node ./out/http/http3/server/demoserver.ts 127.0.0.1 4433 ./keys/selfsigned_default.key ./keys/selfsigned_default.crt

クライアントは以下のように起動します：

> node ./out/http/http3/client/democlient.ts 127.0.0.1 4433

<br/>
注意：「node」コマンドは、このリポジトリにあるNodeJSのカスタムバージョンを使用しています：https://github.com/rmarx/node/tree/add_quicker_support-draft-18

クイック実行前にこのカスタムバージョンをビルドしてインストールする方法は、上記の dockerfile に記載されています。QUICker は現在、NodeJS の他のバージョンでは動作しません！

---

## 動作手順

### Docker コンテナの構築と起動

> cd ./scripts/server_config/control

> ./build_images.sh $TAG

### サーバーの起動

> cd ./scripts/server_config/control

> ./start_server.sh 0.0.0.0

### (ログの確認)

> sudo docker logs -f quicker_server

または

> sudo docker exec -it quicker_server bash
