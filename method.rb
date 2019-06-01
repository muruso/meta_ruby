class MyClass
  def say_something word
    puts word
  end
end

obj = MyClass.new
obj.say_something "hello"
# hello
obj.send(:say_something,"sended!!")
# sended!!