module Nastran

import Base: show, +, -, zero

using StaticArrays

export NastranDeck, GenericNastranDeck, NastranModel
export CoordSet,get_coord,get_global_xyz
export MassCG, XYZ, Mat3x3

const XYZ = SVector{3,Float64}
const Mat3x3 = SMatrix{3,3,Float64}

include("cards/Cards.jl")
using .Cards

include("deck.jl")

include("coords.jl")
include("model.jl")
include("weights.jl")

end # module
