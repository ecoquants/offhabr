# am_cell_blocks ----
#' AquaMaps cell polygons intersecting OffHab zones and BOEM blocks
#'
#' Polygons from intersecting OffHab zone `oh_zones` x AquaMaps cell `am_cells` x BOEM block
#' `boem_blocks`
#'
#' @format A spatial features (`sf`) data frame with 1189 features and 6 fields:
#' \describe{
#'   \item{zcb_id}{unique identifier (integer) for OffHab zone `oh_zones` x
#'     AquaMaps cell `am_cells` x BOEM block `boem_blocks`}
#'   \item{block_key}{unique block identifier (character), comprised of
#'     \{PROTRACTION_NUMBER\}_\{BLOCK_NUMBER\}}
#'   \item{block_type}{one of either "lease" or "plan" depending on data source}
#'   \item{zone_key}{name of zone from `oh_zones`, originally BOEM Planning Area `RESA_summa` column}
#'   \item{zc_id}{identifier (integer) for OffHab zone and AquaMaps cell}
#'   \item{hcaf_id}{AquaMaps half degree cell identifier (integer) from `am_cells_grd`}
#'   \item{csquare_code}{from AquaMaps hcaf}
#'   \item{area_km2}{area of cell in square kilometers}
#'   \item{geom}{geometry in geographic coordinate system (EPSG: 4326)}
#' }
#' @source [Geographic Mapping Data in Digital Format](https://www.data.boem.gov/Main/Mapping.aspx),
#' [Marine Regions · United States Exclusive Economic Zone (EEZ)](https://marineregions.org/gazetteer.php?p=details&id=8456)
#' @concept data
"am_cell_blocks"

# am_cell_zones ----
#' AquaMaps cell polygons intersecting OffHab zones
#'
#' AquaMaps hcaf cells intersected with `oh_zones`.
#'
#' @format A spatial features (`sf`) data frame with 1189 features and 6 fields:
#' \describe{
#'   \item{zc_id}{unique identifier (integer) for OffHab zone and AquaMaps cell}
#'   \item{zone_key}{name of zone from `oh_zones`, originally BOEM Planning Area `RESA_summa` column}
#'   \item{hcaf_id}{AquaMaps half degree cell identifier (integer) from `am_cells_grd`}
#'   \item{csquare_code}{from AquaMaps hcaf}
#'   \item{center_long}{from AquaMaps hcaf}
#'   \item{center_lat}{from AquaMaps hcaf}
#'   \item{area_km2}{area of cell in square kilometers}
#'   \item{geom}{geometry in geographic coordinate system (EPSG: 4326)}
#' }
#' @source [Geographic Mapping Data in Digital Format](https://www.data.boem.gov/Main/Mapping.aspx),
#' [Marine Regions · United States Exclusive Economic Zone (EEZ)](https://marineregions.org/gazetteer.php?p=details&id=8456)
#' @concept data
"am_cell_zones"

# boem_blocks ----
#' BOEM Wind Energy Area Block polygons
#'
#' BOEM Wind Energy Area Block polygons
#'
#' @format A spatial features (`sf`) data frame with 5,596 features and 24 fields:
#' \describe{
#'   \item{block_id}{unique block identifier (integer)}
#'   \item{block_key}{unique block identifier (character), comprised of
#'     \{zone_key\}\{PROTRACTION_NUMBER\}_\{BLOCK_NUMBER\}}
#'   \item{block_type}{one of either "lease" or "plan" depending on data source}
#'   \item{zone_key}{unique zone from `oh_zones` containing the block}
#'   \item{PROTRACTION_NUMBER}{the BOEM area defined by the roughly
#'      2° longitude by 1° latitude containing up to 1,200 blocks.
#'      Computed using the International UTM Zone Numbering system, e.g.
#'      NJ is North (N); Lat 36-40° (J); 18 is UTM zone 18; and 02 is the 2nd of
#'      12 possible maps}
#'   \item{BLOCK_NUMBER}{Each whole block is approximately 3 nautical miles (nm)
#'     by 3 nm. For renewable energy purposes only, blocks can be leased
#'      down to the 16th of a block.}
#'   \item{BLOCK_LABEL}{}
#'   \item{SUB_BLOCK}{}
#'   \item{lease_LEASE_NUMBER}{}
#'   \item{lease_LEASE_TYPE}{}
#'   \item{lease_RESOURCE}{}
#'   \item{lease_COMPANY}{}
#'   \item{lease_LEASE_DATE}{}
#'   \item{lease_LEASE_TERM}{}
#'   \item{lease_PROJECT_EASEMENT}{}
#'   \item{lease_STATE}{}
#'   \item{lease_PROTRACTION_NAME}{}
#'   \item{lease_LEASE_DOCUMENT1}{}
#'   \item{lease_LEASE_DOCUMENT2}{}
#'   \item{plan_ADDITIONAL_INFORMATION}{}
#'   \item{plan_CATEGORY1}{}
#'   \item{plan_CATEGORY2}{}
#'   \item{plan_URL1}{}
#'   \item{plan_URL2}{}
#'   \item{area_km2}{area of zone in square kilometers}
#'   \item{geom}{geometry in geographic coordinate system (EPSG: 4326)}
#' }
#' @source * [Renewable Energy GIS Data | Bureau of Ocean Energy Management](https://www.boem.gov/renewable-energy/mapping-and-data/renewable-energy-gis-data)
#' @concept data
"boem_blocks"

