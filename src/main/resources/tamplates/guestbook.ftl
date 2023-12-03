<!DOCTYPE html>
<html lang="uk">
    <head>
        <title>Гостьова книга</title>
    </head>

    <body>
    <h1>Залишити коментар</h1>
        <form action="/guestbook" method="post">

            <label>
                <input type="text" name="name" placeholder="Ім'я">
            </label>

            <label>
                <textarea name="content" placeholder="Коментар"></textarea>
            </label>
            <input type="submit" value="Додати коментар">
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
                <td>${comment.name}</td>
                <td>${comment.content}</td>
                <td>${comment.createDate}</td>
            </tr>
        </#list>
    </table>

    <#if currentPage > 0>
        <a href="/guestbook?page=${currentPage - 1}">Попередня</a>
    </#if>
    <#if currentPage < totalPages - 1>
        <a href="/guestbook?page=${currentPage + 1}">Наступна</a>
    </#if>

    </body>
</html>