### General
- Every [[AWS Virtual Private Cloud (VPC)]] has a [[AWS VPC Router]]
- It is highly available- i.e. connected to every subnet (network+1 address)
- It directs traffic from somewhere to somewhere else
- It runs across all the [[AWS Availability Zones (AZ)]] of the VPC
	- For every [[AWS VPC Subnet]] the 'network + 1' address corresponds to the router's network interface in that subnet
- Router can directs traffic directly from one subnet to another subnet
- Controllable by 'route tables'

### Route Table
- The router is controllable by "route tables" and each subnet gets one
	- The [[AWS Route Table]] associated with a subnet determines what the VPC router will do when data leaves from that subnet
- VPC has a main route table 
	- By default the subnets use this
	- If a custom [[AWS Route Table]] is defined at the Subnet level, the main route table is dissociated and the custom route table is attached
	- A [[AWS Route Table]] can be associated with many subnets

### Internet Gateway
[[AWS Internet Gateway (IGW)]]
