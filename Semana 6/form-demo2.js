//versão para method post


var http = require('http');
var url = require('url');
var fs = require('fs');
var qs = require('querystring');


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
    else if(req.method === "POST"){
        if (req.url.startsWith("/processaForm")){
            var requestBody = '';
            //sempre que hover um estimulo data, processa uma função com esse estimula, concatenado os dados no requestBody
            req.on('data',function (data) {
               requestBody += data;
               if (requestBody.length > 1e7){
                   res.writeHead(413, 'Request Entity Too Large', {'Content-Type':'text/html; charset=utf-8'});
                    // language=HTML
                   res.end('<!doctype html> <html><head><title>413</title></head><body>Error 413 - Request Entity Too Large</body></html> ')
               }
            });
            req.on('end', function () {
                var formData = qs.parse(requestBody);
                res.writeHead(200, {'Content-Type':'application/json; charset=utf-8'});
                res.write(JSON.stringify(formData));
                res.end();
            })
        }
    }
    else{
        res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
        res.write('<p>' +  "Pedido não suportado: " + req.method + '</p>');
    }
});

myServer.listen(7777);
console.log('Servidor à escuta na porta 7777...');