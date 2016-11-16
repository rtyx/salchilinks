var request = require('request');
const cheerio = require('cheerio');

function parseUrl(url){
    console.log("haaaay");
    return new Promise(function (resolve, reject){
        request = request.defaults({jar: true});
        request(url, function (error, response, html) {
            if (!error && response.statusCode == 200) {
                var $ = cheerio.load(html);
                var og = {
                    url: $('meta[property="og:url"]').attr('content'),
                    image: $('meta[property="og:image"]').attr('content'),
                    description: $('meta[property="og:description"]').attr('content'),
                    title: $('meta[property="og:title"]').attr('content'),
                    siteName: $('meta[property="og:site_name"]').attr('content')
                };
                resolve(og);
            } else {
                reject(error);
            }
        });
    });
}

module.exports.parseUrl = parseUrl;