# oh_zones ----
#' Offshore Habitat Zone polygons from BOEM Program Areas clipped to US EEZ
#'
#' Offshore habitat zones used for summary statistics and derived from BOEM
#' 2019-2024 Draft Proposed Program Areas for the lower 48 (excluding Hawaii and
#' Alaska), clipped by the United States Exclusive Economic Zone (EEZ).
#'
#' @format A spatial features (`sf`) data frame with 10 rows and 5 columns:
#' \describe{
#'   \item{zone_id}{unique zone identifier (integer)}
#'   \item{zone_key}{unique zone identifier (character), the lower-case of original BOEM Planning Area `MMS_PLAN_A` column}
#'   \item{zone_name}{name of zone, originally BOEM Planning Area `RESA_summa` column}
#'   \item{region}{oceanic region; one of: "Atlantic", "Gulf of Mexico" or "Pacific"}
#'   \item{area_km2}{area of zone in square kilometers}
#'   \item{geom}{geometry in geographic coordinate system (EPSG: 4326)}
#' }
#' @source [Geographic Mapping Data in Digital Format](https://www.data.boem.gov/Main/Mapping.aspx),
#' [Marine Regions · United States Exclusive Economic Zone (EEZ)](https://marineregions.org/gazetteer.php?p=details&id=8456)
#' @concept data
"oh_zones"

# oh_zones_s1k ----
#' Offshore Habitat Zone polygons from BOEM Program Areas clipped to US EEZ, simplified to 1 km
#'
#' Same as `oh_zones`, simplified to 1 km for faster rendering of smaller output files.
#' Offshore habitat zones used for summary statistics and derived from BOEM
#' 2019-2024 Draft Proposed Program Areas for the lower 48 (excluding Hawaii and
#' Alaska), clipped by the United States Exclusive Economic Zone (EEZ).
#'
#' @format A spatial features (`sf`) data frame with 10 rows and 5 columns:
#' \describe{
#'   \item{zone_id}{unique zone identifier (integer)}
#'   \item{zone_key}{unique zone identifier (character), the lower-case of original BOEM Planning Area `MMS_PLAN_A` column}
#'   \item{zone_name}{name of zone, originally BOEM Planning Area `RESA_summa` column}
#'   \item{region}{oceanic region; one of: "Atlantic", "Gulf of Mexico" or "Pacific"}
#'   \item{area_km2}{area of zone in square kilometers}
#'   \item{geom}{geometry in geographic coordinate system (EPSG: 4326)}
#' }
#' @source [Geographic Mapping Data in Digital Format](https://www.data.boem.gov/Main/Mapping.aspx),
#' [Marine Regions · United States Exclusive Economic Zone (EEZ)](https://marineregions.org/gazetteer.php?p=details&id=8456)
#' @concept data
"oh_zones_s1k"

# wm_rest_params ----
#' Lookup table for maximum requests per WoRMS REST API used by `wm_rest()`
#'
#' A data frame describing the maximum number of simultaneous requests allowed
#' by the [WoRMS REST API](https://www.marinespecies.org/rest/).
#'
#' @format A data frame with 3 rows and 3 columns:
#' \describe{
#'   \item{type}{helpful descriptor of type of operation}
#'   \item{operation}{name of operation}
#'   \item{max}{maximum number of simultaneous requests allowed}
#' }
#' @source [WoRMS REST API](https://www.marinespecies.org/rest/)
#' @concept data
"wm_rest_params"

