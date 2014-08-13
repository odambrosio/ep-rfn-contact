<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<jcr:nodeProperty node="${currentNode}" name="contactEmail" var="contactEmail"/>
<jcr:nodeProperty node="${currentNode}" name="contactComment" var="contactComment"/>
<jcr:nodeProperty node="${currentNode}" name="contactName" var="contactName"/>
<jcr:nodeProperty node="${currentNode}" name="contactUrl" var="contactUrl"/>
<jcr:nodeProperty node="${currentNode}" name="contactFunction" var="contactFunction"/>

<!-- TODO : Si editMode, afficher numéros dans les tags #...# -->
<c:if test="${renderContext.editMode}">
  <div class="">
    #CONTACT_INLINE_# / #CONTACT_FULL_#
  </div>
</c:if>

<ul>
  <li>
    <div>
      <!-- NOM -->
      <!-- TODO : Traitement à revoir pour générer une URL -->
      <c:if test="${not empty contactName}">
        <c:if test="${not empty contactUrl}">
          <c:url var="contactUrl" value="${contactUrl}" />
          <a title="${contactName.string}" href="${contactUrl}">
            ${contactName.string}
          </a>
        </c:if>
        <c:if test="${empty contactUrl}">
          ${contactName.string}
        </c:if>
      </c:if>
    </div>
    <!-- FONCTION -->
    <c:if test="${not empty contactFunction}">
      <div class="function">
        ${contactFunction.string}
      </div>
    </c:if>
    <!-- IDENTIFIANT EPDIR (uniquement en édition)-->
    <c:if test="${renderContext.editMode}">
      <c:if test="${not empty contactUrl}">
        <fmt:message key="label.idEpdir"/> : ${contactUrl.string}
      </c:if>
	</c:if>
    <!-- EMAIL -->
    <c:if test="${not empty contactEmail}">
      <div>
        <a class="mail" title="link e-mail" target="_self" href="mailto:${contactEmail.string}">
          ${contactEmail.string}
        </a>
      </div>
    </c:if>
    <!-- COMMENTAIRE -->
    <c:if test="${not empty contactComment}">
      <div class="comment">
        ${contactComment.string}
      </div>
    </c:if>
  </li>
</ul>