
const fs = require('fs');
const path = require('path');

//Reading the contents of my file
fs.readFile(
    path.join(__dirname, "../../02._data_formats", "sample.json"),"utf8", (err, data) => {
      if (err) {
      console.error(err);
      return;
    }
//Parsing the data into JSON
    const jsonData = JSON.parse(data);
//The JsonData is now an js object, which contains the parsed data
    console.log(jsonData);
});