using Printf

import Base: +, -, *, /, ^, ==

struct FieldElement
    num::Int128
    prime::Int128

    function FieldElement(num::Int128, prime::Int128)
        @assert(num < prime && num >= 0, "Num not in field range")

        new(num, prime)
    end
end

function Base.show(io::IO, elem::FieldElement)
    @printf(io, "FieldElemend_%d(%d)", elem.prime, elem.num)
end

function ==(lhs::FieldElement, rhs::FieldElement)
    lhs.num == rhs.num && lhs.prime == rhs.prime
end

function +(lhs::FieldElement, rhs::FieldElement)
    @assert(lhs.prime == rhs.prime, "Cannot add two numbers in different fields.")

    num = (lhs.num + rhs.num) % lhs.prime
    FieldElement(num, lhs.prime)
end

function -(lhs::FieldElement, rhs::FieldElement)
    @assert(lhs.prime == rhs.prime, "Cannot subtract two numbers in different fields.") 

    num = (lhs.num - rhs.num) % lhs.prime
    FieldElement(num, lhs.prime)
end

function *(lhs::FieldElement, rhs::FieldElement)
    @assert(lhs.prime == rhs.prime, "Cannot multiply two numbers in different fields.")

    num = (lhs.num * rhs.num) % lhs.prime
    FieldElement(num, lhs.prime)
end

function /(lhs::FieldElement, rhs::FieldElement)
    @assert(lhs.prime == rhs.prime, "Cannot divide two numbers in different fields.")

    num = (lhs.num * ((rhs.num ^ (lhs.prime -2)) % lhs.prime)) % lhs.prime
    FieldElement(num, lhs.prime)
end

function ^(lhs::FieldElement, exp::Int128)
    n = mod1(exp, lhs.prime - 1)
    num = (lhs.num ^ n) % lhs.prime
    FieldElement(num, lhs.prime)
end
