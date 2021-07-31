const express=require('express');
const app=express();
const googleTrends = require('google-trends-api');
const fs = require('fs');
const path = require('path');

var ans;



googleTrends.dailyTrends({
    geo: 'US',
}).then(function(results){

    ans=JSON.parse(results);
    fs.writeFileSync(path.resolve(__dirname, 'results.json'), JSON.stringify(ans));
    console.log(ans);
    let len=Math.min(10,ans['default']['trendingSearchesDays'][0]['trendingSearches'].length);
    for (let i = 0; i < len; i++) {
        console.log(ans['default']['trendingSearchesDays'][0]['trendingSearches'][i]['title']['query']);
      }
    
  })
  .catch(function(err){
    console.error('Could not fetch the desired data.', err);
  });

  

  app.get("/", (req, res) => {
    fs.readFile(__dirname + '/' + 'results.json', 'utf8', (err, data) => {
        res.end(data);
    });
});

  app.listen(3000, () => {
    console.log(`app listening at http://localhost:3000`)
  });