"""
    prime_factorization(n::Int)

Phân tích thừa số nguyên tố của một số nguyên dương.

# Arguments
- `n::Int`: Số nguyên dương cần phân tích

# Returns
- `Vector`: Danh sách các thừa số nguyên tố

# Examples
```julia
julia> prime_factorization(60)
4-element Vector{Int64}:
 2
 2
 3
 5

julia> prime_factorization(100)
4-element Vector{Int64}:
 2
 2
 5
 5
```
"""
function prime_factorization(n::Int)
    if n <= 1
        error("Số phải lớn hơn 1")
    end
    
    factors = Int[]
    d = 2
    
    # Chia lặp lại cho đến khi n = 1
    while d * d <= n
        while n % d == 0
            push!(factors, d)
            n ÷= d
        end
        d += 1
    end
    
    # Nếu n > 1, thì n là thừa số nguyên tố
    if n > 1
        push!(factors, n)
    end
    
    return factors
end

"""
    prime_factorization_with_count(n::Int)

Phân tích thừa số nguyên tố và đếm số lần xuất hiện.

# Returns
- `Dict`: Từ điển với khóa là thừa số, giá trị là số lần xuất hiện

# Examples
```julia
julia> prime_factorization_with_count(60)
Dict{Int64, Int64} with 3 entries:
  2 => 2
  3 => 1
  5 => 1
```
"""
function prime_factorization_with_count(n::Int)
    if n <= 1
        error("Số phải lớn hơn 1")
    end
    
    factors = Dict{Int, Int}()
    d = 2
    
    while d * d <= n
        while n % d == 0
            factors[d] = get(factors, d, 0) + 1
            n ÷= d
        end
        d += 1
    end
    
    if n > 1
        factors[n] = get(factors, n, 0) + 1
    end
    
    return factors
end

"""
    is_prime(n::Int)

Kiểm tra xem một số có phải là số nguyên tố không.

# Returns
- `Bool`: true nếu n là số nguyên tố, false nếu không
"""
function is_prime(n::Int)
    if n < 2
        return false
    end
    if n == 2
        return true
    end
    if n % 2 == 0
        return false
    end
    
    for i in 3:2:Int(sqrt(n))
        if n % i == 0
            return false
        end
    end
    return true
end

# ===== Ví dụ sử dụng =====
println("=" ^ 50)
println("PHÂN TÍCH THỪA SỐ NGUYÊN TỐ")
println("=" ^ 50)

# Ví dụ 1: Phân tích đơn giản
numbers = [24, 60, 100, 97, 1000]

for num in numbers
    factors = prime_factorization(num)
    println("\nSố $num: $factors")
    println("Biểu diễn: $(num) = $(join(factors, " × "))")
end

# Ví dụ 2: Phân tích với đếm số lần
println("\n" * "=" ^ 50)
println("PHÂN TÍCH VỚI ĐẾM SỐ LẦN")
println("=" ^ 50)

for num in numbers
    factors = prime_factorization_with_count(num)
    factors_sorted = sort(collect(factors))
    
    # Tạo chuỗi biểu diễn
    representation = join(["$p^$e" for (p, e) in factors_sorted], " × ")
    println("\n$num = $representation")
end

# Ví dụ 3: Kiểm tra số nguyên tố
println("\n" * "=" ^ 50)
println("KIỂM TRA SỐ NGUYÊN TỐ")
println("=" ^ 50)

test_primes = [2, 3, 4, 17, 25, 29, 97, 100]
for num in test_primes
    result = is_prime(num) ? "là số nguyên tố" : "không phải số nguyên tố"
    println("$num $result")
end

# Ví dụ 4: Hệ số kết hợp
println("\n" * "=" ^ 50)
println("VÍ DỤ NÂNG CAO")
println("=" ^ 50)

println("\nTìm tất cả các ước của 120:")
n = 120
factors_dict = prime_factorization_with_count(n)
println("Phân tích: $factors_dict")

# Tính tích các thừa số lại
product = prod(collect(keys(factors_dict)) .^ collect(values(factors_dict)))
println("Kiểm chứng: $product = $n")
