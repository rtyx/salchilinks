var parser = require("ogp-parser");
var url = "https://github.com/spicedacademy/fullstackcohort2/tree/master/penultimate_project";
parser(url, true).then(function(data) {
    console.log(data.ogp['og:title'] || null);
    console.log(data.ogp['og:description'] || null);
    console.log(data.ogp['og:image'] || "placeholder.jpg");
}).catch(function(error) {
    console.error(error);
});
