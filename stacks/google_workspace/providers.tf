provider "aws" {
  region  = "eu-west-1"
  profile = var.pipeline ? null : "bartlett"
}

provider "googleworkspace" {
  customer_id = "C03c5cqsb"
  oauth_scopes = [
	  "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/apps.groups.settings",
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema", 
  ]
}
