### General
- Similar to [[AWS CloudFormation Template Parameters]] (at least Cantrill says so)
	- Except these parameters don't need to be defined in the template rather they are injected from AWS into the [[Stack (CloudFormation)]]
	- The value of the parameters matches the context
	- Eg. the `AWS::Region` pseudo parameter always matches the region the stack is being created in 

### Other Common Pseudo Parameters
1. `AWS::StackId`
2. `AWS::StackName`
3. `AWS::AccountId`

