# Python側でMessagePackを使用するためのライブラリをインストール
# $ pip install msgpack

# Python側でTCPソケットを使用してデータを受信する
import socket

# クライアントとして、サーバーに接続する
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('localhost', 12345))

# サーバーからデータを受信する
data = client.recv(1024)

# データをMessagePack形式でデコードする
import msgpack

unpacked = msgpack.unpackb(data)

# unpackedには、Ruby側でエンコードされたデータが格納される

# ファイルとして保存する
# ファイルがなければ作成し、あれば上書きする
with open('with_file/received.txt', 'w') as f:
    f.write(unpacked)
