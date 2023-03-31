#!/bin/bash

# Prompt the user to select an action
echo "Select an action:"
echo "1. Install applications"
echo "2. Search for applications"
read -r action

case $action in
    # Install applications
    1)
        # Prompt the user to enter the names of the applications they want to install
        echo "Enter the names of the applications you want to install (separated by spaces): "
        read -r apps

        # Split the input string into an array of application names
        IFS=' ' read -r -a app_array <<< "$apps"

        # Prompt the user to confirm the list of applications to be installed
        echo "The following applications will be installed:"
        for app in "${app_array[@]}"
        do
            echo " - $app"
        done
        echo "Do you want to proceed with the installation? (y/n)"
        read -r confirm

        # If the user confirms, install the specified applications from the Arch Linux repository
        if [ "$confirm" == "y" ]
        then
            sudo pacman -S "${app_array[@]}"
            echo "Installation complete!"
        else
            echo "Installation canceled."
        fi
        ;;

    # Search for applications
    2)
        # Prompt the user to enter a search query
        echo "Enter a search query: "
        read -r query

        # Search the Arch Linux repository for packages matching the query
        search_results=$(pacman -Ss "$query")

        # Display the search results to the user
        echo "Search results for \"$query\":"
        echo "$search_results"
        ;;
esac

