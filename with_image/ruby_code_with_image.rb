# Ruby側でMessagePackを使用するためのライブラリをインストール
# $ gem install msgpack

# Ruby側でMessagePackを使用してデータをエンコードする
require 'msgpack'

file = File.read('with_image/image.png')

# packed = file.to_msgpack

# packedには、fileがMessagePack形式でエンコードされたバイナリデータが格納される

# バイナリデータを転送する（ここでは、TCPソケットを使用するとします）
require 'socket'

# Ruby側でサーバーを起動
server = TCPServer.new('localhost', 12345)

# クライアントからの接続を待ち受ける
client = server.accept

# クライアントに対して、エンコードされたデータを送信
# client.write packed
client.write file
client.close


