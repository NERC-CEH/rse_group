## pangeo-forge

[pangeo-forge] is an extract-transform-load project that forms part of the pangeo stack for geoscience data in the cloud.

### Paper summary

_Pangeo Forge: Crowdsourcing Analysis-Ready, Cloud Optimized Data Production_

https://www.frontiersin.org/articles/10.3389/fclim.2021.782909/full

"A wholly open-source platform composed of multiple modular components, Pangeo Forge presents a foundation for the practice of reproducible, cloud-native, big-data ocean, weather, and climate science without relying on proprietary or cloud-vendor-specific tooling."

Aims to lower the barrier for domain experts (who understand the analytical applicationa and quality considerations) to contribute to curated, shared environmental data.

"Analysis-ready" data is taken to mean data which has had an amount of preprocessing done to make it consistent, clean and corrected for errors. It's not necessarily, or always "cloud-optimised".

Tiem to analysis is limited by network bandwidth, hardware characteristics, and data format. When we refer to “cloud-optimized” data it is this third variable, format - supporting direct access to data subsets without the overhead of reading a lot of data to retrieve a small part of it.

They define "Analysis Ready, Cloud Optimised" (ARCO) as "datasets which have undergone the preprocessing required to fulfill the quality standards of a particular analytic task and which are also stored in formats that allow efficient, direct access to data subsets."

"Right to Replicate": even if an underlying cloud provider technology is closed source, the application code definig our particular implementation of that technology is always open source,

The vast variety of environmental data and use cases means "a fully generalized and automatic approach for transforming archival data into ARCO stores is likely neither achievable nor desirable."

The setup of Pangeo Forge follows the model of Conda Forge - time saving for researchers, "community members contribute recipes to a public storehouse which define steps for building software dependencies"

#### Design overview

* A set of "recipes" and scalable algorithms for data production
* An automation system which runs the recipes in the cloud
* A catalog service

The framework provides an object model for defining a pipeline, with hooks for your own custom pre-processing steps, trying to strike a balance between generic and customisable. It is all based on [Apache Beam](https://beam.apache.org/) which has bindings for Go and Java as well as Python, but not R.

The recipes define endpoints as filesystem patterns, e.g. a set of HTTPS addressable resources with a predictable naming scheme. A lot of the example recipes cover a "consume XArray, output and store Zarr" pattern.

The ideal is a domain expert can focus on the methods and have a generic framework for the devops part of the picture, How the data is internally structured may depend on the analysis it's intended for (chunked differently for spatial vs timeseries analysis)

This is the list of ARCO datasets they hope, as of paper writing, to offer sample recipes:

* TileDB Embedded (multidimensional arrays)
* Cloud Optimised GeoTIFF (COG)
* Parquet 
* Cloud Optimised Point Cloud (COPC)

Cloud object storage is the "typical" destination but python's [filesystem_spec](https://github.com/fsspec/filesystem_spec) abstracts the storage backend so it could be anywhere that supports it.

The recipe then "compiles" to different workflow execution formats - this can be Dask on either k8s or HPC like SLURM, it can be Apache Beam or it can be an open core workflow engine called [Prefect Flow](https://docs.prefect.io/2.6/concepts/flows/) - and optionally run steps from a notebook for debugging purposes.

It gets a bit involved at this point, describing "Bakeries" - compute clusters which will run public recipes for free following a peer review process - and "feedstock" repositories where accepted recipes are "dispatched" to Bakeries

There's an automated test of a subset as part of this process, with validation tests for common domains, like this [CEDA CF checker](https://github.com/cedadev/cf-checker) which is probably in some NERC-EDS workflows already (BADC)) which is probably in some NERC-EDS workflows already (BADC). If it all succeeds the feedstock repo is created and run, and then a Github Action generates a catalogue listing.

[Here's an example accepted feedstock recipe](https://github.com/pangeo-forge/aqua-modis-feedstock/blob/main/feedstock/recipe.py) for MODIS AQUA

Bakery deployment is cloud-agnostic and supported by either credits or grants from the Big Tech cloud providers. The future ideal is for smaller institutions to host Bakeries.

The catalog service is STAC with DataCube extensions for Earth-system model (ESM) data. "We look forward to documenting catalog access from Javascript, R etc" they say

### Next steps

The [examples](https://www.frontiersin.org/articles/10.3389/fclim.2021.782909/full) show use of the [Open Storage Network](https://www.openstoragenetwork.org/), an NSF funded distributed research data storage network - see [Guidelines for Hosting](https://www.openstoragenetwork.org/wp-content/uploads/2021/04/Guidelines-for-Hosting-an-OSN-Pod.pdf)(pdf) for what OSN expects from member organisations.

"ARCO formats like Zarr are ideal for powering APIs, dashboards, and interactive websites, since they are based on open standards and can be read quickly from any programming language, including JavaScript, the language of the web... 

The direct provenance chain from the interactive tool, to the ARCO data copy, to the original upstream data provider would provide a fully transparent and trustworthy foundation for decision making."


## See Also

* [Cloud-native repositories for big scientific data](https://ieeexplore.ieee.org/document/9354557) - USGS-led publication focusing on Pangeo's use of the STAC catalog standard for ARCO data

* [Datacube STAC extension specification](https://github.com/stac-extensions/datacube)



