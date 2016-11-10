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
    <td><tt>do_token</tt></td>
    <td>DigitalOcean access token</td>
    <td><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>ssh_fingerprint</tt></td>
    <td>SSH key to access the droplets</td>
    <td><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>private_key</tt></td>
    <td>Path to the private SSH key</td>
    <td><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>user</tt></td>
    <td>Remote exec username</td>
    <td><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>default_domain</tt></td>
    <td>Domain name for the infrastructure</td>
    <td><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>image</tt></td>
    <td>Droplet image / operating system</td>
    <td><tt>centos-6-x64</tt></td>
  </tr>
  <tr>
    <td><tt>region</tt></td>
    <td>Droplet region / data center</td>
    <td><tt>fra1</tt></td>
  </tr>
  <tr>
    <td><tt>lb_count</tt></td>
    <td>Number of load balancers</td>
    <td><tt>1</tt></td>
  </tr>
  <tr>
    <td><tt>lb_size</tt></td>
    <td>Load balancer droplet size</td>
    <td><tt>512mb</tt></td>
  </tr>
  <tr>
    <td><tt>web_count</tt></td>
    <td>Number of web servers</td>
    <td><tt>2</tt></td>
  </tr>
  <tr>
    <td><tt>web_size</tt></td>
    <td>Web server droplet size</td>
    <td><tt>512mb</tt></td>
  </tr>
</table>

Usage
-----
1. Clone the GitHub repository and change directory.
2. Set environment variables or modify `variables.tf` file.
3. Run `terraform plan` to see possible changes.
4. Run `terraform apply` to provision the infrastructure.
5. Run `terraform destroy` to delete all droplets and DNS entries.
