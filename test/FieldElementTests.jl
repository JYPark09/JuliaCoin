function add_sub_test()
    p = Int128(57)

    @test (FieldElement(Int128(44), p) + FieldElement(Int128(33), p)).num == 20
    @test (FieldElement(Int128(9), p) - FieldElement(Int128(29), p)).num == 37
    @test (FieldElement(Int128(17), p) + FieldElement(Int128(42), p) + FieldElement(Int128(49), p)).num == 51
    @test (FieldElement(Int128(52), p) - FieldElement(Int128(30), p) - FieldElement(Int128(38), p)).num == 41
end

function mul_test()
    p = Int128(97)

    @test (FieldElement(Int128(95), p) * FieldElement(Int128(45), p) * FieldElement(Int128(31), p)).num == 23
    @test (FieldElement(Int128(17), p) * FieldElement(Int128(13), p) * FieldElement(Int128(19), p) * FieldElement(Int128(44), p)).num == 68
end

function div_pow_test()
    p = Int128(31)

    @test (FieldElement(Int128(3), p) / FieldElement(Int128(24), p)).num == 4
    @test (FieldElement(Int128(17), p) ^ Int128(-3)).num == 29
    @test ((FieldElement(Int128(4), p) ^ Int128(-4)) * FieldElement(Int128(11), p)).num == 13
end

add_sub_test()
mul_test()
