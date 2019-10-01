[![Build Status](https://travis-ci.org/sul-dlss/preservation_robots.svg?branch=master)](https://travis-ci.org/sul-dlss/preservation_robots)
[![Coverage Status](https://coveralls.io/repos/github/sul-dlss/preservation_robots/badge.svg)](https://coveralls.io/github/sul-dlss/preservation_robots)
[![GitHub version](https://badge.fury.io/gh/sul-dlss%2Fpreservation_robots.svg)](https://badge.fury.io/gh/sul-dlss%2Fpreservation_robots)

# preservation_robots

Robots for creating/updating preservation artifacts (Moabs) for DOR objects, adding Moabs to the preservation_catalog, etc.

## Restarting Robots

```
cap <deploy_stage> deploy:restart # restarts all the robots on servers defined in deploy stage file.
```

# Dependencies

External dependencies are surfaced in `config/settings.yml` and [shared_configs](https://github.com/sul-dlss/shared_configs) (preservation_robots_xxx branches).

# Overview of workflow

The workflow is defined by: https://github.com/sul-dlss/workflow-server-rails/blob/master/config/workflows/sdr/preservationIngestWF.xml

There are 6 robots:

1. `transfer-object`: copies the BagIt bag containing files for a new Moab version (or new Moab), which was created by common-accessioning sdr-ingest-transfer robot, to the deposit location for the Moab.

2. `validate-bag`: validates the BagIt/Moab deposit bag structure and version

3. `verify-apo`: verifies the governing APO for this object is in SDR

4. `update-moab`: create/add a version to Moab object from deposit bag

5. `update-catalog`: create/update Preservation Catalog entry for this Moab

6. `complete-ingest`: removes deposit bag created by transfer-object robot, then transfers control back to accessioning

# Testing

See https://docs.google.com/document/d/1d1GmSkam5_mR8NkbUQIf-Ztneu82zWChSqVSo6yUDVY
