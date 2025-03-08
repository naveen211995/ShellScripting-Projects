#!/bin/bash

##################################
#Author:                Naveen
#URL trying to hit:     https://api-github.com/repos/OWNER/REPO/collaborators
#Task:                  List all the users with read access under the Repository
#Version: V1
#################################

#GitHub API Base URL
API_URL = "https://api.github.com"


#GitHub Username and Personal Access
USERNAME = $username
TOKEN = $token

#Owner and Repository information
REPO_OWNER = $1
REPO_NAME = $2

#Function to make get request to the GitHub API
function github_get_api{
	local endpoint = "$1"
	local url = "${API_URL}/${endpoint}"

	#Send a get request to the GitHub API with authentication
	curl -s -u "${USERNAME}:${TOKEN}" "url"
}


#Function to list users with read-access to the repository
function list_users_with_read_access{
	local endpoint = "repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

	#Fetch the list of collaborators on the repository
	collaborators = "$(github_get_api "$endpoint" | jq -r '.[] | select(.permission.pull == true) | .login')"	

	#Display the list of collaborators with read access
	if [[ -z collaborators  ]]; then
		echo "No users with the read access fourn for ${REPO_OWNER}/${$REPO_NAME}."
	else
		echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}."
	        echo "$collaboratos"
	fi

}

#Main Script
echo "Listing the users with Read Access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_acess
