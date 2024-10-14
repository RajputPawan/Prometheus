---
title: FAQ
permalink: faq.html
sidebar: default_sidebar
keywords: frequently asked questions, FAQ, question and answer, collapsible sections, expand, collapse
tags: [docs]
last_updated: January 24, 2020
toc: false
folder: mydoc
---

<div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Can I also log in with my EMEA / APAC / AMERICAS user-id?</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse noCrossRef">
                            <div class="panel-body">
                                Yes, all Daimler domains can be used to authenticate users. You don't need to add anything to your ID.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">How are updates installed / deployed to my system?</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse noCrossRef">
                            <div class="panel-body">
                                Ubuntu repositories are synced once per month with upstream Ubuntu. This happens on the last Monday of a month. These updates are immediately pushed to a group of testers and friendly users. As long as the testing group does not complain about any problems the updates are pushed to all other clients on first monday of the next month.<br/> If you need updates more often you can request to include your system into the daily group wich receives updates once a day. But beware: this is not supported. If you face any issues you're on your own fixing this.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Antivirus? I thought there are no viruses on Linux.</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                You're right, there are very few viruses on Linux. Nevertheless this is a requirement of IT Security guidelines and the main goal of having Antivirus on Linux is preventing the spreading of malicious data to Windows computers.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Why can't I access my other computer via ssh when I'm connected to AlwaysOn?</a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                SSH from AlwaysOn is blocked. This is necessary because all "AlwaysOn Clients" woldwide connect to the same security zone. Nobody can tell if this is a RD client or not. Therefore RD-Networks are not reachable directly. You can access RD resources through the proxies or when you connect your computer with the tokenbased VPN.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">The answer to life the universe and everything?</a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse noCrossRef">
                            <div class="panel-body">
                                42
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">Can I have admin / sudo on my system?</a>
                            </h4>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse">
                            <div class="panel-body">
                                Yes. Just request it in IT-Shop. <a href="local_admin_rights.html">HowTo Request</a>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
</div>
<!-- /.panel-group -->

{% include links.html %}
