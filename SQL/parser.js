const parser = require("ogp-parser");

function parseUrl(url) {
    return parser(url, true).then(function(data) {
        console.log("Parsing url...");
        console.log("Parsed!");
        return {
            title: data.ogp['og:title'][0] || null,
            description: data.ogp['og:description'][0] || null,
            image: data.ogp['og:image'][0] || null
        };
    });
}

module.exports.parseUrl = parseUrl;
