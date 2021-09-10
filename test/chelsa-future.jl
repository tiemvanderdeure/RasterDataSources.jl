using RasterDataSources, Test, Dates
using RasterDataSources: rasterurl, rastername, rasterpath

@testset "CHELSA Future BioClim CMIP5" begin
    @test rastername(CHELSA{Future{BioClim,CMIP5,CCSM4,RCP26}}, 5; date=Date(2050)) == "CHELSA_bio_mon_CCSM4_rcp26_r1i1p1_g025.nc_5_2041-2060_V1.2.tif"

    bioclim_path = joinpath(ENV["RASTERDATASOURCES_PATH"], "CHELSA", "Future", "BioClim", "RCP26", "CCSM4")
    @test rasterpath(CHELSA{Future{BioClim,CMIP5,CCSM4,RCP26}}) == bioclim_path

    raster_path = joinpath(bioclim_path, "CHELSA_bio_mon_CCSM4_rcp26_r1i1p1_g025.nc_5_2041-2060_V1.2.tif")

    @test getraster(CHELSA{Future{BioClim,CMIP5,CCSM4,RCP26}}, 5) == raster_path
    @test isfile(raster_path)
end

@testset "CHELSA Future BioClim CMIP6" begin
    bioclim_name = "CHELSA_bio5_2041-2070_mri-esm2-0_ssp126_V.2.1.tif"
    @test rastername(CHELSA{Future{BioClim,CMIP6,MRIESM2,SSP126}}, 5; date=Date(2050)) == bioclim_name

    bioclim_path = joinpath(ENV["RASTERDATASOURCES_PATH"], "CHELSA", "Future", "BioClim", "SSP126", "MRIESM2")
    @test rasterpath(CHELSA{Future{BioClim,CMIP6,MRIESM2,SSP126}}) == bioclim_path

    raster_path = joinpath(bioclim_path, bioclim_name)
    @test getraster(CHELSA{Future{BioClim,CMIP6,MRIESM2,SSP126}}, 5) == raster_path
    @test isfile(raster_path)
end

@testset "CHELSA Future Climate CMIP5" begin
    tmax_name = "CHELSA_tasmax_mon_CCSM4_rcp60_r1i1p1_g025.nc_7_2041-2060_V1.2.tif"
    @test rastername(CHELSA{Future{Climate,CMIP5,CCSM4,RCP60}}, :tmax; date=Date(2050), month=7) == tmax_name

    climate_path = joinpath(ENV["RASTERDATASOURCES_PATH"], "CHELSA", "Future", "Climate", "RCP60", "CCSM4")
    @test rasterpath(CHELSA{Future{Climate,CMIP5,CCSM4,RCP60}}) == climate_path

    raster_path = joinpath(climate_path, tmax_name)
    @test rasterpath(CHELSA{Future{Climate,CMIP5,CCSM4,RCP60}}, :tmax; date=Date(2050), month=7) == raster_path
    @test rasterurl(CHELSA{Future{Climate,CMIP5,CCSM4,RCP45}}, :prec; date=Date(2050), month=6) |> string ==
        "https://os.zhdk.cloud.switch.ch/envicloud/chelsa/chelsa_V1/cmip5/2041-2060/prec/CHELSA_pr_mon_CCSM4_rcp45_r1i1p1_g025.nc_6_2041-2060.tif"
    @test rasterurl(CHELSA{Future{Climate,CMIP5,CCSM4,RCP45}}, :tmin; date=Date(2050), month=1) |> string ==
        "https://os.zhdk.cloud.switch.ch/envicloud/chelsa/chelsa_V1/cmip5/2041-2060/tmin/CHELSA_tasmin_mon_CCSM4_rcp45_r1i1p1_g025.nc_1_2041-2060_V1.2.tif"
    @test getraster(CHELSA{Future{Climate,CMIP5,CCSM4,RCP60}}, :tmax; month=7) == raster_path
    @test isfile(raster_path)
end

@testset "CHELSA Future Climate CMIP6" begin
    temp_name = "CHELSA_gfdl-esm4_r1i1p1f1_w5e5_ssp585_tas_01_2071_2100_norm.tif"
    @test rastername(CHELSA{Future{Climate,CMIP6,GFDLESM4,SSP585}}, :temp; date=Date(2080), month=1) == temp_name

    climate_path = joinpath(ENV["RASTERDATASOURCES_PATH"], "CHELSA", "Future", "Climate", "SSP585", "GFDLESM4")
    @test rasterpath(CHELSA{Future{Climate,CMIP6,GFDLESM4,SSP585}}) == climate_path
    raster_path = joinpath(climate_path, temp_name)
    @test rasterpath(CHELSA{Future{Climate,CMIP6,GFDLESM4,SSP585}}, :temp; date=Date(2080), month=1) == raster_path
    temp_url = "https://os.zhdk.cloud.switch.ch/envicloud/chelsa/chelsa_V2/GLOBAL/climatologies/2071-2100/GFDL-ESM4/ssp585/tas/" * temp_name
    @test rasterurl(CHELSA{Future{Climate,CMIP6,GFDLESM4,SSP585}}, :temp; date=Date(2080), month=1) |> string == temp_url
    @test getraster(CHELSA{Future{Climate,CMIP6,GFDLESM4,SSP585}}, :temp; date=Date(2080), month=1) == raster_path
    @test isfile(raster_path)
end
