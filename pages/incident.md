---
title: "Incident, functionality is broken"
keywords: ubuntu documentation webticket ticket incident
sidebar: default_sidebar
tags: [docs]
permalink: incident.html
---

If you have issues that a functionality does not work as expected or as documented you should create a incident ticket.

Having incident tickets is important as this is one of the main measures for the SLA of the Ubuntu provider. The biggest measure  besides resolution time is the survey and the Customer Satisfaction / Dissatisfaction. So please answer the survey and answer honestly how you feel. (5 Star rating.)

## How to create

You can either use the deeplink and continue with topic "Fill the forms": [ServiceNow Deeplink](https://servicenow.i.mercedes-benz.com/esc?id=sc_cat_item&sys_id=062eec1f1b0c605093b43113dd4bcbf0&sysparm_variables=ewoiY2hvb3NlX2lzc3VlX3JlbGF0ZWQiOiJhcHBsaWNhdGlvbiBzZXJ2aWNlIiwKInVfc2VydmljZV9pbnN0YW5jZSI6IjUyMGE2ZWQ3MWI2MGVjMTAxZGMxYmI3MzliNGJjYjc4Igp9Cg) 

Or open [Daimler Service Now - Service Portal https://servicenow.i.mercedes-benz.com/esc?id=esc_sc_category](https://servicenow.i.mercedes-benz.com/esc?id=esc_sc_category)

### Go to **"Something is broken"**

![Service Portal](images/servicenow/snow_incident_02.png)

### Fill the forms

First select that your issue is about an **Application Service**
![Service Portal](images/servicenow/snow_incident_03-1.png)

Then start typing in the text fields it will start showing suggestions.
Select **Ubuntu Client Operations - Production**

![Service Portal](images/servicenow/snow_incident_03.png)

Select the CI **Ubuntu Client Operations - Production**
![Service Portal](images/servicenow/snow_incident_02-1.png)

### Put in all required data

![Service Portal](images/servicenow/snow_incident_04.png)

On **Impact level & resolve ugency** (6) (7) select at least both Medium or higher or at least one as High as we only have ServiceLevel Monitoring on Prio3 and higher incidents. And P4 are not measured. **Avoid producing incidents with P4. See priority matrix**

Have a look at the incident priority matrix - to see which priority is assigned to your incident.

| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \ &nbsp;&nbsp;impact<br>urgency &nbsp; \  | 1-High  | 2-Medium  | 3-Low  |
|--------------------------------- |-------- |---------- |--------- |
| 1-High                           | **P1**  | **P2**    | **P3**   |
| 2-Medium                         | **P2**  | **P3**    | P4       |
| 3-Low                            | **P3**  | P4        | P4       |

### Not sure what to choose?

If you are not sure what the particular form is about, click on the small **(?)**
![Service Portal](images/servicenow/snow_incident_05.png)

Finally create that incident by pressing **SUBMIT** in the top right corner.
