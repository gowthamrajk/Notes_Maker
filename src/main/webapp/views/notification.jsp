<!DOCTYPE html>
<%@page import="com.spring.DomainClass.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<center>
    <c:forEach items="${remainder}" var="note">
			<h1><a
				href="<c:url value='/showNoteDetails/${note.getId()}.do'/>">${note.getNoteName()}</a></h1>
			<p>(${note.getRemainderDate()})</p>
			<hr style="width:320px";>
	</c:forEach>
	</center>
</html>
