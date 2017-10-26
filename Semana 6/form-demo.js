//url, method e query
//o Json é uma string
// JO <--  JSON.stringify()-- JSON
// JO --  JSON.parse()-- JSON

//se o method do formulario for post, é necessário fazer parsing para ir buscar a informação ao body da mensagem, com GET vai no URL.
//Versão para method GET
var http = require('http');
var url = require('url');
var fs = require('fs');


var myServer = http.createServer(function (req, res) {

    if (req.method === "GET"){
        if (req.url === "/registo"){
            fs.readFile("form.html", function (err, data) {
                if(!err){
                    res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
                    res.write(data);
                    res.end();
                }
                else {
                    res.writeHead(404, {'Content-Type':'text/html; charset=utf-8'});
                    res.end('form.html não encontrado');
                }
            });
        }
        else if (req.url.startsWith("/processaForm")){
            res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
            res.write('<h1> Informação Recebida </h1>');
            res.write('<p>' + JSON.stringify(url.parse(req.url, true).query));
        }
        else {
            res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
            res.write('<p>' +  "Pedido não suportado: " + req.url + '</p>');
        }
    }
    else{
        res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
        res.write('<p>' +  "Pedido não suportado: " + req.method + '</p>');
    }
});

myServer.listen(7777);
console.log('Servidor à escuta na porta 7777...');