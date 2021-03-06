ElementCardType = CardType{:element}()
const ElementCard = NastranCard{ElementCardType}

type CBEAM <: ElementCard
    id::Int64
    prop_id::Int64
end
function convert(::Type{CBEAM}, card)
    id = card[2]::Int64
    prop_id = card[3]::Int64

    CBEAM(id, prop_id)
end

type CTRIAR <: ElementCard
    id::Int64
    prop_id::Int64
    g1::Int64
    g2::Int64
    g3::Int64
    t1::Nullable{Float64}
    t2::Nullable{Float64}
    t3::Nullable{Float64}
end
function convert(::Type{CTRIAR}, card)
    tflag = 0

    id = card[2]::Int64
    prop_id = card[3] == "" ? id : card[3]::Int64
    g1 = card[4] == "" ? nothing : card[4]::Int64
    g2 = card[5] == "" ? nothing : card[5]::Int64
    g3 = card[6] == "" ? nothing : card[6]::Int64

    t1 = nothing
    t2 = nothing
    t3 = nothing

    if length(card) > 10
        tflag = card[11] == "" ? 0 : card[11]::Int64
        t1 = card[12] == "" ? nothing : card[12]::Float64
        t2 = card[13] == "" ? nothing : card[13]::Float64
        t3 = card[14] == "" ? nothing : card[14]::Float64
    end

    CTRIAR(id, prop_id, g1, g2, g3, t1, t2, t3)
end
const CTRIA3 = CTRIAR;

type CQUADR <: ElementCard
    id::Int64
    prop_id::Int64
    g1::Int64
    g2::Int64
    g3::Int64
    g4::Int64
    t1::Nullable{Float64}
    t2::Nullable{Float64}
    t3::Nullable{Float64}
    t4::Nullable{Float64}
end
function convert(::Type{CQUADR}, card)
    tflag = 0

    id = card[2]::Int64
    prop_id = card[3]::Int64
    g1 = card[4] == "" ? nothing : card[4]::Int64
    g2 = card[5] == "" ? nothing : card[5]::Int64
    g3 = card[6] == "" ? nothing : card[6]::Int64
    g4 = card[7] == "" ? nothing : card[7]::Int64

    t1 = nothing
    t2 = nothing
    t3 = nothing
    t4 = nothing

    if length(card) > 10
        tflag = card[11] == "" ? 0 : card[11]::Int64
        t1 = card[12] == "" ? nothing : card[12]::Float64
        t2 = card[13] == "" ? nothing : card[13]::Float64
        t3 = card[14] == "" ? nothing : card[14]::Float64
        t4 = card[15] == "" ? nothing : card[15]::Float64
    end

    CQUADR(id, prop_id, g1, g2, g3, g4, t1, t2, t3, t4)
end
const CQUAD4 = CQUADR;

#const CTETRA = CQUADR;
type CTETRA <: ElementCard
    id::Int64
    prop_id::Int64
    g1::Int64
    g2::Int64
    g3::Int64
    g4::Int64
    g5::Nullable{Int64}
    g6::Nullable{Int64}
    g7::Nullable{Int64}
    g8::Nullable{Int64}
    g9::Nullable{Int64}
    g10::Nullable{Int64}
end
function convert(::Type{CTETRA}, card)
    tflag = 0

    id = card[2]::Int64
    prop_id = card[3]::Int64
    g1 = card[4] == "" ? nothing : card[4]::Int64
    g2 = card[5] == "" ? nothing : card[5]::Int64
    g3 = card[6] == "" ? nothing : card[6]::Int64
    g4 = card[7] == "" ? nothing : card[7]::Int64
    g5 = card[8] == "" ? nothing : card[8]::Int64
    g6 = card[9] == "" ? nothing : card[9]::Int64

    g7 = nothing
    g8 = nothing
    g9 = nothing
    g10 = nothing

    if length(card) > 10
        tflag = card[11] == "" ? 0 : card[11]::Int64
        g7 = card[12] == "" ? nothing : card[12]::Int64
        g8 = card[13] == "" ? nothing : card[13]::Int64
        g9 = card[14] == "" ? nothing : card[14]::Int64
        g10 = card[15] == "" ? nothing : card[15]::Int64
    end

    CTETRA(id, prop_id, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10)
end

type CROD <: ElementCard
    id::Int64
    prop_id::Int64
end
function convert(::Type{CROD},card)
    id = card[2]::Int64
    prop_id = card[3] == "" ? id : card[3]::Int64
    CROD(id,prop_id)
