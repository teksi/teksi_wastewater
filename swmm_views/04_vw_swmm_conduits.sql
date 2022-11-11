--------
-- View for the swmm module class conduits
-- 20190329 qgep code sprint SB, TP
--------
CREATE OR REPLACE VIEW qgep_swmm.vw_conduits AS

SELECT
	re.obj_id as Name,
	coalesce(from_wn.obj_id, 'default_qgep_node') as FromNode,
	coalesce(to_wn.obj_id, 'default_qgep_node') as ToNode,
	CASE
		--WHEN re.length_effective <= 0.01 THEN st_length(progression_geometry)
		WHEN re.length_effective <= 0.01 AND st_length(progression_geometry) <= 0.01 THEN 0.01
		WHEN re.length_effective <= 0.01 AND st_length(progression_geometry) >= 0.01 THEN st_length(progression_geometry)
		WHEN re.length_effective IS NULL AND st_length(progression_geometry) <= 0.01 THEN 0.01
		WHEN re.length_effective IS NULL AND st_length(progression_geometry) >= 0.01 THEN st_length(progression_geometry)
		ELSE re.length_effective
	END as Length,
	CASE
		WHEN re.coefficient_of_friction IS NOT NULL THEN (1 / re.coefficient_of_friction::double precision)
		WHEN re.coefficient_of_friction IS NULL AND re.wall_roughness IS NOT NULL THEN 
			CASE
				WHEN re.clear_height IS NOT NULL THEN (1 / (4 * SQRT(9.81) * POWER((32 / re.clear_height::double precision / 1000),(1 / 6::double precision))*LOG(((3.71 * re.clear_height::double precision / 1000) / (re.wall_roughness / 1000)))))::numeric(7,4)
				WHEN re.clear_height IS NULL AND re.default_coefficient_of_friction IS NOT NULL THEN (1 / re.default_coefficient_of_friction::double precision)
				ELSE 0.01
			END
		WHEN re.coefficient_of_friction IS NULL AND re.wall_roughness IS NULL THEN
			CASE
				WHEN re.default_coefficient_of_friction IS NOT NULL THEN (1 / re.default_coefficient_of_friction::double precision)
				ELSE 0.01
			END
		ELSE 0.01
	END AS roughness,
	coalesce((rp_from.level-from_wn.bottom_level),0) as InletOffset,
	coalesce((rp_to.level-to_wn.bottom_level),0) as OutletOffset,
	0 as InitFlow,
	0 as MaxFlow,
	ws.identifier::text as description,
	cfh.value_en as tag,
	ST_CurveToLine(st_force3d(progression_geometry))::geometry(LineStringZ, %(SRID)s) as geom,
	CASE 
		WHEN status IN (7959, 6529, 6526) THEN 'planned'
		ELSE 'current'
	END as state,
   	CASE
		WHEN re.coefficient_of_friction IS NOT NULL THEN concat('Reach ', re.obj_id,': 1 / K_Strickler is used as roughness')
		WHEN re.coefficient_of_friction IS NULL AND re.wall_roughness IS NOT NULL THEN
			CASE
				WHEN re.clear_height IS NOT NULL THEN concat('Reach ', re.obj_id,': The approximation of 1 / K_Strickler is computed using K_Colebrook to determined the roughness as roughness')
				WHEN re.clear_height IS NULL AND re.default_coefficient_of_friction IS NOT NULL THEN concat('Reach ', re.obj_id,': The default value stored in qgep_swmm.reach_coefficient_of_friction is used')
				ELSE concat('Reach ', re.obj_id,': Default value 0.01 is used as roughness')
			END
		WHEN re.coefficient_of_friction IS NULL AND re.wall_roughness IS NULL THEN
			CASE
				WHEN re.default_coefficient_of_friction IS NOT NULL THEN concat('Reach ', re.obj_id,': The default value stored in qgep_swmm.reach_coefficient_of_friction is used')
				ELSE concat('Reach ', re.obj_id,': Default value 0.01 is used as roughness')
			END
		ELSE concat('Reach ', re.obj_id,': Default value 0.01 is used as roughness')
	END AS message
FROM qgep_od.reach as re
LEFT JOIN qgep_od.wastewater_networkelement ne ON ne.obj_id::text = re.obj_id::text
LEFT JOIN qgep_od.wastewater_structure ws ON ws.obj_id = ne.fk_wastewater_structure
LEFT JOIN qgep_od.reach_point rp_from ON rp_from.obj_id::text = re.fk_reach_point_from::text
LEFT JOIN qgep_od.reach_point rp_to ON rp_to.obj_id::text = re.fk_reach_point_to::text
LEFT JOIN qgep_od.wastewater_node from_wn on from_wn.obj_id = rp_from.fk_wastewater_networkelement
LEFT JOIN qgep_od.wastewater_node to_wn on to_wn.obj_id = rp_to.fk_wastewater_networkelement
LEFT JOIN qgep_od.channel ch on ch.obj_id::text = ws.obj_id::text
LEFT JOIN qgep_vl.channel_function_hydraulic cfh on cfh.code = ch.function_hydraulic
-- select only the primary channels pwwf.*
WHERE ch.function_hierarchic in (5066, 5068, 5069, 5070, 5064, 5071, 5062, 5072, 5074)
-- select only operationals and "planned"
AND status IN (6530, 6533, 8493, 6529, 6526, 7959);
-- 6526	"other.calculation_alternative"
-- 6529	"other.project"
-- 7959	"other.planned"
-- 6530	"operational.tentative"
-- 6533	"operational.will_be_suspended"
-- 8493	"operational"

-- 6532	"abanndoned.filled"
-- 3027	"unknown"
-- 3633	"inoperative"
-- 6523	"abanndoned.suspended_not_filled"
-- 6524	"abanndoned.suspended_unknown"
