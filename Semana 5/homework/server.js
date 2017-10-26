var http = require('http');
var fs = require('fs');

http.createServer(function (req,res) {
    fs.readFile('website/doc'+ req.url.substring(1) +'.html',function (err,data) {
        if(!err){
            res.writeHead(200,{'Content-type' : 'text/html'}); //Cabeçalho da resposta
            res.write(data);
            res.end(); //Termina a resposta, convém colocar
        } else {
            res.writeHead(200,{'Content-type' : 'text/plain'}); //Cabeçalho da resposta
            res.end('Erro na leitura de ficheiro');
        }
    });
}).listen(7777);