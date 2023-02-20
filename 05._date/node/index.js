const date = new Date();
console.log(date);

console.log(Date());

//get date as a unix timestamp
console.log(new Date().getTime());


//region specifik date
console.log("====Region specifik ====");
console.log(new Intl.DateTimeFormat('en-US').format(date));
console.log(new Intl.DateTimeFormat('da-Dk').format(date));