# Python側でMessagePackを使用するためのライブラリをインストール
# $ pip install msgpack

# Python側でTCPソケットを使用してデータを受信する
import socket

# クライアントとして、サーバーに接続する
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('localhost', 12345))

# サーバーからデータを受信する
# data = client.recv(1024)
data = client.recv(1024 * 1024)  # 1MB分のデータを受信するように修正

# データをMessagePack形式でデコードする
import msgpack

# unpacked = msgpack.unpackb(data, raw=False)

# unpackedには、Ruby側でエンコードされたデータが格納される

# ファイルとして保存する
with open('with_image/received_image.png', 'wb') as f:
    f.write(data)
