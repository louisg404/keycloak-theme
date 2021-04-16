<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        <h1 id="kc-page-title">Se connecter</h1>
    </#if>
    <#if section = "background">
        <img src="${url.resourcesPath}/img/bg-login.png" class="${properties.kcBackgroundImageClass!}" />

    <#elseif section = "form-intro">
        <div class="popin-authentification">
            <p class="popin-title">${msg("popinTitle")}</p>
            <p>${msg("popinMessage")} <a>${msg("popinClick")}</a></p>
            <div class="popin-submit">
                <input type="submit" id="popin-btn" class="${properties.kcButtonClass!}" value="OK"/>
            </div>
        </div>
        
        <div class="${properties.kcTitreContainerClass!}">
            <img src="${url.resourcesPath}/img/3-barres.svg" class="${properties.kcTitreImageClass!}" />
            <h1 class="${properties.kcTitreClass!}">${msg("doLogIn")}</h1>
        </div>
        <div class="${properties.kcDisclaimerContainerClass!}">
            <p class="${properties.kcDisclaimerClass!}">${msg("loginDisclaimer")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
        <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" placeholder="${msg('username')}"  type="text" autofocus autocomplete="username" required />
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <input tabindex="2" id="password" class="${properties.kcInputPasswordClass!}" placeholder="${msg('password')}" name="password" type="password" autocomplete="password" required />
                        <span class="unmask"></span>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                        <#else>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                        </#if>
                                    </label> 
                                </div>
                            </#if>
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <#if realm.resetPasswordAllowed>
                                <div><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></div>
                            </#if>
                        </div>
        
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                    </div>
                </form>
            </#if>
            </div>
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                    <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                        <#list social.providers as p>
                            <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
            ${msg("noAccount")}
                <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
            </div>
        </#if>
    </#if>



</@layout.registrationLayout>
