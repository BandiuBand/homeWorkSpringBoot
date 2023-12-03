<!DOCTYPE html>
<html>
    <head>
        <title>Гостьова книга</title>
    </head>

    <body>
    <h1>Залишити коментар</h1>
        <form action="/guestbook" method="post">
            <input type="text" name="name" placeholder="Ім'я">
            <textarea name="content" placeholder="Коментар"></textarea>
            <input type="button" value="Додати коментар">
        </form>
    <h1>Коментарі</h1>

    <table>
        <tr>
            <th>Автор</th>
            <th>Коментар</th>
            <th>Дата</th>
        </tr>
        <#list  comments as comment>
            <tr>
                <th>${comment.name}</th>
                <th>${comment.content}</th>
                <th>${comment.createDate}</th>
            </tr>
        </#list>
    </table>

    <#if currentPage > 0>
        <a href="/guestbook?pege=${currentPage - 1}">Попередня</a>
    </#if>
    <#if currentPage < totalPages - 1>
        <a href="/guestbook?pege=${currentPage + 1}">Наступна</a>
    </#if>

    </body>
</html>