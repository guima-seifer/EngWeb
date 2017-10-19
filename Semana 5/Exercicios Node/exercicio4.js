var http = require('http');
var url = require('url');


http.createServer(function (req, res) {
    res.writeHead(200,{'Content-Type': 'text/html; charset=utf-8'});
    //http://localhost:7777/addUser?op1=15&op2=23
    var q = url.parse(req.url, true).query;//resultado de fazer patsing do url do que que queremos parte da query
    var r = parseInt(q.a,10) - parseInt(q.b, 10); //a query "q" é um objeto onde para se aceder é utilizado um ponto
    var txt = q.a + " - " + q.b + " = " + r;
    res.end(txt);

}).listen(7778);