# Specify the URL of the web page
url="https://goldbroker.com/charts/gold-price/cad"

# Use curl to get the webpage
curl -s "$url" -o goldpage.html

# Extract the current gold price using grep and sed. the grep command searches for each pattern in the files. CA$[^<]*</td> is exactly what we are 
# looking for within td. sed cleans up the text we are looking for.
cad_value=$(grep -o 'CA$[^<]*</td>' goldpage.html | sed 's/CA$//;s/<\/td>//')

# Echo outputs on the terminal the value of gold for 1 ounce, 1kg and 1 gram.
echo "Current Gold Price for 1 ounce, 1kg, 1 gram (CAD): $cad_value"
