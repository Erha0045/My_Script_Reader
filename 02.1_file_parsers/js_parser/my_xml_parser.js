const fs = require('fs');
const xmlParser = require('xml2js').parseString;


fs.readFile('../../02._data_formats/sample.xml','utf8', (err, xml) => {
  if (err) {
    console.error(err);
    return;
  }
  xmlParser(xml, (err, result) => {
    if (err) {
      console.error(err);
      return;
    }
    console.log('The xml parsed to json', JSON.stringify(result));
  });
});