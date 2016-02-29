<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <spring:url value="/resources/css/metro.css" var="metroCss" />
  <spring:url value="/resources/css/metro-icons.css" var="metroIcons" />
  <spring:url value="/resources/css/metro-responsive.css" var="metroResp" />
  <spring:url value="/resources/css/metro-schemes.css" var="metroSchemes" />
  <spring:url value="/resources/js/jquery-2.2.1.min.js" var="jqueryJs" />
  <spring:url value="/resources/js/metro.min.js" var="metroJs" />

  <link href="${metroCss}" rel="stylesheet" />
  <link href="${metroIcons}" rel="stylesheet" />
  <link href="${metroResp}" rel="stylesheet" />
  <link href="${metroSchemes}" rel="stylesheet" />

  <script src="${jqueryJs}"></script>
  <script src="${metroJs}"></script>

  <title><spring:message code="mail.pageTitle"/> </title>
</head>

<body>
  <div class="container page-content">
    <div class="example">
      <div class="panel">
        <div class="heading">
          <span class="icon mif-mail"></span>
          <span class="title"><spring:message code="mail.label.welcomeMessage"/></span>
        </div>
        <div class="content">
          <form:form method="POST"  modelAttribute="email">
            <div class="grid bg-white">
            <div class="row">
              <div class="cell">
                <label><spring:message code="mail.input.label.sender"/></label>
                <div class="bg-white fg-red align-left"><form:errors path="sender"/></div>
                <spring:bind path="sender">
                  <div class="input-control text full-size ${status.error ? 'error' : ''}">
                    <form:input path="sender" />
                  </div>
                </spring:bind>
              </div>
            </div>
            <div class="row">
              <div class="cell">
                <label><spring:message code="mail.input.label.recipient"/></label>
                <div class="bg-white fg-red align-left"><form:errors path="recipient"/></div>
                <spring:bind path="recipient">
                  <div class="input-control text full-size">
                    <form:input path="recipient" />
                  </div>
                </spring:bind>
              </div>
            </div>
            <div class="row">
              <div class="cell">
                <label><spring:message code="mail.input.label.subject"/></label>
                <div class="bg-white fg-red align-left"><form:errors path="subject"/></div>
                <spring:bind path="subject">
                  <div class="input-control text full-size">
                    <form:input path="subject" />
                  </div>
                </spring:bind>
              </div>
            </div>
            <div class="row">
              <div class="cell">
                <label><spring:message code="mail.input.label.body"/></label>
                <div class="bg-white fg-red align-left"><form:errors path="body"/></div>
                  <spring:bind path="body">
                    <div class="input-control textarea full-size"
                         data-role="input" data-text-auto-resize="true">
                      <form:textarea path="body"/>
                    </div>
                  </spring:bind>
              </div>
            </div>
            <div class="row">
              <div class="cell">
                <button class="button fg-white bg-green" value="submit" name="button"><span class="mif-checkmark"></span> <spring:message code="mail.input.button.send"/> </button>
                <button type="button" class="button fg-white bg-red align-left" onclick="document.location.href='/'" value="cancel" name="button"><span class="mif-cancel"></span> <spring:message code="mail.input.button.cancel"/></button>
              </div>
            </div>
           </div>
          </form:form>
        </div>
      </div>
    </div>
  </div>

</body>
</html>