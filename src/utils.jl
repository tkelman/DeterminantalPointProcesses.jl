# utility functions


function get_first_nz_idx{T<:Real}(x::Array{T}, mask = nothing)
    first_nz_idx = 0
    for i in 1:length(x)
        mask != nothing && !mask[i] && continue
        first_nz_idx = i
        abs(x[i]) > eps() && break
    end
    first_nz_idx
end


function elem_symm_poly(Λ::Array{Float64}, k::Int)
    """Compute elementary symmetric polynomials for given Λ and k.
    """
    N = length(Λ)
    poly = zeros(k + 1, N + 1)
    poly[1, :] = 1
    for l in (1:k) + 1
        for n in (1:N) + 1
            poly[l, n] = poly[l, n - 1] + Λ[n - 1] * poly[l - 1, n - 1]
        end
    end
    poly
end
