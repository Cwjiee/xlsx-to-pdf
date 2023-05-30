# xlsx-to-pdf
<p>Fyi, this script doesn't directly converts a xlsx file to pdf format.</p>
<h2>How it works</h2>
1. Parses data from an excel sheet<br>
2. Stores the value of item name, quantity and price<br>
3. Calculates the total price, then sort all items by total price in descending order<br>
4. Generates a pdf report using the data stored.<br><br>

For now, the script only parses data in a specific format as shown below

|      Name     |    Quantity   |  Price   |
| ------------- | ------------- | -------- |
| table         | 5             | 5.30     |
| chair         | 7             | 7.58     |

all the data below the first row will be stored
