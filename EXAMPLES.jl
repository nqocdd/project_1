"""
    EXAMPLES.jl

Tập hợp các ví dụ thực tiễn sử dụng module phân tích thừa số nguyên tố.
Chạy file này để xem các ví dụ khác nhau.
"""

include("./src/vidu1.jl")

println("\n" * ("="^70))
println("PHÂN TÍCH THỪA SỐ NGUYÊN TỐ - CÁC VÍ DỤ THỰC TIỄN")
println("="^70)

# ============================================================================
# VÍ DỤ 1: BIỂU DIỄN QUA TÍCH CÁC SỐ NGUYÊN TỐ
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 1: Biểu diễn dạng tích")
println("-"^70)

numbers = [12, 30, 100, 256, 360]

for n in numbers
    factors = prime_factorization(n)
    representation = join(factors, " × ")
    println("$n = $representation")
end

# ============================================================================
# VÍ DỤ 2: BIỂU DIỄN DẠNG LŨY THỪA
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 2: Biểu diễn dạng lũy thừa (e.g., 60 = 2² × 3 × 5)")
println("-"^70)

for n in numbers
    factors_dict = prime_factorization_with_count(n)
    factors_sorted = sort(collect(factors_dict))
    
    # Tạo chuỗi biểu diễn
    representation = join(["$p^$e" for (p, e) in factors_sorted], " × ")
    println("$n = $representation")
end

# ============================================================================
# VÍ DỤ 3: TÍNH ƯỚC SỐ CHUNG LỚN NHẤT (GCD)
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 3: Tính ước số chung lớn nhất (GCD)")
println("-"^70)

function gcd_by_factorization(a, b)
    """Tính GCD sử dụng phân tích thừa số"""
    factors_a = prime_factorization_with_count(a)
    factors_b = prime_factorization_with_count(b)
    
    gcd_dict = Dict()
    for prime in keys(factors_a)
        if haskey(factors_b, prime)
            gcd_dict[prime] = min(factors_a[prime], factors_b[prime])
        end
    end
    
    result = prod([p^e for (p, e) in gcd_dict])
    return result
end

pairs = [(60, 24), (100, 50), (84, 36), (120, 90)]

for (a, b) in pairs
    gcd_val = gcd_by_factorization(a, b)
    factors_a = prime_factorization_with_count(a)
    factors_b = prime_factorization_with_count(b)
    
    println("\nGCD($a, $b) = $gcd_val")
    println("  $a = $(join(["$p^$e" for (p, e) in sort(collect(factors_a))], " × "))")
    println("  $b = $(join(["$p^$e" for (p, e) in sort(collect(factors_b))], " × "))")
end

# ============================================================================
# VÍ DỤ 4: TÍNH BỘI SỐ CHUNG NHỎ NHẤT (LCM)
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 4: Tính bội số chung nhỏ nhất (LCM)")
println("-"^70)

function lcm_by_factorization(a, b)
    """Tính LCM sử dụng phân tích thừa số"""
    factors_a = prime_factorization_with_count(a)
    factors_b = prime_factorization_with_count(b)
    
    # Lấy tất cả số nguyên tố
    all_primes = union(keys(factors_a), keys(factors_b))
    
    lcm_dict = Dict()
    for prime in all_primes
        lcm_dict[prime] = max(get(factors_a, prime, 0), get(factors_b, prime, 0))
    end
    
    result = prod([p^e for (p, e) in lcm_dict])
    return result
end

for (a, b) in pairs
    lcm_val = lcm_by_factorization(a, b)
    println("LCM($a, $b) = $lcm_val")
end

# ============================================================================
# VÍ DỤ 5: ĐẾM SỐ ƯỚC (DIVISOR COUNTING)
# ============================================================================

println("\n" * "-" * 70)
println("VÍ DỤ 5: Đếm số lượng ước số")
println("-" * 70)

function count_divisors_by_factorization(n)
    """
    Nếu n = p1^a1 × p2^a2 × ... × pk^ak
    Số lượng ước = (a1+1)(a2+1)...(ak+1)
    """
    factors = prime_factorization_with_count(n)
    
    if isempty(factors)
        return 1
    end
    
    count = prod([e + 1 for (p, e) in factors])
    return count
end

test_numbers = [12, 24, 36, 60, 100, 120]

for n in test_numbers
    divisor_count = count_divisors_by_factorization(n)
    factors = prime_factorization_with_count(n)
    factors_str = join(["$p^$e" for (p, e) in sort(collect(factors))], " × ")
    
    println("$n = $factors_str → Số ước: $divisor_count")
