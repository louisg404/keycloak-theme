<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "background">
        <img src="${url.resourcesPath}/img/bg-aide.png" class="${properties.kcBackgroundImageClass!}" />
    <#elseif section = "form">
        <div id="kc-code">
            <#if code.success>
                <p>${msg("copyCodeInstruction")}</p>
                <input id="code" class="${properties.kcTextareaClass!}" value="${code.code}"/>
            <#else>
                <p id="error">${code.error}</p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
