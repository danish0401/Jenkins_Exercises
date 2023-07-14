# Working Script
#!/bin/bash
aws cloudformation describe-stacks --region 'us-west-2' --stack-name ${StackName} 2> /dev/null
status=$?
if [[ status -ne 0 ]] ; then 
aws cloudformation create-stack --stack-name ${StackName} --template-url https://danishbucket458.s3.us-west-2.amazonaws.com/s3cft.yml --region 'us-west-2';
aws cloudformation wait stack-create-complete --region 'us-west-2' --stack-name  ${StackName};
elif [ status == 0 ] && [ ${DeleteStack} == "false" ] ; then
aws cloudformation update-stack --stack-name ${StackName} --template-url https://danishbucket458.s3.us-west-2.amazonaws.com/s3cft.yml --region 'us-west-2';
aws cloudformatio wait stack-update-complete --region 'us-west-2' --stack-name  ${StackName};
else
aws cloudformation delete-stack --stack-name ${StackName} --region 'us-west-2'; fi

# Working Script 2

if ! aws cloudformation describe-stacks --region 'us-west-2' --stack-name ${StackName} 2> /dev/null ; then 
aws cloudformation create-stack --stack-name ${StackName} --template-url https://danishbucket458.s3.us-west-2.amazonaws.com/s3cft.yml --region 'us-west-2';
aws cloudformation wait stack-create-complete --region 'us-west-2' --stack-name  ${StackName};
elif [ aws cloudformation describe-stacks --region 'us-west-2' --stack-name ${StackName} 2> /dev/null ] && [ ${DeleteStack} == "false" ] ; then
aws cloudformation update-stack --stack-name ${StackName} --template-url https://danishbucket458.s3.us-west-2.amazonaws.com/s3cft.yml --region 'us-west-2';
aws cloudformation wait stack-update-complete --region 'us-west-2' --stack-name  ${StackName};
else
aws cloudformation delete-stack --stack-name ${StackName} --region 'us-west-2'; fi


# if [[ ${DeleteStack} == "true" ]]; then aws cloudformation delete-stack --stack-name ${StackName} --region 'us-west-2'; fi



# if ! aws cloudformation describe-stacks --region 'us-west-2' --stack-name ${StackName} ; then 
# aws cloudformation create-stack --stack-name ${StackName} --template-url https://danishbucket458.s3.us-west-2.amazonaws.com/s3cft.yml --region 'us-west-2';
# aws cloudformation wait stack-create-complete --region 'us-west-2' --stack-name  ${StackName};
# else
# aws cloudformation update-stack --stack-name ${StackName} --template-url https://danishbucket458.s3.us-west-2.amazonaws.com/s3cft.yml --region 'us-west-2';
# aws cloudformation wait stack-update-complete --region 'us-west-2' --stack-name  ${StackName}; fi

# if [[ ${DeleteStack} == "true" ]]; then aws cloudformation delete-stack --stack-name ${StackName} --region 'us-west-2'; fi
