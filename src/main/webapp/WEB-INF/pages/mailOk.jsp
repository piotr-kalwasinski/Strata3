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
          <div class="margin60 bg-green fg-white align-center"><spring:message code="mail.label.emailSent"/> </div>
        </div>
    </div>
  </div>
</div>

</body>
</html>