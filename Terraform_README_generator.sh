#Install Necessary Dependencies
choco install terraform-docs

#Creates the Readme.md for Terraform Project
terraform-docs markdown table "<Project Directory>" --output-file "README.md"
