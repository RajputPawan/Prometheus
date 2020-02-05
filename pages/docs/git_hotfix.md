---
title: Hotfix Git Workflow Saltmigration
permalink: git_hotfix_workflow.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: Feburary 4, 2020
toc: true
folder: docs
---

<html>
<head>
  <!-- Load the JS file -->
  <script src="js/gitgraph.js"></script>
</head>
<body>
  <div id="graph-container"></div>

  <script>
    const graphContainer = document.getElementById("graph-container");

    // Add Options
    // const options = {
    //  orientation: "horizontal"
    // }
    // const gitgraph = GitgraphJS.createGitgraph(graphContainer, options);
    
    const gitgraph = GitgraphJS.createGitgraph(graphContainer);

    // Simulate git commands with Gitgraph API.
    const master = gitgraph.branch("master");
    master.commit("Initial commit").tag("v1.0.0");

    const integration = gitgraph.branch("integration");
    integration.commit("Add Feature");

    const hotfix = gitgraph.branch("Hotfix");
    hotfix
      .commit("remove faulty package")
      .commit("adjust breaking config");

    integration.merge(hotfix);
    master.merge(integration);
    integration.commit("Another feature");

    // master.merge(integration).tag("v1.0.1");
    

    
  </script>

</body>
</html>