def fibs(n)
    fib = [0, 1]
    n.times { fib << fib[-1] + fib[-2] } if n > 2
    n > 1 ? fib[0..-3] : fib[0]
end

def fibs_rec(n, fib = [0, 1])
    if n <= 2
        n == 1 ? 0 : fib
    else
        fib << fib[-1] + fib[-2]
        fibs_rec(n-1, fib)
    end
end


puts fibs(15)
puts "------------"
puts fibs_rec(15)