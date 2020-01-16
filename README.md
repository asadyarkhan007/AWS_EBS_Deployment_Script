**Setting Up System to run script:**

**Step 01:** Checkout master branch of your java-project and take latest pull. A new file named script.sh should be pulled from origin.

**Step 02:** Install ‘awscli’ by following instructions given in the following link:

for linux: https://linuxhint.com/install_aws_cli_ubuntu/ 

for windows: https://s3.amazonaws.com/aws-cli/AWSCLISetup.exe

**Step 03:** Now write following commands:

**aws configure**

This will prompt you to enter Access Key, Secret Key and Region. Note: don't do anything on 4th prompt and just hit Enter.

Access Key: Ask to any API developer to give you because ebs access policy must be attached to their account

Secret Key: Ask to any API developer to give you because ebs access policy must be attached to their account

Region: eu-west-1

Upto this step, your system is ready to run the automated deployment script.

Running the deployment script:

Make sure that you are in Project folder, outside of ‘target’ and ‘src’ folder.

Syntax: ./script.sh [environment_name] [version_name]

Possible Values for Environment Name: UAT1, UAT2, PROD

Version Name: It should be enclosed in inverted commas “ ” if you are not using single word for name. Furthermore, it should not conflict with already present version name, otherwise you will end up wasting time in redundant build creation.

Example Command: ./script.sh UAT1 “2.2.4(UAT1)-final”