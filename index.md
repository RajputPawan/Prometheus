---
title: "Mercedes-Benz Ubuntu RD Desktop User Documentation"
keywords: ubuntu documentation
tags: [home]
sidebar: default_sidebar
permalink: index.html
toc: false
summary: This site holds information that is necessary or helpful for users of the Mercedes-Benz RD Ubuntu Desktop. This documentation is only for the RD Ubuntu client.
---

## Request help

* **[Incident]({{ site.baseurl }}/incident.html)**
  [when something is broken / not working]
* **[Requests]({{ site.baseurl }}/inquiry-help.html)**
  [to request any changes in behaviour / software / users]

## Announcements

{% for post in site.posts limit:3 %}
  > <a href="{{ site.baseurl }}{{ post.url }}">{{ post.date | date_to_long_string }} - {{ post.title }}</a>
  > {{ post.excerpt }}
{% endfor %}

## Introduction

Thank you for visiting Mercedes-Benz RD Ubuntu Desktop User
Documentation. In this documentation pages, besides
**[incidents]({{site.baseurl }}/incident.html)**,
[requests]({{ site.baseurl }}/inquiry-help.html) and a
[FAQ]({{ site.baseurl }}/faq.html), you will find helpful information
and How Tos regarding the Ubuntu Client.

## Support

[![Create Incidient]({{ site.baseurl }}/images/baseline_playlist_add_black_48pt_3x.png)Create INCIDENT - if something is broken.]({{ site.baseurl }}/incident.html)
[![Create Request]({{ site.baseurl
}}/images/baseline_playlist_add_black_48pt_3x.png)Raise Request...]({{
site.baseurl }}/inquiry-help.html)

| What | Where |
|------|---------|
| Service Desk | Provider: Wipro Technologies GmbH <br>Phone: +49 7031 90 89000 |
| On-Site Support | Service Provider: Wipro <br>On-Site Service Request: Please open a ticket and wait for appointment |
| Responsible Department | ITT/XE |
| Contacts | Selim Arslanbek, <selim.arslanbek@mercedes-benz.com>, +49 151 58605238<br>Ralf Lange, <ralf.r.lange@mercedes-benz.com>, +49 151 58605728 |

## Links

* [Social Intranet](https://social.cloud.corpintra.net/groups/ubunturd)
* [Teams Channel](https://teams.microsoft.com/l/team/19%3a5c38f4f2dc2840429e29b64a2eb82aae%40thread.tacv2/conversations?groupId=13fe2da7-5cab-4525-9f67-b54eefb7a8ca&tenantId=9652d7c2-1ccf-4940-8151-4a92bd474ed0)

## Hardware Basket

__(Outdated, we are working on a refresh of the hardware catalog.)__

An overview of Ubuntu Linux certified hardware that can be ordered via ITShop is available [here](https://team.sp.wp.corpintra.net/sites/00401/csm/_layouts/15/WopiFrame2.aspx?sourcedoc=/sites/00401/csm/Warenkorb%20HWDokumente/Hardware-basket%20Ubuntu%20Engineering.pptx&action=default).
[![Create Ticket]({{ site.baseurl }}/images/hw_basket.png)](https://team.sp.wp.corpintra.net/sites/00401/csm/_layouts/15/WopiFrame2.aspx?sourcedoc=/sites/00401/csm/Warenkorb%20HWDokumente/Hardware-basket%20Ubuntu%20Engineering.pptx&action=default)

## Contribute

Feel free to contribute and help getting new documentation pages and How Tos created.

1. Fork on ([Github](https://git.i.mercedes-benz.com/ubunturd/ubuntudoc/)).
2. Create branch in forked repo.
3. Add and commit your changes.
4. Push your changes to your branch.
5. Create Pull Request to branch "gh-pages" in original repo.

{% include links.html %}
