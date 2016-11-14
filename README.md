Terraform infrastructure
========================
This repository contains a complete Terraform infrastructure for testing purposes. A `terraform apply` will deploy one load balancer and two web server on DigitalOcean. It will set up a domain and the related `A` and `AAAA` records as well.

Requirements
------------
- Recent release of Terraform including the DigitalOcean provider
- DigitalOcean access token
- Domain (only required if you want to have full name resolution)

Variables
---------
The following list contains all variables that need to be set. Variables without default value needs to be set via environment variables with `TF_VAR_` prefix or in the `variables.tf` file.

<table>
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>do_token</td>
    <td>DigitalOcean access token</td>
    <td>-</td>
  </tr>
  <tr>
    <td>ssh_fingerprint</td>
    <td>SSH key to access the droplets</td>
    <td>-</td>
  </tr>
  <tr>
    <td>private_key</td>
    <td>Path to the private SSH key</td>
    <td>-</td>
  </tr>
  <tr>
    <td>user</td>
    <td>Remote exec username</td>
    <td>-</td>
  </tr>
  <tr>
    <td>default_domain</td>
    <td>Domain name for the infrastructure</td>
    <td>-</td>
  </tr>
  <tr>
    <td>image</td>
    <td>Droplet image / operating system</td>
    <td>centos-6-x64</td>
  </tr>
  <tr>
    <td>region</td>
    <td>Droplet region / data center</td>
    <td>fra1</td>
  </tr>
  <tr>
    <td>lb_count</td>
    <td>Number of load balancers</td>
    <td>1</td>
  </tr>
  <tr>
    <td>lb_size</td>
    <td>Load balancer droplet size</td>
    <td>512mb</td>
  </tr>
  <tr>
    <td>web_count</td>
    <td>Number of web servers</td>
    <td>2</td>
  </tr>
  <tr>
    <td>web_size</td>
    <td>Web server droplet size</td>
    <td>512mb</td>
  </tr>
</table>

Usage
-----
1. Clone the GitHub repository and change directory.
2. Set environment variables or modify `variables.tf` file.
3. Run `terraform plan` to see possible changes.
4. Run `terraform apply` to provision the infrastructure.
5. Run `terraform destroy` to delete all droplets and DNS entries.
