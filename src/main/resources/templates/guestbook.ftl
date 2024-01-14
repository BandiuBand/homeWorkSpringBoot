<!DOCTYPE html>
<html lang="uk">
    <head>
        <meta charset="UTF-8">
        <title>Гостьова книга</title>
        <link rel="stylesheet" href="/bootstrap-5.3.2-dist/bootstrap-5.3.2-dist/css/bootstrap.min.css">


    </head>

    <body>
    <h1>Залишити коментар</h1>
        <form id="guestbookForm" action="/guestbook" method="post">

            <label >Ім'я
                <input id="username" type="text" name="name" placeholder="Ім'я">
            </label>
            <br>


            <label>Коментар
                <textarea id="comment" name="content" placeholder="Коментар"></textarea>
            </label>
            <br>
            <label>Оцінка
                <select id="rating" name="rating">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                <br>
            </label>
            <input id="submitButton" type="submit" value="Додати коментар">
        </form>
    <h1>Коментарі</h1>

    <table id="tableOfComment">
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

   <button id="loadMore">Показати більше</button>
    <script>function mark(ratingValue){
        switch (ratingValue) {
            case 1:
                return "Жахливо";
            case 2:
                return "Погано";
            case 3:
                return "Середнє";
            case 4:
                return "Непогано";
            case 5:
                return "Прекрасно";
        }
    }</script>
    <script src="/js/jquery-3.7.1.min.js"></script>
    <script src="/bootstrap-5.3.2-dist/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
    <script>
        page =0;
        $(document).ready(function () {
            $("#tableOfComment tr").each(function (index){
                if (index!== 0){
                    var ratingCell = $(this).find("td").eq(2);
                    var ratingValue = parseInt(ratingCell.text());
                    ratingCell.text(mark(ratingValue));
                }
            })
            $("#guestbookForm").submit(function (event){
                event.preventDefault();
                var formData = {
                  name: $("#username").val(),
                  content: $("#comment").val(),
                  rating: $("#rating").val()
                };

                $.ajax({
                    type: "POST",
                    url: "guestbook",
                    contentType: "application/json",
                    data: JSON.stringify(formData),
                    success: function (response){
                        renewCommentTable(response);
                        page = 0;
                    },
                    error: function (xhr, status, error){
                        console.error("Error: " + error);
                    }
                });

            });
        });
        $("#loadMore").click(function (){
            loadComments(page+1);
        });

        function loadComments(pageToLoad){
            $.ajax({
                type: "GET",
                url: "/guestbook/comments?page="+pageToLoad,
                success: function(response) {
                    renewCommentTable(response)
                    page++;
                    if ((page+1) >= ${totalPages})
                        $("#loadMore").hide();
                },
                error: function (xhr, status, error) {
                        console.error("Error:" + error);
                }
            });
        }
        function formatDateString(isoString){
            var date = new Date(isoString);
            return date.toLocaleString();
        }
        function renewCommentTable(comments){
            var headOfTable = "<tr>" +
                "<th>Автор</th>" +
                "<th>Коментар</th>" +
                "<th>Оцінка</th>" +
                "<th>Дата</th>" +
                "</tr>";
            $("#tableOfComment").empty();
            $("#tableOfComment").append(headOfTable);
            comments.forEach(function (comment){
                var row =   "<tr>" +
                            "<td>" + comment.name + "</td>" +
                            "<td>" + comment.content + "</td>" +
                            "<td>" + mark(comment.rating) + "</td>" +
                            "<td>" +  formatDateString(comment.createdDate) + "</td>" +
                            "</tr>";
                $("#tableOfComment").append(row);
            });
        }

    </script>
    </body>
</html>