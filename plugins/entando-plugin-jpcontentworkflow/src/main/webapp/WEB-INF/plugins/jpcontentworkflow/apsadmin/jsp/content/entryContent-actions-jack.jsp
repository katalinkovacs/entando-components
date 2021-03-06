<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="wpcw" uri="/jpcontentworkflow-apsadmin-core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>

<div class="row mb-10 bottom-border">
    <div class="col-xs-12 mb-10">
        <span class="bold">
            <s:text name="note.autosaved.at" />: <span data-autosave="last-save-time"></span>
        </span>
    </div>
</div>

<!-- toolbar first row  -->
<div class="toolbar-pf-actions">
    <!-- items selected -->
    <div class="col-lg-6 col-md-6 col-xs-12 no-padding">
        <div class="col-xs-12 no-padding">
            <span class="mr-20 bold"><s:text name="label.state" /></span>
            <wpsf:select name="status" id="status" list="avalaibleStatus"
                         headerKey="" headerValue="%{getText('note.choose')}"
                         value="%{content.status}" listKey="key"
                         listValue="%{getText(value)}"
                         cssClass="form-control selectCustom display-inline wauto"/>
        </div>
    </div>

    <!-- toolbar -->
    <div class="col-lg-6 col-md-6 col-xs-12 no-padding text-right">
        
        <!-- Workflow prev/next step buttons -->
        <wpcw:contentStep nextStep="false" var="previousStepVar" />
        <wpcw:contentStep nextStep="true" var="nextStepVar" />
        <s:set var="buttonsNumberVar" value="%{0}" />
    
        <s:if test="%{#previousStepVar != null}">
            <wpsf:submit
                type="button"
                cssClass="btn btn-default wauto display-inline"
                action="previousStep"
                title="%{getText('note.button.previousStep')}">
                <span class="icon fa fa-long-arrow-left"></span>&#32;
                <s:property value="%{getText('label.previousStep')}" />
            </wpsf:submit>
        </s:if>
        
        <s:if test="%{#nextStepVar != null}">
            <wpsf:submit
                action="nextStep"
                type="button"
                cssClass="btn btn-default btn-block wauto display-inline"
                title="%{getText('note.button.nextStep')}">
                <span class="icon fa fa-long-arrow-right"></span>
                <s:property value="%{getText('label.nextStep')}" />
            </wpsf:submit>
        </s:if>
    
        <wpsf:submit action="save" type="button" cssClass="btn btn-primary wauto display-inline ml-20"
                     title="%{getText('note.button.saveContent')}">
            <s:text name="label.save" />
        </wpsf:submit>
    </div>
</div>


<!-- toolbar second row -->
<div class="row toolbar-pf-results">
    <div class="col-lg-6 col-lg-offset-6 col-md-8 col-md-offset-4 col-xs-12 no-padding">
        <div class="col-xs-12 text-right">
            <span class="mr-20 bold"><s:text name="label.setAs" /></span>
            <wpsf:submit id="edit-saveAndContinue" data-button-type="autosave"
                         data-loading-text="%{getText('label.autosaving.button.text')}"
                         action="saveAndContinue" type="button" cssClass="btn btn-default"
                         title="%{getText('note.button.saveAndContinue')}">
                <s:text name="label.saveAndContinue" />
            </wpsf:submit>
            
            <s:set var="currentStatusVar" value="content.status" />
            <wp:ifauthorized permission="validateContents">
                <s:if test="%{#nextStepVar == null || #currentStatusVar.equals('READY')}">
                    <wpsf:submit action="saveAndApprove" type="button"
                                 cssClass="btn btn-success"
                                 title="%{getText('note.button.saveAndApprove')}" >
                        <s:text name="label.saveAndApprove" />
                    </wpsf:submit>
                </s:if>
                <s:if test="content.onLine">
                    <wpsf:submit action="suspend" type="button"
                                 cssClass="btn btn-warning"
                                 title="%{getText('note.button.suspend')}">
                        <span class="icon fa fa-pause"></span>&#32;
                        <s:text name="label.suspend" />
                    </wpsf:submit>
                </s:if>
            </wp:ifauthorized>
            <s:url action="list" namespace="/do/jacms/Content" var="backAction"/>
            <a class="btn btn-danger ml-20" href="${backAction}">
                <s:text name="label.cancel" />
            </a>
        </div>
    </div>
</div>
