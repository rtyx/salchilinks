var parser = require("ogp-parser");
var url = "http://internacional.elpais.com/internacional/2016/11/09/estados_unidos/1478647677_279555.html";
parser(url, true).then(function(data) {
    console.log(data.ogp['og:title']);
    console.log(data.ogp['og:description']);
    console.log(data.ogp['og:image']);
}).catch(function(error) {
    console.error(error);
});
