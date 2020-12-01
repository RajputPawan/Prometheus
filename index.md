---
title: "Mercedes-Benz Ubuntu RD Desktop User Documentation"
keywords: ubuntu documentation
tags: [home]
sidebar: default_sidebar
permalink: index.html
toc: false
summary: This site holds information that is necessary or helpful for users of the Mercedes-Benz RD Ubuntu Desktop. This documentation is only for the RD Ubuntu client.
---

## Announcements

{% for post in site.posts limit:3 %}
  > <a href="{{ site.baseurl }}{{ post.url }}">{{ post.date | date_to_long_string }} - {{ post.title }}</a>
  > {{ post.excerpt }}
{% endfor %}

## Introduction

Thank you for visiting Mercedes-Benz RD Ubuntu Desktop User Documentation. In this documentation pages, besides [webtickets]({{ site.baseurl }}tickets.html) and a [FAQ]([{{ site.baseurl }}faq.html), you will find helpful information and How Tos regarding the Ubuntu Client.

## Support

[![Create Ticket]({{ site.baseurl }}/images/baseline_playlist_add_black_48pt_3x.png)Raise Ticket...]({{ site.baseurl }}/tickets.html)

| What | Where |
|------|---------|
| Service Desk | Provider: Wipro Technologies GmbH <br>Phone: +49 7031 90 89000 |
| On-Site Support | Service Provider: Wipro <br>On-Site Service Request: Please open a ticket and wait for appointment |
| Responsible Department | ITT/CE <br>Patrick Banholzer, patrick.banholzer@daimler.com, +49 176 30988391<br>Tobias Ferazzi, tobias.ferazzi@daimler.com, +49 176 30986213 |

## Hardware Basket

An overview of Ubuntu Linux certified hardware that can be ordered via ITShop is available [here](https://team.sp.wp.corpintra.net/sites/00401/csm/_layouts/15/WopiFrame2.aspx?sourcedoc=/sites/00401/csm/Warenkorb%20HWDokumente/Hardware-basket%20Ubuntu%20Engineering.pptx&action=default).
[![Create Ticket]({{ site.baseurl }}/images/hw_basket.png)](https://team.sp.wp.corpintra.net/sites/00401/csm/_layouts/15/WopiFrame2.aspx?sourcedoc=/sites/00401/csm/Warenkorb%20HWDokumente/Hardware-basket%20Ubuntu%20Engineering.pptx&action=default)

## Contribute

Feel free to contribute and help getting new documentation pages and How Tos created.

1. Fork on ([Github](https://git.daimler.com/ubunturd/ubuntudoc/)).
2. Create branch in forked repo.
3. Add and commit your changes.
4. Push your changes to your branch.
5. Create Pull Request to branch "gh-pages" in original repo.

{% include links.html %}
