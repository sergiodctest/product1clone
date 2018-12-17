    [#if ctx?? && ctx.pluggableFooter??]
        ${ctx.pluggableFooter.getHtml(req)}
    [#else]
        [#assign bambooLicenseManager = ctx.bambooLicenseManager]
        [#assign licenseMessage]
            [#if !bambooLicenseManager??]
            [#elseif !bambooLicenseManager.license??]
                [@ww.text name="license.footer.missing"]
                    [@ww.param]${buildUtils.getCurrentVersion()}[/@ww.param]
                    [@ww.param]${buildUtils.getCurrentBuildNumber()}[/@ww.param]
                    [@ww.param]${buildUtils.getCurrentEdition()}[/@ww.param]
                    [@ww.param]${ctx.bootstrapManager.serverID}[/@ww.param]
                [/@ww.text]
            [#elseif bambooLicenseManager.license.expired]
                [@ww.text name="license.footer.expired"]
                    [@ww.param]${buildUtils.getCurrentVersion()}[/@ww.param]
                    [@ww.param]${buildUtils.getCurrentBuildNumber()}[/@ww.param]
                    [@ww.param]${buildUtils.getCurrentEdition()}[/@ww.param]
                    [@ww.param]${ctx.bootstrapManager.serverID}[/@ww.param]
                [/@ww.text]
            [#elseif bambooLicenseManager.evaluation]
                [@ww.text name="license.footer.evaluation"]
                    [@ww.param]${buildUtils.getCurrentVersion()}[/@ww.param]
                    [@ww.param]${buildUtils.getCurrentBuildNumber()}[/@ww.param]
                    [@ww.param]${buildUtils.getCurrentEdition()}[/@ww.param]
                    [@ww.param]${ctx.bootstrapManager.serverID}[/@ww.param]
                [/@ww.text]
            [#elseif bambooLicenseManager.demonstration]
                [@ww.text name="license.footer.demonstration"]
                    [@ww.param]${ctx.bootstrapManager.serverID}[/@ww.param]
                [/@ww.text]
            [#elseif bambooLicenseManager.developer]
                [@ww.text name="license.footer.developer" /]
            [#elseif bambooLicenseManager.community]
                [@ww.text name="license.footer.community"]
                    [@ww.param]${bambooLicenseManager.license.organisation.name!}[/@ww.param]
                    [@ww.param]${ctx.bootstrapManager.serverID}[/@ww.param]
                [/@ww.text]
            [#elseif bambooLicenseManager.openSource]
                [@ww.text name="license.footer.openSource"]
                    [@ww.param]${bambooLicenseManager.license.organisation.name!}[/@ww.param]
                    [@ww.param]${ctx.bootstrapManager.serverID}[/@ww.param]
                [/@ww.text]
            [#else]
                [#assign remainingJobs = ctx.remainingJobsLimit]
                [#if remainingJobs != -1]
                    [@ww.text name="license.footer.starter"]
                        [@ww.param]${ctx.bootstrapManager.serverID}[/@ww.param]
                        [@ww.param]${remainingJobs}[/@ww.param]
                    [/@ww.text]
                [/#if]
            [/#if]
        [/#assign]
        <footer id="footer" role="contentinfo"[#if licenseMessage?has_content] class="has-notifications"[/#if]>
            [#if licenseMessage?has_content]
                <section class="notifications">
                    [@ui.messageBox type="warning" id="license-message" title=licenseMessage /]
                </section>
            [/#if]
            <div class="footer-body">
                <p><a href="http://www.atlassian.com/software/bamboo/">Continuous integration</a> powered by <a href="http://www.atlassian.com/software/bamboo/">Atlassian Bamboo</a> version ${buildUtils.getCurrentVersion()} build ${buildUtils.getCurrentBuildNumber()} - [@ui.time datetime=buildUtils.getCurrentBuildDate()]${buildUtils.getCurrentBuildDate()?date?string("dd MMM yy")}[/@ui.time]
                    [#if buildUtils.isDevMode()]
                        (DevMode Enabled)
                    [/#if]
                </p>
                <ul>
                    <li><a href="https://support.atlassian.com/secure/CreateIssue.jspa?pid=10060&amp;issuetype=1">Report a problem</a></li>[#rt]
                    <li><a href="http://jira.atlassian.com/secure/CreateIssue.jspa?pid=11011&amp;issuetype=4">Request a feature</a></li>[#t]
                    <li><a href="http://www.atlassian.com/about/contact.jsp">Contact Atlassian</a></li>[#t]
                    <li><a href="${req.contextPath}/viewAdministrators.action">Contact Administrators</a></li>[#lt]
                </ul>
                <div id="footer-logo"><a href="http://www.atlassian.com/">Atlassian</a></div>
            </div> <!-- END .footer-body -->
        </footer> <!-- END #footer -->
    [/#if]
    </div> <!-- END #page -->
    </body>
</html>