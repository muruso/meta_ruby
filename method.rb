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
#


class Person
  def initialize(name)
    @name = name
    Person.during_initializing(name)
  end

  def self.define_name_method
    define_method("say_hello") do
      puts "hello,hello"
    end
  end

  def self.during_initializing(name)
    define_method("ini_#{name}") do
      puts "ini_#{name}"
    end
  end

  define_name_method
end

person = Person.new "muruso"
person.ini_muruso
# ini_muruso
person.say_hello
# hello,hello



class Magic
  def initialize(list)
    list.grep(/^magic_(.*)/) { Magic.define_magic $1 }
  end

  def self.define_magic(name)
    define_method(name) do
      puts "This is magic #{name}!!!"
    end
  end

  def method_missing(name)
    puts "Amazing! This is magic #{name}!!!"
  end
end

magic = Magic.new(%w(magic_dog magic_cat magic_ring))
magic.cat
# This is magic cat!!!
magic.ring
# This is magic ring!!!

# magic.send :method_missing, :oyoyo
# undefined method `oyoyo' for #<Magic:0x00007fd4fa227e38>

magic.water
# Amazing! This is magic water!!!
