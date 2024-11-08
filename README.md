# Terraform Module for Provisioning a GKE Cluster on GCP

This Terraform module automates the creation of a Google Kubernetes Engine (GKE) cluster within your Google Cloud Platform (GCP) project, providing a solid foundation for your Kubernetes deployments.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Variables](#variables)
- [Outputs](#outputs)
- [Usage](#usage)
    - [Module Example](#module-example)
- [Cleanup](#cleanup)
- [License](#license)
- [Author](#author)

### Overview

This module offers an efficient and reliable way to provision a GKE cluster, customizable through variables to meet your specific needs. Key features include:

- **GKE Cluster Creation:** Configures all essential options to create a GKE cluster, including the number of nodes, machine type, network, and subnet.
- **Customization:** Allows you to customize the cluster through various variables such as region, project, environment, and node resources.
- **Terraform Integration:** Works seamlessly with other parts of your infrastructure defined as code, leveraging the power of Terraform to manage your cloud resources.

### Architecture

This module creates the following resources in GCP:

- **GKE Cluster:** The core of the module, where your Kubernetes workloads will run.
- **Nodes:** The virtual machine instances that make up the GKE cluster.
- **Network and Subnet:** The underlying network infrastructure for the cluster.

### Prerequisites

- **Google Cloud Account:** You will need an active account on the Google Cloud Platform.
- **Terraform:** Install and configure Terraform on your machine.
- **Google Cloud Provider for Terraform:** Ensure the Google Cloud provider is installed and configured correctly.
- **GCP CLI:** The Google Cloud command-line tool can be helpful for some tasks.
- **Kubernetes Engine API enabled:** Enable the Kubernetes Engine API in your GCP project.

### Variables

This module supports the following variables for customization:

### Required Variables

- `region`: The region where the cluster will be created.
* `owner`: The owner of the infrastructure resources.
* `project`: The GCP project name.
* `environment`: The environment (development, staging, production).
* `min_nodes`: The minimum number of nodes.
* `max_nodes`: The maximum number of nodes.
* `machine_type`: The machine type of the nodes.
* `network`: The name or self-link of the Google Compute Engine network.
* `subnetwork`: The name or self-link of the Google Compute Engine subnet.

For more details, see `variables.tf`

### Outputs

The module provides the following outputs:

- `name`: The name of the GKE cluster.
- `endpoint`: The endpoint address of the GKE cluster.

For additional details, refer to `outputs.tf`

## Usage

### Module Example

To use this module in your Terraform configuration, reference it as follows:

```hcl
module "gke_cluster" {
  source       = "github.com/a9org/gcp-gke"
  region       = "us-central1"
  owner        = "your_name"
  project      = "your_project"
  enviroment   = "production"
  min_nodes    = 1
  max_nodes    = 3
  machine_type = "e2-medium"
  network      = "your_network_self_link"
  subnetwork   = "your_subnet_self_link"
}
```

### Standalone Usage

1. **Clone the Repository**

    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ````

2. **Initialize Terraform**

    ```bash
    terraform init
    ````

3. **Configure Variables**

    Create a `terraform.tfvars`file and define the required variables:

    ```hcl
    region       = "us-central1"
    owner        = "your_name"
    project      = "your_project"
    enviroment   = "production"
    min_nodes    = 1
    max_nodes    = 3
    machine_type = "e2-medium"
    network      = "your_network_self_link"
    subnetwork   = "your_subnet_self_link"
    ```

4. **Apply the Configuration**

    Run the following command to create the infraestructure:

    ```bash
    terraform apply
    ```

    Review the changes and confirm whith `yes` to apply them.

## Cleanup

To destroy the infraestructure created by this Terraform configuration, run:

```bash
terraform destroy
```

Confirm with `yes`to proceed with deletion.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Author

- **Leonardo Issamu** - Initial work and Terraform configuration.