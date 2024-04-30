## pangeo-forge

[pangeo-forge] is an extract-transform-load project that forms part of the pangeo stack for geoscience data in the cloud.

### Paper summary

_Pangeo Forge: Crowdsourcing Analysis-Ready, Cloud Optimized Data Production_

https://www.frontiersin.org/articles/10.3389/fclim.2021.782909/full

"A wholly open-source platform composed of multiple modular components, Pangeo Forge presents a foundation for the practice of reproducible, cloud-native, big-data ocean, weather, and climate science without relying on proprietary or cloud-vendor-specific tooling."

Aims to lower the barrier for domain experts (who understand the analytical applicationa and quality considerations) to contribute to curated, shared environmental data.

"Analysis-ready" data is taken to mean data which has had an amount of preprocessing done to make it consistent, clean and corrected for errors. It's not necessarily, or always "cloud-optimised".

Tiem to analysis is limited by network bandwidth, hardware characteristics, and data format. When we refer to “cloud-optimized” data it is this third variable, format - supporting direct access to data subsets without the overhead of reading a lot of data to retrieve a small part of it.

"datasets which have undergone the preprocessing required to fulfill the quality standards of a particular analytic task and which are also stored in formats that allow efficient, direct access to data subsets."

"Right to Replicate": even if an underlying cloud provider technology is closed source, the application code definig our particular implementation of that technology is always open source,

The vast variety of environmental data and use cases means "a fully generalized and automatic approach for transforming archival data into ARCO stores is likely neither achievable nor desirable."

The setup of Pangeo Forge follows the model of Conda Forge - time saving for researchers, "community members contribute recipes to a public storehouse which define steps for building software dependencies"

#### Design overview

* A set of "recipes" and scalable algorithms for data production
* An automation system which runs the recipes in the cloud
* A catalog service

The framework provides an object model for defining a pipeline, with hooks for your own custom rules, trying to strike a balance between generic and customisable.


