## [v2.0.0]

- Refactored variable names to be more concise and consistent.

– Consolidated subnet creation into a single resource block using element(), length(), count, and count.index to create multiple subnets. More Dynamic!

- Added aws_eip resource to allocate Elastic IP address for NAT gateway. This is necessary to allow resources in the private subnets to access the internet.

- Added aws_nat_gateway resource to create a NAT gateway in the public subnet. The NAT gateway allows resources in the private subnet to access the internet while remaining private

- Added aws_route_table resource to create a route table for the private subnets. This allows traffic from the private subnets to be routed to the internet through the NAT gateway.

- Added aws_route_table_association resource to associate the route table with the private subnets. 

- Added aws_db_subnet_group resource to create a subnet group for RDS instances. This is useful for managing RDS instances that span multiple subnets.

## [v1.0.0] - Initial release