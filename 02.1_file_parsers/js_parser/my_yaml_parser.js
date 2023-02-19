const fs = require('fs');
const yaml = require('js-yaml');

//Loading the file as a string
const yamlStr = fs.readFileSync('../../02._data_formats/sample.yaml', 'utf8');

//Parsing the string into a js object
const yamlData = yaml.load(yamlStr);

console.log(yamlData);