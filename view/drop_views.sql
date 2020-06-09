
-- export views
DROP VIEW IF EXISTS qgep_od.vw_export_reach;
DROP VIEW IF EXISTS qgep_od.vw_export_wastewater_structure;

-- import
DROP VIEW IF EXISTS qgep_import.vw_manhole;

-- big views
DROP VIEW IF EXISTS qgep_od.vw_qgep_wastewater_structure;
DROP VIEW IF EXISTS qgep_od.vw_qgep_maintenance;
DROP VIEW IF EXISTS qgep_od.vw_qgep_damage;
DROP VIEW IF EXISTS qgep_od.vw_qgep_overflow;

-- structure_part
DROP VIEW IF EXISTS qgep_od.vw_access_aid;
DROP FUNCTION IF EXISTS qgep_od.vw_access_aid_insert();

DROP VIEW IF EXISTS qgep_od.vw_backflow_prevention;
DROP FUNCTION IF EXISTS qgep_od.vw_backflow_prevention_insert();

DROP VIEW IF EXISTS qgep_od.vw_benching;
DROP FUNCTION IF EXISTS qgep_od.vw_benching_insert();

DROP VIEW IF EXISTS qgep_od.vw_cover;
DROP FUNCTION IF EXISTS qgep_od.vw_cover();

DROP VIEW IF EXISTS qgep_od.vw_dryweather_downspout;
DROP FUNCTION IF EXISTS qgep_od.vw_dryweather_downspout_insert();

DROP VIEW IF EXISTS qgep_od.vw_dryweather_flume;
DROP FUNCTION IF EXISTS qgep_od.vw_dryweather_flume_insert();


-- wastewater_structure
DROP VIEW IF EXISTS qgep_od.vw_channel;
DROP FUNCTION IF EXISTS qgep_od.vw_channel_insert();

DROP VIEW IF EXISTS qgep_od.vw_manhole;
DROP FUNCTION IF EXISTS qgep_od.vw_manhole_insert();

DROP VIEW IF EXISTS qgep_od.vw_discharge_point;
DROP FUNCTION IF EXISTS qgep_od.vw_discharge_point_insert();

DROP VIEW IF EXISTS qgep_od.vw_special_structure;
DROP FUNCTION IF EXISTS qgep_od.vw_special_structure_insert();


-- wastewater_networkelement
DROP VIEW IF EXISTS qgep_od.vw_reach;
DROP FUNCTION IF EXISTS qgep_od.vw_reach_insert();

DROP VIEW IF EXISTS qgep_od.vw_wastewater_node;
DROP FUNCTION IF EXISTS qgep_od.vw_wastewater_node_insert();

-- organisation
DROP VIEW IF EXISTS qgep_od.vw_organisation;
DROP VIEW IF EXISTS qgep_od.vw_administrative_office;
DROP VIEW IF EXISTS qgep_od.vw_canton;
DROP VIEW IF EXISTS qgep_od.vw_cooperative;
DROP VIEW IF EXISTS qgep_od.vw_municipality;
DROP VIEW IF EXISTS qgep_od.vw_private;
DROP VIEW IF EXISTS qgep_od.vw_waste_water_treatment_plant;
DROP VIEW IF EXISTS qgep_od.vw_waste_water_association;

-- overflows
DROP VIEW IF EXISTS qgep_od.vw_leapingweir;
DROP VIEW IF EXISTS qgep_od.vw_prank_weir;
DROP VIEW IF EXISTS qgep_od.vw_pump;

-- others
DROP VIEW IF EXISTS qgep_od.vw_individual_surface;

-- manual views
DROP VIEW IF EXISTS qgep_od.vw_file;
DROP VIEW IF EXISTS qgep_od.vw_change_points;
DROP VIEW IF EXISTS qgep_od.vw_catchment_area_connections;

-- qgep_wmm views
DROP VIEW IF EXISTS qgep_swmm.vw_aquifers;
DROP VIEW IF EXISTS qgep_swmm.vw_conduits;
DROP VIEW IF EXISTS qgep_swmm.vw_coordinates;
DROP VIEW IF EXISTS qgep_swmm.vw_coverages;
DROP VIEW IF EXISTS qgep_swmm.vw_dividers;
DROP VIEW IF EXISTS qgep_swmm.vw_dwf;
DROP VIEW IF EXISTS qgep_swmm.vw_infiltration;
DROP VIEW IF EXISTS qgep_swmm.vw_junctions;
DROP VIEW IF EXISTS qgep_swmm.vw_landuses;
DROP VIEW IF EXISTS qgep_swmm.vw_losses;
DROP VIEW IF EXISTS qgep_swmm.vw_outfalls;
DROP VIEW IF EXISTS qgep_swmm.vw_polygons;
DROP VIEW IF EXISTS qgep_swmm.vw_pumps;
DROP VIEW IF EXISTS qgep_swmm.vw_raingages;
DROP VIEW IF EXISTS qgep_swmm.vw_storages;
DROP VIEW IF EXISTS qgep_swmm.vw_subareas;
DROP VIEW IF EXISTS qgep_swmm.vw_subcatchments;
DROP VIEW IF EXISTS qgep_swmm.vw_tags;
DROP VIEW IF EXISTS qgep_swmm.vw_vertices;
DROP VIEW IF EXISTS qgep_swmm.vw_xsections;


