.. _Create-Input:

SWMM Create Input
=================

- The plugin extracts only the primary wastewater structures

- The ``.inp`` file is the input file format for SWMM. It contains the wastewater network AND simulation parameters. The network can be extracted from the QGEP data, but the simulation parameters must be set according to your study.

- The simulation parameters are copied from a provided template ``.inp`` file. A default file is provided in the plugin folder in ``src\swmm_templates\default_qgep_swmm_parameters.inp``, but you can create and use your own template file.

- By default, the export supposes that you use an *Horton Infiltration method*. If another method is set in the template ``.inp``, you might need to adapt the generated ``.inp``. See the linked `issue <https://github.com/QGEP/QGEP/issues/644/>`_

QGEP plugin
-----------

Launch ``SWMM Create Input``:

- ``Database``: the name of the service used to connect to the database
- ``State``: Current or Planned: extract the wastewater structure according to the status
- ``Template INP file``: a ``.inp`` from which simulation parameters will be copied
- ``Destination INP file``: the ``.inp`` generated from QGEP data