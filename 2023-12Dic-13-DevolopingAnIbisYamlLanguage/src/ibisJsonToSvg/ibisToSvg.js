#!/usr/bin/env node
"use strict";
exports.__esModule = true;
var fs = require("fs");
var vis = require("vis");
var saveSvgAsPng = require("save-svg-as-png");
// Check if a JSON file path is provided as a command-line argument
if (process.argv.length !== 3) {
    console.error('Usage: node mapToSVG.ts <input.json>');
    process.exit(1);
}
var inputJsonPath = process.argv[2];
// Read the JSON file
fs.readFile(inputJsonPath, 'utf8', function (err, data) {
    if (err) {
        console.error('Error reading JSON file:', err);
        process.exit(1);
    }
    try {
        var jsonData = JSON.parse(data);
        // Create a network visualization using vis.js
        var container = document.createElement('div');
        document.body.appendChild(container);
        var nodes = new vis.DataSet(jsonData.nodes);
        var edges = new vis.DataSet(jsonData.edges);
        var visData = {
            nodes: nodes,
            edges: edges
        };
        var options = {
        // Configure your visualization options here
        };
        var network = new vis.Network(container, visData, options);
        // Convert the visualization to SVG
        var svgElement = container.querySelector('svg');
        // Save the SVG as a file
        saveSvgAsPng.saveSvgAsPng(svgElement, 'output.svg', {}, function () {
            console.log('SVG file saved as output.svg');
            process.exit(0);
        });
    }
    catch (jsonError) {
        console.error('Error parsing JSON:', jsonError);
        process.exit(1);
    }
});
