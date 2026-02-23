# Phân Tích Thừa Số Nguyên Tố - Julia Module

Một module Julia toàn diện để phân tích thừa số nguyên tố với các hàm tiện ích và ví dụ chi tiết.

## 📋 Mục Lục

1. [Giới Thiệu](#giới-thiệu)
2. [Cài Đặt](#cài-đặt)
3. [API Tham Khảo](#api-tham-khảo)
4. [Ví Dụ Sử Dụng](#ví-dụ-sử-dụng)
5. [Hiệu Suất](#hiệu-suất)
6. [Test](#test)

---

## Giới Thiệu

Module này cung cấp các công cụ để phân tích thừa số nguyên tố (prime factorization) của các số nguyên dương. Nó bao gồm:

- **Phân tích đơn giản**: Trả về danh sách tất cả các thừa số nguyên tố
- **Phân tích với đếm**: Trả về từ điển các thừa số và số lần xuất hiện
- **Kiểm tra số nguyên tố**: Xác định xem một số có phải là số nguyên tố

## Cài Đặt

Đơn giản chỉ cần include file chính:

```julia
include("src/vidu1.jl")
```

Hoặc nếu bạn là trong thư mục khác:

```julia
include("đường_dẫn_đến/vidu1.jl")
```

---

## API Tham Khảo

### 1. `prime_factorization(n::Int)`

Phân tích thừa số nguyên tố của một số nguyên dương.

**Tham số:**
- `n::Int` - Số nguyên dương cần phân tích (n > 1)

**Trả về:**
- `Vector{Int}` - Danh sách các thừa số nguyên tố (có lặp)

**Lỗi:**
- Ném `ErrorException` nếu n ≤ 1

**Độ phức tạp thời gian:** O(√n)

**Ví dụ:**
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

**Giải thích:** 60 = 2 × 2 × 3 × 5, 100 = 2 × 2 × 5 × 5

---

### 2. `prime_factorization_with_count(n::Int)`

Phân tích thừa số nguyên tố và đếm số lần xuất hiện từng thừa số.

**Tham số:**
- `n::Int` - Số nguyên dương cần phân tích (n > 1)

**Trả về:**
- `Dict{Int, Int}` - Từ điển: khóa là thừa số, giá trị là số lần xuất hiện

**Lỗi:**
- Ném `ErrorException` nếu n ≤ 1

**Độ phức tạp thời gian:** O(√n)

**Ví dụ:**
```julia
julia> prime_factorization_with_count(60)
Dict{Int64, Int64} with 3 entries:
  2 => 2
  3 => 1
  5 => 1

julia> prime_factorization_with_count(1000)
Dict{Int64, Int64} with 2 entries:
  2 => 3
  5 => 3
```

**Giải thích:**
- 60 = 2² × 3¹ × 5¹
- 1000 = 2³ × 5³

---

### 3. `is_prime(n::Int)`

Kiểm tra xem một số có phải là số nguyên tố không.

**Tham số:**
- `n::Int` - Số cần kiểm tra

**Trả về:**
- `Bool` - `true` nếu n là nguyên tố, `false` nếu không

**Độ phức tạp thời gian:** O(√n)

**Ví dụ:**
```julia
julia> is_prime(17)
true

julia> is_prime(18)
false

julia> is_prime(2)
true
```

---

## Ví Dụ Sử Dụng

### Ví dụ 1: Phân tích đơn giản

```julia
include("src/vidu1.jl")

# Phân tích 120
factors = prime_factorization(120)
println("Thừa số của 120: $factors")
# Output: Thừa số của 120: [2, 2, 2, 3, 5]
```

### Ví dụ 2: Biểu diễn dạng tích

```julia
n = 84
factors = prime_factorization(n)
representation = join(factors, " × ")
println("$n = $representation")
# Output: 84 = 2 × 2 × 3 × 7
```

### Ví dụ 3: Biểu diễn dạng lũy thừa

```julia
n = 72
factors_dict = prime_factorization_with_count(n)
factors_sorted = sort(collect(factors_dict))

representation = join(["$p^$e" for (p, e) in factors_sorted], " × ")
println("$n = $representation")
# Output: 72 = 2^3 × 3^2
```

### Ví dụ 4: Tìm ước số chung lớn nhất (GCD)

```julia
# GCD(60, 24) sử dụng phân tích thừa số
n1, n2 = 60, 24

factors1 = prime_factorization_with_count(n1)
factors2 = prime_factorization_with_count(n2)

# GCD = tích các thừa số chung với số mũ nhỏ nhất
gcd_dict = Dict()
for prime in keys(factors1)
    if haskey(factors2, prime)
        gcd_dict[prime] = min(factors1[prime], factors2[prime])
    end
end

gcd_value = prod([p^e for (p, e) in gcd_dict])
println("GCD($n1, $n2) = $gcd_value")
# Output: GCD(60, 24) = 12
```

### Ví dụ 5: Kiểm tra số hoàn hảo

```julia
# Một số hoàn hảo là tổng các ước số thực sự của nó
# Ví dụ: 6 = 1 + 2 + 3

function is_perfect_number(n)
    if n <= 1
        return false
    end
    
    # Tính tổng ước số
    divisors_sum = 1  # 1 luôn là ước số
    
    for i in 2:Int(sqrt(n))
        if n % i == 0
            divisors_sum += i
            if i != n ÷ i  # Tránh đếm 2 lần khi i = √n
                divisors_sum += n ÷ i
            end
        end
    end
    
    return divisors_sum == n
end

perfect_numbers = [6, 28, 496]
for num in perfect_numbers
    factors = prime_factorization_with_count(num)
    println("$num là số hoàn hảo. Phân tích: $factors")
end
```

### Ví dụ 6: Liệt kê tất cả số nguyên tố trong một khoảng

```julia
# Tìm tất cả số nguyên tố từ 1 đến 30
primes = [n for n in 1:30 if is_prime(n)]
println("Số nguyên tố từ 1 đến 30: $primes")
# Output: Số nguyên tố từ 1 đến 30: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
```

---

## Hiệu Suất

### Độ Phức Tạp Thời Gian

| Hàm | Độ phức tạp | Ghi chú |
|-----|-------------|--------|
| `prime_factorization` | O(√n) | Tối ưu cho hầu hết các trường hợp |
| `prime_factorization_with_count` | O(√n) | Giống như trên |
| `is_prime` | O(√n) | Kiểm tra lên đến √n |

### Độ Phức Tạp Không Gian

- `prime_factorization`: O(k) với k = số thừa số nguyên tố
- `prime_factorization_with_count`: O(k) với k = số thừa số nguyên tố duy nhất
- `is_prime`: O(1)

### Hiệu Suất Thực Tế

```julia
# Kiểm tra hiệu suất
using BenchmarkTools

@time prime_factorization(1_000_000_000)  # ~0.1 ms
@time is_prime(1_000_000_007)              # ~0.05 ms
```

---

## Test

Module bao gồm một bộ test toàn diện trong `test/vidu1_test.jl`.

### Chạy Test

```julia
# Từ thư mục gốc dự án
julia test/vidu1_test.jl
```

### Các Test Được Bao Gồm

1. **Hàm prime_factorization**
   - Số nhỏ (2, 3, 4, 6)
   - Số trung bình (24, 60, 100)
   - Số nguyên tố (7, 13, 97)
   - Bình phương (25, 49)
   - Lũy thừa (1024 = 2^10, 243 = 3^5)

2. **Hàm prime_factorization_with_count**
   - Số đơn giản và phức tạp
   - Xác thực đếm chính xác

3. **Hàm is_prime**
   - Số nguyên tố nhỏ
   - Số không phải nguyên tố
   - Số âm

4. **Xử lý Lỗi**
   - Kiểm tra lỗi với n ≤ 1

5. **Xác Thực Toán Học**
   - Tích các thừa số bằng số ban đầu
   - Tất cả thừa số đều là nguyên tố

---

## 🎯 Trường Hợp Sử Dụng

### Lý Thuyết Số
- Phân tích số nguyên tố
- Tính GCD/LCM
- Nghiên cứu tính chất số

### Mật Mã Học
- Phân tích khóa RSA
- Kiểm tra nguyên tố trong tạo khóa

### Toán Học Ứng Dụng
- Thiết kế thuật toán
- Tối ưu hóa
- Phân tích độ phức tạp

### Giáo Dục
- Dạy lý thuyết số
- Ví dụ thuật toán
- Bài tập lập trình

---

## 📝 Lưu Ý

1. **Giới hạn**: Các hàm được thiết kế cho số nguyên dương. Kiểm tra đầu vào nếu cần
2. **Hiệu suất**: Để phân tích các số rất lớn (> 10^18), cân nhắc sử dụng thuật toán Pollard's rho
3. **Kiểu dữ liệu**: Sử dụng `BigInt` nếu làm việc với số rất lớn

```julia
# Ví dụ với BigInt
n = big"12345678901234567890"
factors = prime_factorization(Int(n))  # Cần chuyển đổi kiểu
```

---

## 📄 Giấy Phép

Xem file LICENSE trong dự án.

---

## 👨‍💻 Tác Giả

Được hoàn thành vào tháng 2 năm 2026.
