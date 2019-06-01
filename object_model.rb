#include は上に
#prepend は下に

module M1; end

module M2
  include M1;
end

module M3
  prepend M1
  include M2
end

p M3.ancestors
#[M1, M3, M2]
# すでに継承チェーンにいる場合は無視する


# カーネルメソッド最強
module Kernel
  def muruso
    puts "Im MURUSO"
  end
end

# include Kernel これいらない　上書きしてるから
puts muruso
# Im MURUSO


module KernelExtentions
  refine String do
    def p_muruso
      "muruso"
    end
  end
end

#puts "hello".p_muruso
# undefined method `p_muruso' for "hello":String

using KernelExtentions
puts "hoge".p_muruso
# muruso
# hoge



class MyClass
  def method_a
    puts "hello my name is Muru"
  end

  def method_b
    method_a
  end
end


module MyClassRefinements
  refine MyClass do
    def method_a
      puts "Oh!"
    end
  end
end

using MyClassRefinements

puts MyClass.new.method_a
# Oh!
puts MyClass.new.method_b
# hello my name is Muru
# これヤバいね

