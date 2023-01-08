# Ruby側でMessagePackを使用するためのライブラリをインストール
# $ gem install msgpack

# Ruby側でMessagePackを使用してデータをエンコードする
require 'msgpack'

data = {
  'name' => 'Alice',
  'age' => 20,
  'address' => 'Tokyo',
  'hobbies' => ['music', 'movie', 'game'],
  'is_student' => true,
  'height' => 1.6,
  'weight' => 50.5,
  'birthday' => Time.now.to_i,
  'score' => nil,
  'memo' => 'uuuuu',
  'children' => [
    { 'name' => 'Bob', 'age' => 2 },
    { 'name' => 'Carol', 'age' => 5 }
  ],
  'parents' => {
    'father' => { 'name' => 'Dave', 'age' => 50 },
    'mother' => { 'name' => 'Eve', 'age' => 45 },
    'brother' => { 'name' => 'Frank', 'age' => 30 },
    'sister' => { 'name' => 'Grace', 'age' => 25 },
  },
  'pets' => [
    { 'name' => 'Hoge', 'age' => 3, 'type' => 'dog' },
    { 'name' => 'Fuga', 'age' => 2, 'type' => 'cat' },
    { 'name' => 'Piyo', 'age' => 1, 'type' => 'bird' },
  ],
  'cars' => [
    { 'name' => 'Prius', 'price' => 3000000 },
    { 'name' => 'Crown', 'price' => 5000000 },
    { 'name' => 'Vellfire', 'price' => 8000000 },
  ],
  'house' => {
    'address' => 'Tokyo',
    'price' => 10000000,
    'area' => 100,
  },
  'work' => {
    'company' => 'ABC',
    'position' => 'Engineer',
    'salary' => 5000000,
  },
  'friends' => [
    { 'name' => 'Bob', 'age' => 20 },
    { 'name' => 'Carol', 'age' => 20 },
    { 'name' => 'Dave', 'age' => 20 },
    { 'name' => 'Eve', 'age' => 20 },
    { 'name' => 'Frank', 'age' => 20 },
    { 'name' => 'Grace', 'age' => 20 },
  ],
  'enemies' => [
    { 'name' => 'Hoge', 'age' => 20 },
    { 'name' => 'Fuga', 'age' => 20 },
    { 'name' => 'Piyo', 'age' => 20 },
    { 'name' => 'Foo', 'age' => 20 },
    { 'name' => 'Bar', 'age' => 20 },
    { 'name' => 'Baz', 'age' => 20 },
  ]
}

packed = data.to_msgpack

# packedには、dataがMessagePack形式でエンコードされたバイナリデータが格納される

# バイナリデータを転送する（ここでは、TCPソケットを使用するとします）
require 'socket'

# Ruby側でサーバーを起動
server = TCPServer.new('localhost', 12345)

# クライアントからの接続を待ち受ける
client = server.accept

# クライアントに対して、エンコードされたデータを送信
client.write packed
client.close


