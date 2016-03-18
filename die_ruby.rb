def f
  puts "Die!"
  Thread.new { f }
  Thread.new { f }
end
Tf
