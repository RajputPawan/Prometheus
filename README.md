## Welcome to the Mercedes-Benz Ubuntu RD Desktop User Documentation!

### First Steps
1. clone repo `git clone https://git.daimler.com/ubunturd/ubuntudoc.git`
2. Docker container for local testing `docker run xyz`
3. Documentation and HowTos in `pages/docs/` directory
4. News and announcements in `_posts/` directory

### Create documentation pages
1. Copy/duplicate existing page from `pages/docs/` directory
2. Change frontmatter block on top of the page with general information
```YAML
---
title: General Computer Setup 
permalink: generalsetup.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: January 21, 2020
toc: true
folder: docs
---
```
3. Add your page to `_data/sidebars/default_sidebar.yml`. <br>Append to:
```YAML
- title: Documentation
    output: web, pdf
    folderitems:

    - title: General Computer Setup
      url: /generalsetup.html
      output: web, pdf
```
4. Add your page to `_data/topnav.yml`. <br>Append to:
```YAML
topnav_dropdowns:
- title: Topnav dropdowns
  folders:
    - title: Documentation
      folderitems:
        - title: General Setup
          url: /generalsetup.html
        - title: MAC address passthrough
          url: /macaddress_passthrough.html
```

### Create news pages
1. Copy/duplicate existing entry from `_posts/` directory
2. Pay attention to the name of the entry `2020-01-17-sample-post.md`
3. Add content:
```YAML
---
title:  "KISS principle"
published: true
permalink: samplepost.html
summary: "This is some summary frontmatter for my sample post."
tags: [news, getting_started]
---

KISS, an acronym for "keep it simple, stupid" or "keep it stupid simple", is a design principle noted by the U.S. Navy in 1960.

## Heading

The KISS principle states that most systems work best if they are kept simple rather than made complicated
```

### Add FAQ section
1. Edit `faq.md` in `pages/faq/` directory
2. Add content before the last closing `</div>` tag
```YAML
<!-- /.panel -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h4 class="panel-title">
      <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" 
      href="#collapseFive">Question?</a>
    </h4>
  </div>
    <div id="collapseFive" class="panel-collapse collapse">
      <div class="panel-body">
        Answer.
      </div>
    </div>
  </div>
<!-- /.panel -->
```


