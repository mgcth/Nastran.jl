module Cards

export NastranCard, GenericCard
export GridCard, ElementCard, PropertyCard, CoordinateSystemCard, ConstraintCard, MaterialCard, SetCard

import Base.convert

abstract type NastranCard{CardType} end
struct CardType{T} end

const GenericCard = Vector{Any}
@generated function NastranCard{U}(u::Type{Val{U}},card)
    return :(convert($U,card))
end

function convert(::Type{NastranCard},card::GenericCard)
    NastranCard(Val{Symbol(card[1])},card) # symbol() deprecated
end

export CELAS1,CELAS2,CROD,CBEAM,CBUSH,RBE2,RBE3,CTRIAR,CQUADR,CONM2,CAERO1,SPLINE1,SPLINE2,CHEXA,PBARL
include("element_cards.jl")

export PBEAM,PSHELL,PROD,PELAS,PAERO1,PSOLID
include("property_cards.jl")

export CORD1R,CORD2R
include("csys_cards.jl")

export GRID,SPOINT
include("grid_cards.jl")

export MPC
include("constraint_cards.jl")

export MAT1
include("material_cards.jl")

export AEFACT
include("set_cards.jl")

end
