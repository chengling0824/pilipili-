<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/1
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>【pilipili】${news.title}</title>
    <script>var ctx =${ctx}</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/article.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>

</head>
<body>
<div class="contenter">
    <div class="news-topnav">
        <div class="widthfix">
            <span  class="news-logo"><img src="${ctx}/static/img/CN_bilibiliB.png"></span>
            <span class="icon">
            </span>
        </div>
    </div>
    <div class="widthfix">
        <div class="news-body">
            <%--news--%>
            <div class="news-title">
                ${news.title}
            </div>
            <div class="news-inf">
                <span>
                        作者：${news.author.username}
                </span>
                <span>
                        发布时间：${news.createAt}
                </span>
                <span class="news-type">
                    ${news.type}
                </span>
            </div>
            <div class="news-content">
                ${news.content}
            </div>
            <%--news end--%>
            <!-- comment -->
            <div class="comment-body">
                <div class="comment-add">
                    <div class="avatar" style="background-image: url('${ctx}/static/img/indexPhoto.png')"></div>
                    <form action="${news.id}/createComment" method="POST"  class="comment-add-form">
                        <input type="hidden" name="newsId" value="${news.id}">
                        <textarea name="content"></textarea>
                        <p><input type="submit" value="发表" class="submit-btn"></p>
                    </form>
                </div>
                <%--comment list--%>
                <div class="comment-list">
                    <c:forEach var="comment" items="${commentList}">
                        <div class="comment-nav" id="comment-nav-${comment.level}">
                                <%--commentator inf--%>
                            <div class="avatar" style="background-image: url('${ctx}/static/img/indexPhoto.png')"></div>
                            <div class="comment-main">
                                <div class="comment-commentator">
                                        <span>
                                                ${comment.author.username}
                                        </span>
                                    <span>
                                            ${comment.createAt}
                                    </span>
                                    <span>
                                            ${comment.level}楼
                                        </span>
                                    <span class="reply-btn reply-btn-1" data-comment-level="${comment.level}" data-comment-id="${comment.id}" data-comment-author="${comment.author.username}">回复</span>
                                </div>
                                    <%-- commentator inf end--%>
                                    <%-- comment body--%>
                                <div class="comment-content">
                                    <div class="comment-text">
                                            ${comment.content}
                                    </div>
                                        <%--reply--%>
                                    <c:forEach var="reply" items="${comment.replies}">
                                        <div class="comment-reply">
                                            <div class="reply-textfield">
                                                <a>${reply.author.username}</a>:回复<span>${reply.father.author.username}</span>
                                                    ${reply.content}
                                            </div>
                                            <div class="reply-inf">
                                                    <span>
                                                            ${reply.createAt}
                                                    </span>
                                                <span>
                                                    ${reply.father.level}-${reply.level}楼
                                                     </span>
                                                <span class="reply-btn reply-btn-2" data-comment-level="${comment.level}" data-comment-id="${reply.id}" data-comment-author="${reply.author.username}">回复</span>
                                            </div>

                                        </div>
                                    </c:forEach>
                                    <div class="reply-form hide" id="reply-form-${comment.level}">
                                        <form action="${news.id}/createComment" method="post" class="reply-area" id="reply-area-${comment.level}">
                                            <input type="hidden" name="rootCommentId" value="${comment.id}">
                                            <textarea class="reply-text" id="reply-text-${comment.level}" name="content"></textarea>
                                            <p><input type="submit" value="发表" class="submit-btn"/></p>
                                        </form>

                                    </div>
                                        <%--reply end--%>
                                </div>
                                    <%--comment body end--%>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <%--comment list end--%>
            </div>
            <!-- comment end -->
        </div>
        <div class="">

        </div>
    </div>
</div>
</body>
<script src="${ctx}/static/js/article.js"></script>
</html>
