---
title: General Computer Setup 
permalink: git_workflow.html
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

    const gitgraph = GitgraphJS.createGitgraph(graphContainer);

    // Simulate git commands with Gitgraph API.
    const master = gitgraph.branch("master");
    master.commit("Initial commit");

    const develop = gitgraph.branch("develop");
    develop.commit("Add TypeScript");
    develop.commit("Add Test");

    const aFeature = gitgraph.branch("a-feature");
    aFeature
      .commit("Make it work")
      .commit("Make it right")
      .commit("Make it fast");

    develop.merge(aFeature);
    develop.commit("Prepare v1");

    master.merge(develop).tag("v1.0.0");
  </script>
</body>
</html>