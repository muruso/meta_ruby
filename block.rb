def my_method
  x = "goodbye"
  yield("wowow")
end

x = "wow"
puts my_method { |y| "#{x}, #{y} muruso" }
# wow, wowow muruso
# メソッドのなかにある束縛は見えない　ブロックが定義したときの定義を見てる


def just_yield
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
  local_to_block = 100
end

puts top_level_variable
# 2
#puts local_to_block
# undefined local variable or method `local_to_block' for main:Object (NameError)




# スコープゲート
var = "侵入成功"

MyClass = Class.new do
  puts "#{ var }しました！！"

  define_method :get_in do
    puts "最深部に#{ var }しました！！"
  end
end

MyClass.new.get_in
# 侵入成功しました！！
# 最深部に侵入成功しました！！