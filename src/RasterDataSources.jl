module RasterDataSources
@doc let
    path = joinpath(dirname(@__DIR__), "README.md")
    include_dependency(path)
    read(path, String)
end RasterDataSources

using Dates,
using Base64,
      Dates,
      GeoData,
      HTTP,
      URIs,
      ZipFile

export WorldClim, CHELSA, EarthEnv, AWAP, ALWB, SMAP

export BioClim, Climate, Weather, LandCover, HabitatHeterogeneity

export L4

export Values, Deciles

export getraster

include("types.jl")
include("interface.jl")
include("shared.jl")
include("worldclim/shared.jl")
include("worldclim/bioclim.jl")
include("worldclim/climate.jl")
include("worldclim/weather.jl")
include("chelsa/bioclim.jl")
include("earthenv/shared.jl")
include("earthenv/landcover.jl")
include("earthenv/habitatheterogeneity.jl")
include("awap/awap.jl")
include("alwb/alwb.jl")
include("smap/l4.jl")

end # module
