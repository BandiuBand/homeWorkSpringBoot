<!DOCTYPE html>
<html lang="uk">
    <head>
        <meta charset="UTF-8">
        <title>Гостьова книга</title>
        <link rel="stylesheet" href="src/bootstrap-5.3.2-dist/bootstrap-5.3.2-dist/css/bootstrap.min.css">


    </head>

    <body>
    <h1>Залишити коментар</h1>
        <form action="/guestbook" method="post">

            <label>
                <input type="text" name="name" placeholder="Ім'я">
                <br>
            </label>

            <label>
                <textarea name="content" placeholder="Коментар"></textarea>
                <br>
            </label>
            <label>
                <select name="rating">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                <br>
            </label>
            <input type="submit" value="Додати коментар">
        </form>
    <h1>Коментарі</h1>

    <table>
        <tr>
            <th>Автор</th>
            <th>Коментар</th>
            <th>Оцінка</th>
            <th>Дата</th>
        </tr>
        <#list  comments as comment>
            <tr>
                <td>${comment.name}</td>
                <td>${comment.content}</td>
                <td>${comment.rating}</td>
                <td>${comment.createdDate}</td>
            </tr>
        </#list>
    </table>

    <#if (currentPage > 0)>
        <a href="/guestbook?page=${currentPage - 1}">Попередня</a>
    </#if>
    <#if ((currentPage+1) < (totalPages))>
        <a href="/guestbook?page=${currentPage + 1}">Наступна</a>
    </#if>

    <script src="src/main/resources/js/jquery-3.7.1.min.js"></script>
    <script src="src/bootstrap-5.3.2-dist/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
    </body>
</html>