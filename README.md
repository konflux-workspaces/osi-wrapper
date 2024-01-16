# OSI-WRAPPER

Set of utility scripts to bootstrap a development openshift cluster on AWS


## Usage

- requirements
  - openshift-installer cli
  - RH pull secret
  - aws account

> :warning: DO NOT COMMIT YOUR PRIVATE `install-config.tmpl.yaml`!

- create `./scripts/install-config.tmpl.yaml` based on `./scripts/COPY-install-config.tmpl.yaml` and configure it accordingly:
  - add you RH pull secret
  - add your public ssh-key
  - configure all aws values

- install with 
```bash
./scripts/install_script.sh mydevcluster mydomain.openshift.com
```
- destroy with
```bash
./scripts/destroy_script.sh mydevcluster
```

it will create a folder with all the cluster configuration and will print all the login details at the end of the installation.  