end

# ============================================================================
# VÍ DỤ 6: LIỆT KỀ TẤT CẢ ƯỚC (FINDING ALL DIVISORS)
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 6: Liệt kê tất cả ước số")
println("-"^70)

function find_all_divisors(n)
    """Tìm tất cả ước số của n"""
    divisors = [1]
    
    for i in 2:Int(sqrt(n))
        if n % i == 0
            push!(divisors, i)
            if i != n ÷ i
                push!(divisors, n ÷ i)
            end
        end
    end
    
    push!(divisors, n)
    return sort(divisors)
end

for n in [12, 24, 60]
    divisors = find_all_divisors(n)
    factors = prime_factorization_with_count(n)
    factors_str = join(["$p^$e" for (p, e) in sort(collect(factors))], " × ")
    
    println("\n$n = $factors_str")
    println("Ước số: $divisors")
    println("Tổng số ước: $(length(divisors))")
    println("Tổng các ước: $(sum(divisors))")
end

# ============================================================================
# VÍ DỤ 7: KIỂM TRA SỐ HOẠN HẢO
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 7: Kiểm tra số hoàn hảo")
println("-"^70)

function sum_of_divisors(n)
    """Tính tổng tất cả các ước thực sự (không bao gồm chính nó)"""
    if n <= 1
        return 0
    end
    
    divisor_sum = 1
    
    for i in 2:Int(sqrt(n))
        if n % i == 0
            divisor_sum += i
            if i != n ÷ i
                divisor_sum += n ÷ i
            end
        end
    end
    
    return divisor_sum
end

function is_perfect_number(n)
    """Số hoàn hảo = tổng các ước thực sự của nó"""
    return sum_of_divisors(n) == n
end

println("Kiểm tra các số hoàn hảo:")
for n in [6, 12, 28, 50, 496]
    is_perfect = is_perfect_number(n)
    sum_div = sum_of_divisors(n)
    
    if is_perfect
        factors = prime_factorization_with_count(n)
        factors_str = join(["$p^$e" for (p, e) in sort(collect(factors))], " × ")
        println("✓ $n là SỐ HOÀN HẢO. Phân tích: $factors_str. Tổng ước: $sum_div")
    end
end

# ============================================================================
# VÍ DỤ 8: SỐ NGUYÊN TỐ VÀ KHOẢNG
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 8: Tìm tất cả số nguyên tố trong một khoảng")
println("-"^70)

function primes_in_range(start, finish)
    """Tìm tất cả số nguyên tố trong khoảng [start, finish]"""
    return [n for n in start:finish if is_prime(n)]
end

ranges = [(1, 20), (20, 40), (90, 110)]

for (start, finish) in ranges
    primes = primes_in_range(start, finish)
    println("\nSố nguyên tố từ $start đến $finish: $primes")
    println("Số lượng: $(length(primes))")
end

# ============================================================================
# VÍ DỤ 9: SỐ NGUYÊN TỐ SINH ĐÔI (TWIN PRIMES)
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 9: Tìm cặp số nguyên tố sinh đôi (Twin Primes)")
println("-"^70)

function find_twin_primes(limit)
    """Tìm các cặp số nguyên tố p, p+2 đều là nguyên tố"""
    twins = []
    
    for n in 2:limit-2
        if is_prime(n) && is_prime(n+2)
            push!(twins, (n, n+2))
        end
    end
    
    return twins
end

twins = find_twin_primes(50)
println("Cặp số nguyên tố sinh đôi (p, p+2) với p < 50:")
for (p1, p2) in twins
    println("  ($p1, $p2)")
end

# ============================================================================
# VÍ DỤ 10: PHÂN TÍCH SỐ LỚN
# ============================================================================

println("\n" * ("-"^70))
println("VÍ DỤ 10: Phân tích các số lớn")
println("-"^70)

large_numbers = [1_000, 10_000, 100_000, 1_000_000]

for n in large_numbers
    factors = prime_factorization(n)
    factors_dict = prime_factorization_with_count(n)
    factors_str = join(["$p^$e" for (p, e) in sort(collect(factors_dict))], " × ")
    
    println("$n = $factors_str")
end

# ============================================================================
# LỜI KẾT
# ============================================================================

println("\n" * ("="^70))
println("HOÀN TẤT - Bạn đã xem qua 10 ví dụ phân tích thừa số nguyên tố!")
println("="^70)
println("\nHãy thử sửa đổi các ví dụ trên để khám phá thêm tính năng!")
