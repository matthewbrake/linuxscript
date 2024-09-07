#!/bin/bash

# Step 1: Install Python and pip (if not already installed)
# Update package list
sudo apt update

# Install Python and pip
sudo apt install -y python3 python3-pip

# Step 2: Install MkDocs and the Material theme
# Install MkDocs and the Material theme using pip
pip3 install mkdocs mkdocs-material


# Step 3: Create a new MkDocs project
# Create a new directory for your MkDocs project
mkdir my_mkdocs_project
cd my_mkdocs_project

# Git clone the repo with the .yml
git clone https://github.com/pikvm/pikvm.git
cd pikvm

# Initialize a new MkDocs project
mkdocs new .

# Step 4: Edit the mkdocs.yml configuration file
# Open the mkdocs.yml file in a text editor
nano mkdocs.yml

# (Optional) Modify the site name and theme
# Change the site_name and theme as needed
# Example:
# site_name: My Documentation
# theme:
#   name: material

# Step 5: Add documentation pages
# Create a new Markdown file in the docs directory
echo "# Welcome to My Documentation" > docs/index.md

# Add another page
echo "# Getting Started" > docs/getting-started.md

# Step 6: Update mkdocs.yml to include new pages
# Open mkdocs.yml again
nano mkdocs.yml

# Add the new pages to the navigation section
# Example:
# nav:
#   - Home: index.md
#   - Getting Started: getting-started.md

# Step 7: Serve the documentation locally
# Start the MkDocs development server
mkdocs serve

# Open your browser and navigate to http://127.0.0.1:8000 to view the documentation

# Step 8: Build the documentation for deployment
# Build the static site files
mkdocs build

# The built files will be located in the 'site' directory

# Step 9: Install mkdocs-pdf plugin (optional)
# If you want to generate a PDF, install the mkdocs-pdf plugin
pip3 install mkdocs-pdf

# Step 10: Generate PDF from MkDocs
# Generate the PDF file
mkdocs pdf

# The PDF file will typically be created in the current directory or the site directory

# Step 11: Clean up (optional)
# If you want to remove the project, you can do so with:
# cd ..
# rm -rf my_mkdocs_project

echo "MkDocs project setup complete! Check the 'site' directory for the built documentation."
