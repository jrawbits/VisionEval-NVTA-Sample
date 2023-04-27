## VisionEval 3.0 Model for NVTA

This folder is a VE_RUNTIME for the NVTA sample models with scenarios, implemented in VisionEval 3.0.

Make sure you have VisionEval at VE-3.0.0-Release-2 or later (VE-3.0.0-Release-2 was
published on 4/28/2023).

These models makes use of the new (in VE-3.0.0-Release-2) "BaseScenario" setup: Using
BaseScenario resolves a bug where some modules that re-write fields in the Datastore
during the "for 1:2" loop in standard VERSPM always presume the field won't exist on the
first iteration. Using a StartFrom stage makes the previous stage Datastore available, and
the first iteration finds an existing field. BaseScenario just points into the stage setup
and its inputs (not the Datastore). Since runModule now includes an iteration tracking
variable, we can eventually change the module implementation to use that iteration
variable in deciding whether to create or overwrite the field so there won't be confusion
if a StartFrom stage happens to have the same forecast year. StartFrom still works, and
the test models have been updated: for future year scenarios, StartFrom should point at
the Base Year model stage (and BaseScenario should be set to the Future Year default model
stage to pick up the unaltered inptus, forecast years and related parameters).

The initial release of this repository has one model with manually constructed stages. A
second model with automated scenario construction from a configuration list is under
development and this README will be updated when that's available.

