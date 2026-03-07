#!/usr/bin/env node

const fs = require('fs');
const puppeteer = require('puppeteer');
const path = require('path');

const args = process.argv.slice(2);

if (args.length !== 1) {
    console.error('Usage: node graph-to-svg.js <path-to-json>');
    process.exit(1);
}

const jsonFilePath = args[0];
const jsonGraph = JSON.parse(fs.readFileSync(jsonFilePath, 'utf8'));

// Extracting base file name and changing extension to .png
const outputFilePath = path.join(
    path.dirname(jsonFilePath),
    path.basename(jsonFilePath, path.extname(jsonFilePath)) + '.png'
);

const visNetworkHtml = `
<!DOCTYPE html>
<html>
<head>
  <title>Vis.js Network</title>
  <script type="text/javascript" src="https://unpkg.com/vis-network/standalone/umd/vis-network.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>



    <link
      rel="stylesheet"
      href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
    />


</head>
<body>
  <div id="network" style="width: 800px; height: 600px;"></div>
  <script type="text/javascript">
    var container = document.getElementById('network');
    var data = ${JSON.stringify(jsonGraph)};
    const options = {
          nodes: {
            borderWidth: 4,
            size: 30,
            color: {
              border: "#222222",
              background: "#666666",
            },
            font: { color: "#000000" },
          },
          edges: {
            color: "lightgray",
          },
          groups: {
            Question: {
              shape: "icon",
              icon: {
                face: "fontawesome",
                code: "\u003f",
                size: 40,
                color: "#E48900",
              },
            },
            Ideas: {
              shape: "icon",
              icon: {
                face: "'Ionicons'",
                code: "\uDDE8",
                size: 50,
                color: "#57169a",
              },
            },
            pros: {
              shape: "icon",
              icon: {
                face: "fontawesome",
                code: "\u002b",
                size: 40,
                color: "#9EDE73",
              },
            },
            cons: {
              shape: "icon",
              icon: {
                face: "fontawesome",
                code: "\uf068",
                size: 40,
                color: "#BE0000",
              },
            },
          },
          layout: {
            hierarchical: {
              direction: "LR",
            },
          },
        };

    var network = new vis.Network(container, data, options);
  </script>
</body>
</html>
`;

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.setContent(visNetworkHtml);

  await page.waitForSelector('#network', { visible: true });
  await page.setViewport({ width: 800, height: 600 });

  await page.screenshot({ path: outputFilePath });
  await browser.close();

  console.log(`Diagram saved as ${outputFilePath}`);
})();
