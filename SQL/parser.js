const parser = require("ogp-parser");

function parseUrl(url) {
    return parser(url, true).then(function(data) {
        console.log("Parsing url...");
        console.log(data);
        if (data.ogp['og:title']) {
            var title = data.ogp['og:title'][0];
        } else {
            title = null;
        }
        if (data.ogp['og:description']) {
            var description = data.ogp['og:description'][0];
        } else {
            description = null;
        }
        if (data.ogp['og:image']) {
            var image = data.ogp['og:image'][0];
        } else {
            image = null;
        }
        console.log(title, description, image);
        return {
            title: title,
            description: description,
            image: image
        };
    });
}

module.exports.parseUrl = parseUrl;
