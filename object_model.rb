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

puts "hello".p_muruso
# undefined method `p_muruso' for "hello":String

using KernelExtentions
puts "hoge".p_muruso
# muruso
# hoge

