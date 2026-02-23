# Phân Tích Thừa Số Nguyên Tố (Prime Factorization) - Julia Module

Một module Julia toàn diện để phân tích thừa số nguyên tố với hiệu suất cao, API dễ sử dụng, và tài liệu chi tiết.

## 🎯 Tính Năng Chính

✨ **Ba Hàm Cốt Lõi:**
- `prime_factorization(n)` - Phân tích thừa số nguyên tố cơ bản
- `prime_factorization_with_count(n)` - Phân tích với đếm số lần xuất hiện
- `is_prime(n)` - Kiểm tra số nguyên tố

✨ **Đặc Điểm:**
- ⚡ Hiệu suất cao: O(√n)
- 📚 Tài liệu toàn diện với ví dụ chi tiết
- ✅ Bộ test đầy đủ (20+ test cases)
- 🎓 Phù hợp cho giáo dục và ứng dụng thực tiễn
- 🔒 Xử lý lỗi chặt chẽ

## 📦 Cấu Trúc Dự Án

```
project_1/
├── README.md                 # Tệp này
├── DOCUMENTATION.md          # Tài liệu API chi tiết
├── EXAMPLES.jl              # 10+ ví dụ thực tiễn
├── LICENSE
├── src/
│   └── vidu1.jl             # Module chính
└── test/
    └── vidu1_test.jl        # Bộ test đầy đủ
```

## 🚀 Bắt Đầu Nhanh

### 1. Sử Dụng Cơ Bản

```julia
# Include module
include("src/vidu1.jl")

# Phân tích thừa số
factors = prime_factorization(60)
# [2, 2, 3, 5]

# Với đếm số lần
factors = prime_factorization_with_count(60)
# Dict(2 => 2, 3 => 1, 5 => 1)

# Kiểm tra số nguyên tố
is_prime(17)
# true
```

### 2. Chạy Các Ví Dụ

```bash
julia EXAMPLES.jl
```

Điều này sẽ chạy 10 ví dụ thực tiễn bao gồm:
- Biểu diễn dạng tích và lũy thừa
- Tính GCD/LCM
- Đếm ước số
- Kiểm tra số hoàn hảo
- Tìm số nguyên tố sinh đôi
- Và nhiều điều khác!

### 3. Chạy Test

```bash
julia test/vidu1_test.jl
```

Chạy 50+ test case để xác thực tính đúng đắn.

## 📖 Tài Liệu

### Tài liệu Đầy Đủ

Xem [DOCUMENTATION.md](DOCUMENTATION.md) để:
- **API Tham Khảo**: Mô tả chi tiết của từng hàm
- **Ví Dụ Sử Dụng**: 6+ ví dụ với giải thích
- **Phân Tích Hiệu Suất**: Độ phức tạp thời gian và không gian
- **Trường Hợp Sử Dụng**: Ứng dụng thực tế

### Ví Dụ Thực Tiễn

Xem [EXAMPLES.jl](EXAMPLES.jl) để:

| Ví dụ | Mô tả |
|-------|-------|
| 1 | Biểu diễn dạng tích |
| 2 | Biểu diễn dạng lũy thừa |
| 3 | Tính GCD (Ước số chung lớn nhất) |
| 4 | Tính LCM (Bội số chung nhỏ nhất) |
| 5 | Đếm số ước |
| 6 | Liệt kê tất cả ước |
| 7 | Kiểm tra số hoàn hảo |
| 8 | Tìm số nguyên tố trong khoảng |
| 9 | Tìm số nguyên tố sinh đôi |
| 10 | Phân tích số lớn |

## 📊 Ví Dụ Chi Tiết

### Phân Tích Số 60

```julia
julia> prime_factorization(60)
4-element Vector{Int64}:
 2
 2
 3
 5

julia> prime_factorization_with_count(60)
Dict{Int64, Int64} with 3 entries:
  2 => 2
  3 => 1
  5 => 1
```

### Biểu Diễn Toán Học

60 = 2 × 2 × 3 × 5 = 2² × 3¹ × 5¹

### Ứng Dụng: Tính GCD

```julia
# GCD(60, 24) = 2² × 3 = 12
GCD(60, 24) = 12
```

## 🧪 Test

Module bao gồm 50+ test case kiểm tra:

