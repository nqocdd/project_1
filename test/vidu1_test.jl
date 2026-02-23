using Test

# Include the main module
include("../src/vidu1.jl")

@testset "Prime Factorization Tests" begin
    
    @testset "Hàm prime_factorization" begin
        # Test với số nhỏ
        @test prime_factorization(2) == [2]
        @test prime_factorization(3) == [3]
        @test prime_factorization(4) == [2, 2]
        @test prime_factorization(6) == [2, 3]
        
        # Test với số ngoài cuộc
        @test prime_factorization(15) == [3, 5]
        @test prime_factorization(24) == [2, 2, 2, 3]
        @test prime_factorization(60) == [2, 2, 3, 5]
        
        # Test với bình phương
        @test prime_factorization(25) == [5, 5]
        @test prime_factorization(49) == [7, 7]
        
        # Test với số lớn hơn
        @test prime_factorization(100) == [2, 2, 5, 5]
        @test prime_factorization(1000) == [2, 2, 2, 5, 5, 5]
        @test prime_factorization(360) == [2, 2, 2, 3, 3, 5]
        
        # Test với số nguyên tố
        @test prime_factorization(7) == [7]
        @test prime_factorization(13) == [13]
        @test prime_factorization(97) == [97]
        
        # Test với số lớn
        @test prime_factorization(1024) == fill(2, 10)  # 2^10
        @test prime_factorization(243) == fill(3, 5)    # 3^5
    end
    
    @testset "Hàm prime_factorization_with_count" begin
        # Test đơn giản
        @test prime_factorization_with_count(2) == Dict(2 => 1)
        @test prime_factorization_with_count(4) == Dict(2 => 2)
        @test prime_factorization_with_count(6) == Dict(2 => 1, 3 => 1)
        
        # Test với số lớn hơn
        @test prime_factorization_with_count(24) == Dict(2 => 3, 3 => 1)
        @test prime_factorization_with_count(60) == Dict(2 => 2, 3 => 1, 5 => 1)
        @test prime_factorization_with_count(100) == Dict(2 => 2, 5 => 2)
        
        # Test với số nguyên tố
        @test prime_factorization_with_count(7) == Dict(7 => 1)
        @test prime_factorization_with_count(13) == Dict(13 => 1)
        
        # Test với lũy thừa
        @test prime_factorization_with_count(8) == Dict(2 => 3)
        @test prime_factorization_with_count(243) == Dict(3 => 5)
        @test prime_factorization_with_count(1024) == Dict(2 => 10)
    end
    
    @testset "Hàm is_prime" begin
        # Số không phải nguyên tố
        @test is_prime(0) == false
        @test is_prime(1) == false
        @test is_prime(4) == false
        @test is_prime(6) == false
        @test is_prime(9) == false
        @test is_prime(10) == false
        
        # Số nguyên tố
        @test is_prime(2) == true
        @test is_prime(3) == true
        @test is_prime(5) == true
        @test is_prime(7) == true
        @test is_prime(11) == true
        @test is_prime(13) == true
        @test is_prime(17) == true
        @test is_prime(19) == true
        @test is_prime(23) == true
        @test is_prime(29) == true
        @test is_prime(31) == true
        @test is_prime(37) == true
        @test is_prime(41) == true
        @test is_prime(43) == true
        @test is_prime(47) == true
        @test is_prime(97) == true
        
        # Số âm không phải nguyên tố
        @test is_prime(-5) == false
        @test is_prime(-2) == false
    end
    
    @testset "Trường hợp lỗi" begin
        # Kiểm tra xử lý lỗi
        @test_throws ErrorException prime_factorization(0)
        @test_throws ErrorException prime_factorization(-5)
        @test_throws ErrorException prime_factorization(1)
        
        @test_throws ErrorException prime_factorization_with_count(0)
        @test_throws ErrorException prime_factorization_with_count(-5)
        @test_throws ErrorException prime_factorization_with_count(1)
    end
    
    @testset "Xác thực kết quả" begin
        # Kiểm tra xem tích các thừa số có bằng số ban đầu
        test_numbers = [12, 30, 56, 100, 210, 360]
        
        for n in test_numbers
            factors = prime_factorization(n)
            product = prod(factors)
            @test product == n
        end
    end
    
    @testset "Tính chất toán học" begin
        # Tất cả thừa số phải là nguyên tố
        test_numbers = [10, 20, 30, 50, 100]
        
        for n in test_numbers
            factors = prime_factorization(n)
            for factor in factors
                @test is_prime(factor) "Factor $factor của $n không phải nguyên tố"
            end
        end
    end
    
end

# In kết quả của các test
println("\n" * "=" * 60)
println("KẾT QUẢ TEST")
println("=" * 60)
println("✓ Tất cả các test đã được thực hiện thành công!")
