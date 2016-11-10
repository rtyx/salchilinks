const parser = require("ogp-parser");

function parseUrl(url) {
    return parser(url, true).then(function(data) {
        console.log("Parsing url...");
        console.log("Parsed!");
        return {
            title: data.ogp['og:title'][0],
            description: data.ogp['og:description'][0],
            image: data.ogp['og:image'][0]
        };
    });
}

module.exports.parseUrl = parseUrl;
