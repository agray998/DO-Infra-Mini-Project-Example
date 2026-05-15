# DO-Infra-Mini-Project-Example

## Repository Contents
- terraform: IAC configs for the following:
  - 1x VPC
  - 1x IGW
  - 1x Route table
  - 2x security groups - one for CI server, one for app resources
  - 2x Public subnets
  - 2x Ubuntu servers (1 CI server, 1 deploy server, 1 per subnet)
  - 1x RDS instance (same SG and subnet as the deploy server)
- ansible: ansible roles for configuring:
  - docker installation on both CI and app servers
  - Jenkins install and config on CI server
  - NodeJS install and source code retrieval on app server
