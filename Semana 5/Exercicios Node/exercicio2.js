var http = require('http');


http.createServer(function (req, res) {
    res.writeHead(200,{'Content-Type': 'text/html; charset=utf-8'});
    if(req.url === '/addUser'){
        res.write('<p> Isto é para adicionar um utilizador </p>')
    }
    else{
        res.write('<p> Vou fazer outra coisas </p>');
    }
    res.write(req.url); //http://localhost:7777/addUser outputs /addUser
    res.end();

}).listen(7777);