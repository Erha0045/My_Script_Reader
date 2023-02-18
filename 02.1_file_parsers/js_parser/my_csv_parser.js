const fs = require('fs');
const csv = require('csv-parser');

const results = [];

fs.createReadStream('../../02._data_formats/sample.csv')
    .pipe(csv())
    .on('data', (data) => {
        results.push(data);
    })
    .on('end', () => {
        console.log(results);
    });
    
