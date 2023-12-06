---
title:  "Evolution login and MFA issue: solution found."
published: true
permalink: 2022-12-06-evolution_oauth2.html
summary: "A workaround for the recent issue regarding PingID login has beed
         rolled out."
tags: [news]
---

As some of users, especially those with new Ubuntu installations have
noticed, in the past weeks, Evolution could not be set up anymore,
because the company login web page in the builtin browser would not
proceed to PingID after entering the password.

This issue has now been resolved by a patch to the evolution package on our
systems, which allows the login to happen in an external browser and the
resulting code to be pasted back into Evolution.

We apologize for the inconvenience. If you were forced to switch to the online
version of Outlook because of this and were missing your favorite email client,
[you may now use evolution again following the updated guide](
/ubunturd/ubuntudoc/evolution.html#oauth2-authorization-via-an-external-browser).
