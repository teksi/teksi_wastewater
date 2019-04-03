DROP VIEW IF EXISTS qgep_swmm.vw_pumps;


--------
-- View for the swmm module class junction
-- 20190329 qgep code sprint SB, TP
-- A pump in qgep is a node but a link in SWMM
-- -> The pump is attached to the reach which goes out from the pump
-- -> inlet node is the water node where the QGEP pump is located
-- -> outlet node is the water node at the end of the reach going out of the pump
--------

CREATE OR REPLACE VIEW qgep_swmm.vw_pumps AS

SELECT 
	pu.obj_id as name,
	pu.fk_wastewater_node as inlet_node, -- inlet is the waternode entering the pump
	pu.fk_overflow_to as outlet_node, -- outlet is the waternode at the top of next reach
	pu.start_level as startup_depth,
	pu.stop_level as shutoff_depth,
	pu.identifier as description, -- description of pump
	pu.remark as tag -- remark of pump
FROM qgep_od.vw_overflow_pump as pu
