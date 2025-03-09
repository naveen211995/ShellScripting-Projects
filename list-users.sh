#/bin/bash


#GitHub API URL
API_URL = "https://api.github.com"

#GitHub Username and Personal AccessToken
USERNAME = $username
TOKEN = $token

# User and Repository information
REPO_OWNER = $1
REP_NAME = $2

#Function to make a GET Request to the GitHub API
function githun_api_get{
	local endpoint = "$1"
	local url = "${APIURL}/${endpoint}"

	#Send a GET request to the GitHub API with authentication
	curl -s -u "${USERNAME}:${TOKEN}" "url"
}

#Function to list the users with read access to the repository
function list_users_with_read_access{
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

	#Fetch the list of collaborators on the repository
	collaborators = "$(github_api_get "$endpoint" | jq -r .[] | select(.permissions.pull == true) | .login)"

	#Display the list of collaborators with read access
	if[[ -z "$collaborators" ]]; then
		echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
	else
		echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
		echo "$collaborators"
	fi

}

#Main script
echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
		
