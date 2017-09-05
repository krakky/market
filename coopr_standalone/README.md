# Coopr Standalone | v 1.0
Coopr is used internally as a self-service cluster provisioner for CASK developers, as a CI tool for integration testing, and as a DevOps tool to test new and incremental features. We’ve been developing and using COOPR for over a year, and we’re noticing the benefits: our developer and DevOps productivity have doubled, and our development and test cycles have become faster.

# SHA256 | (.pkg) integrity check
**B9DA967E196E4F0D1C52ABCF71B54BEDBF7AA48E312D6A87B9DE5E3F313957C1**

# License | Apache License 2.0
Refer to the [LICENSE](https://github.com/krakky/market/blob/master/coopr_standalone/LICENSE) file for more info !

# Requirements
- Coopr UI RAM: 512 MB minimum | 1 GB RAM recommended
- Coopr Server RAM: 1 GB minimum | 3 GB RAM recommended
- Coopr Provisioners RAM: 256 MB allocated for each of the running workers
  - for example, with 10 workers = 2.5 GB minimum
- Database (ex: MySQL) RAM: 1 GB minimum | 2 GB recommended
- Disk 	Disk usage increases as Coopr usage increases; suggested minimum of 50GB
- amd64 processor

# Supported OS:
- CentOS 6.x (3GB of RAM)
- CentOS 7.x (3GB of RAM)
- Ubuntu 14.x (3GB of RAM)