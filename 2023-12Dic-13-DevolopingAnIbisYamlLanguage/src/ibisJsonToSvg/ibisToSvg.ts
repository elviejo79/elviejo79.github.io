#!/usr/bin/env node

import * as fs from 'fs';
import * as vis from 'vis-network';
const saveSvgAsPng = require('save-svg-as-png');

// Check if a JSON file path is provided as a command-line argument
if (process.argv.length !== 3) {
  console.error('Usage: node mapToSVG.ts <input.json>');
  process.exit(1);
}

const inputJsonPath = process.argv[2];

// Read the JSON file
fs.readFile(inputJsonPath, 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading JSON file:', err);
    process.exit(1);
  }

  try {
    const jsonData = JSON.parse(data);

    // Create a network visualization using vis.js
    const container = document.createElement('div');
    document.body.appendChild(container);

    const nodes = new vis.DataSet(jsonData.nodes);
    const edges = new vis.DataSet(jsonData.edges);

    const visData = {
      nodes: nodes,
      edges: edges,
    };

    const options = {
      // Configure your visualization options here
    };

    const network = new vis.Network(container, visData, options);

    // Convert the visualization to SVG
    const svgElement = container.querySelector('svg');

    // Save the SVG as a file
    saveSvgAsPng.saveSvgAsPng(svgElement, 'output.svg', {}, () => {
      console.log('SVG file saved as output.svg');
      process.exit(0);
    });
  } catch (jsonError) {
    console.error('Error parsing JSON:', jsonError);
    process.exit(1);
  }
});
