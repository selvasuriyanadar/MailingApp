<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/includes/header.html" />

<h1>Thanks for joining our email list</h1>

<p>Here is the information that you entered:</p>

<label>Email:</label>
<span><c:out value="${user.email}" /></span><br>
<label>First Name:</label>
<span><c:out value="${user.firstName}" /></span><br>
<label>Last Name:</label>
<span><c:out value="${user.lastName}" /></span><br>

<p>Here is the information that you entered (from session):</p>

<jsp:useBean id="user" scope="session" class="murach.business.User" />
<label>Email:</label>
<span><jsp:getProperty name="user" property="email" /></span><br>
<label>First Name:</label>
<span><jsp:getProperty name="user" property="firstName" /></span><br>
<label>Last Name:</label>
<span><jsp:getProperty name="user" property="lastName" /></span><br>

<p>To enter another email address, click on the Back 
button in your browser or the Return button shown 
below.</p>

<form action="emailList" method="post">
    <input type="hidden" name="action" value="join">
    <input type="submit" value="Return">
</form>

<table>
  <tr>
    <th>Name</th>
    <th>Value</th>
  </tr>
  <c:forEach var="cook" items="${cookie}">
  <tr>
    <td><c:out value="${cook.value.name}" /></td>
    <td><c:out value="${cook.value.value}" /></td>
  </tr>
  </c:forEach>
</table>

<c:import url="/includes/footer.jsp" />
