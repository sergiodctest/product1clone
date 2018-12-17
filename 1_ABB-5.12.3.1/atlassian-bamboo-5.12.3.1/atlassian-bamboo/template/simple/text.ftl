<input type="text"[#rt/]
 name="${parameters.name?default("")?html}"[#rt/]
[#if parameters.get("size")?exists]
 size="${parameters.get("size")?html}"[#rt/]
[/#if]
[#if parameters.maxlength?exists]
 maxlength="${parameters.maxlength?html}"[#rt/]
[/#if]
[#if parameters.nameValue?exists]
 value="[@ww.property value="parameters.nameValue"/]"[#rt/]
[/#if]
[#if parameters.disabled?default(false)]
 disabled="disabled"[#rt/]
[/#if]
[#if parameters.readonly?exists]
 readonly="readonly"[#rt/]
[/#if]
[#if parameters.tabindex?exists]
 tabindex="${parameters.tabindex?html}"[#rt/]
[/#if]
[#if parameters.id?exists]
 id="${parameters.id?html}"[#rt/]
[/#if]
[#-- CSS Class--]
 class="[#rt/]
[#if cssClass?exists]
    ${cssClass?html} [#t]
[#elseif parameters.cssClass?exists]
    ${parameters.cssClass?html} [#t]
[#else]
    textField [#t]
[/#if]
[#if fieldErrors[parameters.name]?has_content]
    errorField [#t]
[/#if]
[#if parameters.fullWidthField!false]
    full-width-field [#t]
[#elseif parameters.longField!false]
    long-field [#t]
[#elseif parameters.mediumField!false]
    medium-field [#t]
[#elseif parameters.shortField!false]
    short-field [#t]
[/#if]
"[#t]
[#-- END CSS Class --]
[#if parameters.cssStyle?exists]
 style="${parameters.cssStyle?html}"[#rt/]
[/#if]
[#if parameters.title?exists]
 title="${parameters.title?html}"[#rt/]
[/#if]
[#if parameters.placeholderKey??]
 placeholder="[@ww.text name=parameters.placeholderKey /]"[#rt/]
[/#if]
[#if parameters.autocomplete??]
 autocomplete="${parameters.autocomplete?html}"[#rt/]
[/#if]
[#if parameters.autofocus?? && parameters.autofocus == true]
 autofocus[#rt/]
[/#if]
[#if parameters.dataAttributes?has_content]
[#list parameters.dataAttributes?keys as dataAttribute]
 data-${dataAttribute}="${parameters.dataAttributes[dataAttribute]?string}"[#rt/]
[/#list]
[/#if]
[#include "/${parameters.templateDir}/simple/scripting-events.ftl" /]
/>
