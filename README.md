# TEKSI Wastewater

<img src="https://www.teksi.ch/wp-content/uploads/210910-teksi-assain-logos-fr-02.png" height="100"> <img src="https://www.teksi.ch/wp-content/uploads/210910-teksi-logos-fr-04.png" height="100">

---

This repository holds all code related to the **TEKSI Wastewater** module (formerly QGEP).

It contains:
- the datamodel definition
- a QGIS plugin
- a QGIS project
- the documentation


## Release policy

Teksi-Wastewater follows a *rolling release* model, meaning that the `main` branch always constitutes the latest stable release. **Merging a pull request means deploying a new stable release.**

A yearly release (`YYYY.0`) is created at the same time as QGIS LTR releases (usually in march). Non-backwards compatible changes such as dropping support for dependencies or removing existing workflows can only be merged during the "feature thaw", a period of 1 month before the yearly release (aimed to match QGIS's LTR feature freezes).

Two additional tags (`YYYY.1`, `YYYY.2`) are created in august and november. They only serve as milestones for organisational purposes (roadmapping) but otherwise do not differ from rolling release.


To accommodate that release model, the following rules apply:
- all changes happen in pull requests
- automated tests must be successfull before merged
- pull requests must be reviewed and approved by at least 1 other developer
- pull requests must be manually tested and approved by at least 1 user
- non-backwards compatible pull requests (dropping support for dependencies, removing existing workflows, etc.) must be tagged with the `frozen` tag, and can only be merged during "feature thaw"
- tagging and releasing is done automatically by the CI, based on a major version number that is stored in source, and a minor version number that is incremented (ex: `YYYY.0.1`, `YYYY.0.2`, [...], `YYYY.0.53` for relases, `YYYY.0-rc1`, `YYYY.0-rc2`, [...] for pre-releases during feature thaw)


### Dependency support policy

For each yearly release (`YYYY.0`), the supported versions are updated like this:
- [QGIS](https://www.qgis.org/en/site/getinvolved/development/roadmap.html): support previous LTR, current LTR, current stable, drop anything older
- [Python](https://devguide.python.org/versions/): supported version at release date
- [Postgres](https://www.postgresql.org/support/versioning/): supported version at release date
- [Postgis](https://trac.osgeo.org/postgis/wiki/UsersWikiPostgreSQLPostGIS): keep versions matching a supported version at release date
- Ili2pg and java: not policy defined yet (we will use what modelbaker defines)

Support for new versions of dependencies can be added at any point in time.

Non-system dependencies (such as pure python libraries) can be upgraded at any time, provided they meet the above requirements in terms of supported versions.

Developement requiring features unavailable to older supported versions must be handled gracefully (display a message to the user saying why the feature is not available, and include a comment in the code about when the check can be removed).


### Datamodel support policy

Teksi-wastewater supports the export/important to/from the following interlis datamodels:
- SIA405_ABWASSER_2015_LV95
- VSA_KEK_2019_LV95

No clear policy regarding the support of new versions of these datamodels nor the removal of old ones is defined yet.