end
const CBAR = CROD;

type CBUSH <: ElementCard
    id::Int64
end
function convert(::Type{CBUSH},card)
    id = card[2]::Int64
    CBUSH(id)
end

type RBE2 <: ElementCard
    id::Int64
end
function convert(::Type{RBE2},card)
    id = card[2]::Int64
    RBE2(id)
end

type RBE3 <: ElementCard
    id::Int64
end
function convert(::Type{RBE3},card)
    id = card[2]::Int64
    RBE3(id)
end

type CELAS1 <: ElementCard
    id::Int64
end
function convert(::Type{CELAS1},card)
    id = card[2]::Int64
    CELAS1(id)
end

type CELAS2 <: ElementCard
    id::Int64
end
function convert(::Type{CELAS2},card)
    id = card[2]::Int64
    CELAS2(id)
end

type CONM2 <: ElementCard
    id::Int64
    grid_id::Int64
    csys_id::Int64
    mass::Float64
    x::Float64
    y::Float64
    z::Float64
    I11::Float64
    I21::Float64
    I22::Float64
    I31::Float64
    I32::Float64
    I33::Float64
end
function convert(::Type{CONM2},card)
    id = card[2]::Int64
    grid_id = card[3]::Int64
    csys_id = card[4] == "" ? 0 : card[4]::Int64
    mass = card[5]::Float64
    x = card[6] == "" ? 0.0 : card[6]::Float64
    y = card[7] == "" ? 0.0 : card[7]::Float64
    z = card[8] == "" ? 0.0 : card[8]::Float64
    I11 = I21 = I22 = I31 = I32 = I33 = 0.0
    if length(card) > 9
        I11 = card[10] == "" ? 0.0 : card[10]::Float64
        I21 = card[11] == "" ? 0.0 : card[11]::Float64
        I22 = card[12] == "" ? 0.0 : card[12]::Float64
        I31 = card[13] == "" ? 0.0 : card[13]::Float64
        I32 = card[14] == "" ? 0.0 : card[14]::Float64
        I33 = card[15] == "" ? 0.0 : card[15]::Float64
    end
    CONM2(id,grid_id,csys_id,mass,x,y,z,I11,I21,I22,I31,I32,I33)
end

type CAERO1 <: ElementCard
    id::Int64
end
function convert(::Type{CAERO1},card)
    id = card[2]::Int64
    CAERO1(id)
end

type SPLINE1 <: ElementCard
    id::Int64
end
function convert(::Type{SPLINE1},card)
    id = card[2]::Int64
    SPLINE1(id)
end

type SPLINE2 <: ElementCard
    id::Int64
end
function convert(::Type{SPLINE2},card)
    id = card[2]::Int64
    SPLINE2(id)
end

type CHEXA <: ElementCard
    id::Int64
    prop_id::Int64
    point1::Int64
    point2::Int64
    point3::Int64
    point4::Int64
    point5::Int64
    point6::Int64
    point7::Int64
    point8::Int64
    point9::Int64
    point10::Int64
    point11::Int64
    point12::Int64
    point13::Int64
    point14::Int64
    point15::Int64
    point16::Int64
    point17::Int64
    point18::Int64
    point19::Int64
    point20::Int64
end
function convert(::Type{CHEXA},card)
    CHEXA(card[2]::Int64,
          card[3]::Int64,
          card[4]::Int64,
          card[5]::Int64,
          card[6]::Int64,
          card[7]::Int64,
          card[8]::Int64,
          card[9]::Int64,
          card[10]::Int64,
          card[11]::Int64,
          card[12] == "" ? 0 : card[12]::Int64,
          card[13] == "" ? 0 : card[13]::Int64,
          card[14] == "" ? 0 : card[14]::Int64,
          card[15] == "" ? 0 : card[15]::Int64,
          card[16] == "" ? 0 : card[16]::Int64,
          card[17] == "" ? 0 : card[17]::Int64,
          length(card) < 18 || card[18] == "" ? 0 : card[18]::Int64,
          length(card) < 18 || card[19] == "" ? 0 : card[19]::Int64,
          length(card) < 18 || card[20] == "" ? 0 : card[20]::Int64,
          length(card) < 18 || card[21] == "" ? 0 : card[21]::Int64,
          length(card) < 18 || card[22] == "" ? 0 : card[22]::Int64,
          length(card) < 18 || card[23] == "" ? 0 : card[23]::Int64)
end
