var mydata = '{"a":77, "b":123}';

var myobj = JSON.parse(mydata);

//myobj.c // myobj['c']
myobj.c = myobj.a + myobj.b;

    console.log(JSON.stringify(myobj));