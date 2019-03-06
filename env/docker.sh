alias dip="docker images | grep '<none>' | awk '{ print \"docker rmi \" $3 }' | bash"
