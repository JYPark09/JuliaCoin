function add_sub_test()
    p = big(57)

    @test (FieldElement(big(44), p) + FieldElement(big(33), p)).num == 20
    @test (FieldElement(big(9), p) - FieldElement(big(29), p)).num == 37
    @test (FieldElement(big(17), p) + FieldElement(big(42), p) + FieldElement(big(49), p)).num == 51
    @test (FieldElement(big(52), p) - FieldElement(big(30), p) - FieldElement(big(38), p)).num == 41
end

function mul_test()
    p = big(97)

    @test (FieldElement(big(95), p) * FieldElement(big(45), p) * FieldElement(big(31), p)).num == 23
    @test (FieldElement(big(17), p) * FieldElement(big(13), p) * FieldElement(big(19), p) * FieldElement(big(44), p)).num == 68
end

function div_pow_test()
    p = big(31)

    @test (FieldElement(big(3), p) / FieldElement(big(24), p)).num == 4
    @test (FieldElement(big(17), p) ^ big(-3)).num == 29
    @test ((FieldElement(big(4), p) ^ big(-4)) * FieldElement(big(11), p)).num == 13
end

add_sub_test()
mul_test()
