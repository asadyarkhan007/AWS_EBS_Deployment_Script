#!/bin/bash
env=$1
rm target/your-project-backend*
mvn clean install -P $env
mv target/your-project-backend.war "target/$(date -r "target/your-project-backend.war" +"your-project-backend-%Y%m%d_%H%M%S.war")"
fileName=$(echo target/your-project-backend*)
aws s3 cp $fileName s3://elasticbeanstalk-eu-west-1-xxxxxxxxx
fileName="$(cut -d'/' -f2 <<<"$fileName")"
aws elasticbeanstalk create-application-version --application-name Your-Project-Name --version-label $2 --source-bundle S3Bucket=elasticbeanstalk-eu-west-1-xxxxxxxxx,S3Key=$fileName --region eu-west-1
if [ $1 = "UAT1" ]
then aws elasticbeanstalk update-environment --application-name Your-Project-Name --environment-name API-UAT-ENV-NAME --version-label $2
elif [ $1 = "PROD" ]
then aws elasticbeanstalk update-environment --application-name Your-Project-Name --environment-name API-PROD-ENV-NAME --version-label $2
fi