✅ Số nhỏ và lớn  
✅ Số nguyên tố  
✅ Bình phương và lũy thừa  
✅ Xử lý lỗi  
✅ Xác thực toán học  

Chạy test:
```bash
julia test/vidu1_test.jl
```

## 💡 Trường Hợp Sử Dụng

| Lĩnh Vực | Ứng Dụng |
|----------|----------|
| **Lý Thuyết Số** | Phân tích số, GCD/LCM, tính chất số |
| **Mật Mã Học** | Phân tích khóa RSA, kiểm tra nguyên tố |
| **Toán Học** | Thiết kế thuật toán, phân tích độ phức tạp |
| **Giáo Dục** | Dạy lý thuyết số, ví dụ thuật toán |

## ⚡ Hiệu Suất

| Hàm | Độ Phức Tạp | Ví Dụ |
|-----|----------|-------|
| `prime_factorization` | O(√n) | `prime_factorization(1_000_000_000)` < 1ms |
| `prime_factorization_with_count` | O(√n) | Như trên |
| `is_prime` | O(√n) | `is_prime(1_000_000_007)` < 0.1ms |

## 🔧 API Tóm Tắt

```julia
# Phân tích cơ bản
prime_factorization(n::Int) :: Vector{Int}

# Phân tích với đếm
prime_factorization_with_count(n::Int) :: Dict{Int, Int}

# Kiểm tra nguyên tố
is_prime(n::Int) :: Bool
```

## 📝 Ví Dụ Nhanh

```julia
include("src/vidu1.jl")

# Ví dụ 1: Phân tích 120
prime_factorization(120)
# [2, 2, 2, 3, 5]

# Ví dụ 2: Với đếm
prime_factorization_with_count(120)
# Dict(2 => 3, 3 => 1, 5 => 1)  →  2³ × 3 × 5

# Ví dụ 3: Kiểm tra nguyên tố
[is_prime(n) for n in 1:10]
# [false, true, true, false, true, false, true, false, false, false]
```

## 🎓 Tính Toán Hữu Ích

### GCD từ Phân Tích Thừa Số

```
Nếu a = 2² × 3 × 5
Và  b = 2 × 3² × 7
Thì GCD(a,b) = 2¹ × 3¹ = 6
```

### LCM từ Phân Tích Thừa Số

```
Nếu a = 2² × 3
Và  b = 2 × 3²
Thì LCM(a,b) = 2² × 3² = 36
```

### Số Lượng Ước

```
Nếu n = p₁^a₁ × p₂^a₂ × ... × pₖ^aₖ
Số lượng ước = (a₁+1)(a₂+1)...(aₖ+1)

Ví dụ: 12 = 2² × 3¹
Số ước = (2+1)(1+1) = 6  →  [1,2,3,4,6,12]
```

## 🐛 Gỡ Lỗi

### Lỗi Phổ Biến

```julia
# ❌ Lỗi: n phải > 1
prime_factorization(0)   # ErrorException
prime_factorization(-5)  # ErrorException
prime_factorization(1)   # ErrorException

# ✅ Đúng:
prime_factorization(2)   # [2]
prime_factorization(100) # [2, 2, 5, 5]
```

## 📚 Tài Liệu Thêm

- **DOCUMENTATION.md**: Tài liệu API đầy đủ
- **EXAMPLES.jl**: 10 ví dụ thực tiễn chi tiết
- **test/vidu1_test.jl**: 50+ test case
- **src/vidu1.jl**: Mã nguồn với docstring chi tiết

## 📄 Giấy Phép

Xem file [LICENSE](LICENSE).

## 🎯 Tổng Kết

Module này cung cấp:
- ✅ Phân tích thừa số nguyên tố hiệu suất cao
- ✅ API đơn giản và dễ sử dụng
- ✅ Tài liệu toàn diện
- ✅ 50+ test case
- ✅ 10+ ví dụ thực tiễn
- ✅ Thích hợp cho giáo dục và ứng dụng thực tế

---

**Bắt đầu ngay:**
```julia
julia EXAMPLES.jl  # Chạy 10 ví dụ
julia test/vidu1_test.jl  # Chạy test
```

Để biết thêm chi tiết, xem [DOCUMENTATION.md](DOCUMENTATION.md).
