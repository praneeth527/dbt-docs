#!/bin/bash

 # Directory where your projects are stored
 projects_dir="projects"

 # HTML file to generate
 output_file="docs/index.html"

 # Start generating HTML
 cat <<EOF > "$output_file"
 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>DBT Projects</title>
     <style>
         body {
             font-family: Arial, sans-serif;
             margin: 0;
             padding: 0;
             background-color: #f4f4f4;
         }
         .container {
             width: 80%;
             margin: 20px auto;
             background-color: #fff;
             padding: 20px;
             border-radius: 5px;
             box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
         }
         h1 {
             color: #333;
         }
         ul {
             list-style-type: none;
             padding: 0;
         }
         li {
             margin-bottom: 10px;
         }
         a {
             color: #007bff;
             text-decoration: none;
         }
         a:hover {
             text-decoration: underline;
         }
         .logo {
             width: 150px;
             height: auto;
             margin-bottom: 20px;
         }
     </style>
 </head>
 <body>
     <div class="container">
          <img class="logo" src="https://www.getdbt.com/ui/img/logos/dbt-logo.svg" alt="DBT Logo">
         <h1>DBT Projects</h1>
         <ul>
EOF

 # Loop through each folder in the projects directory
 for project_name in "$projects_dir"/*; do
     if [ -d "$project_name" ]; then
         project_name=$(basename "$project_name")
         echo "            <li><a href=\"$project_name\">$project_name</a></li>" >> "$output_file"
     fi
 done

 # Complete HTML file
 cat <<EOF >> "$output_file"
         </ul>
     </div>
 </body>
 </html>
EOF

echo "HTML file generated: $output_file"
